# JMusicBot-Gunther

A quick Docker Compose setup for running [jagrosh/MusicBot](https://github.com/jagrosh/MusicBot) or [SeVile/MusicBot](https://github.com/SeVile/MusicBot) with my preferred configuration.  
I call this one **Gunther** — because every good music bot needs a name.

## How it works
This repo contains:
- `compose.yaml` – the Docker Compose file for starting the bot
- `config/config.txt` – the main configuration file for your token, owner ID, and other settings

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/MedAziz218/JMusicBot-Gunther.git
   cd JMusicBot-Gunther
   ```

2. Edit the config file:

   ```bash
   nano config/config.txt
   ```

   * Set your Discord bot token:

     ```
     token = BOT_TOKEN_HERE
     ```
   * Set your Discord owner ID:

     ```
     owner = YOUR_USER_ID
     ```

   *(Links to the official wiki are in the config file above these lines if you need guidance.)*

3. Start the bot:

   ```bash
   docker compose up -d
   ```

4. Stop the bot:

   ```bash
   docker compose down --remove-orphans
   ```

5. View logs:

   ```bash
   docker logs jmusicbot -f
   ```

That’s it — a fast way to get JMusicBot running with a clean config.

---

## References

* [GitHub comment with Docker Compose approach](https://github.com/jagrosh/MusicBot/issues/1783#issuecomment-2694462400)


