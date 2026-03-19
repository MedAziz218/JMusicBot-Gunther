FROM bitnami/minideb:bullseye

# Install dependencies
RUN install_packages openjdk-17-jre-headless wget curl grep ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Documentation for users
VOLUME ["/config", "/app"]

ENV BOT_VERSION="latest"
ENV BOT_GITHUB="jagrosh/MusicBot"

STOPSIGNAL SIGTERM

# Use 'sh' to execute the script. 
# This bypasses the need for the +x permission bit on the script itself.
CMD ["bash", "./run_bot.sh"]
