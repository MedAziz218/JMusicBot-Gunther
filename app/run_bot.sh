#!/bin/bash

# Define the expected filename based on the environment variable
EXPECTED_JAR="JMusicBot-${BOT_VERSION}.jar"

# 1. Check if we already have it
if [ -f "$EXPECTED_JAR" ]; then
    echo "--- Found $EXPECTED_JAR locally. Skipping GitHub API. ---"
else
    echo "--- $EXPECTED_JAR not found. Starting Download Process ---"

    # Determine API URL
    if [ "$BOT_VERSION" = "latest" ]; then
      API_URL="https://api.github.com/repos/${BOT_GITHUB}/releases/latest"
    else
      API_URL="https://api.github.com/repos/${BOT_GITHUB}/releases/tags/${BOT_VERSION}"
    fi

    # Fetch Release Data
    RELEASE_JSON=$(curl --silent "$API_URL")

    # Check for GitHub Rate Limits
    if echo "$RELEASE_JSON" | grep -q "message"; then
        echo "ERROR: GitHub API limit reached or version invalid."
        echo "Full Response: $RELEASE_JSON"
        exit 1
    fi

    # Extract Download URL
    DOWNLOAD_URL=$(echo "$RELEASE_JSON" | grep -Po '"browser_download_url":\s*"\Khttps://[^"]*JMusicBot[^"]*\.jar' | head -n 1)

    if [ -z "$DOWNLOAD_URL" ]; then
        echo "ERROR: Could not find a .jar asset for version $BOT_VERSION"
        exit 1
    fi

    echo "Downloading from: $DOWNLOAD_URL"
    
    # --show-progress: Forces the progress bar even in non-interactive shells
    # --progress=dot:giga: Keeps logs clean by printing a dot for every MB/GB
    if ! wget --show-progress --progress=dot:giga "$DOWNLOAD_URL" -O "$EXPECTED_JAR"; then
        echo "ERROR: Download failed. Check your internet connection."
        rm -f "$EXPECTED_JAR" # Remove partial download
        exit 1
    fi
    
    echo "--- Download Complete: $EXPECTED_JAR ---"
fi

# 2. Run the Bot
echo "--- Launching JMusicBot $EXPECTED_JAR---"
java -Dtoken="${BOT_TOKEN}" \
     -Downer=${OWNER_ID} \
     -Dnogui=true \
     -Dconfig=/config/config.txt \
     -jar "$EXPECTED_JAR"