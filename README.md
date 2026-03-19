# JMusicBot-Gunther

A quick Docker Compose setup for running [jagrosh/MusicBot](https://github.com/jagrosh/MusicBot) with my preferred configuration.  
I call this one **Gunther** — because every good music bot needs a name.

## Contents
This repo contains:
- `docker-compose.yml` – the Docker Compose file for starting the bot.
- `Dockerfile` – defines a docker image to run jmusicbot application.
- `config/config.txt` – bot configs such as prefixes and shortcuts are set here.

## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/MedAziz218/JMusicBot-Gunther.git
   cd JMusicBot-Gunther
   ```

2. set env variables:

   * Create .env file containing your `DISCORD_BOT_TOKEN` and `DISCORD_OWNER_ID` :
   ```bash
   echo -e "DISCORD_BOT_TOKEN=<TOKEN>\nDISCORD_OWNER_ID=<OWNER_ID>" > .env
   ```
   *(How to find [DISCORD_BOT_TOKEN](https://jmusicbot.com/getting-a-bot-token/), How to find [DISCORD_OWNER_ID](https://github.com/jagrosh/MusicBot/wiki/Finding-Your-User-ID/))*


3. Start the bot:

   ```bash
   docker compose up -d --build
   ```

4. View logs:

   ```bash
   docker logs jmusicbot -f
   ```

5. Stop the bot:

   ```bash
   docker compose down --remove-orphans
   ```

That’s it — a fast way to get JMusicBot running with a clean config.

---


## Debugging
* view bot logs
   ```bash
   docker logs jmusicbot -f
   ```
* user cloudflare warp vpn (can help with youtube bot detection but will cause high ping)
   ```bash
   docker compose -f docker-compose.yml -f docker-compose.warp.yml up -d
   ```
* check if warp is working
   ```bash
   docker exec -it jmusicbot curl https://www.cloudflare.com/cdn-cgi/trace
   ```
## References

* [JMusicBot wiki](https://jmusicbot.com/)
* [yojoshb/jmusicbot-docker](https://github.com/yojoshb/jmusicbot-docker)
* [GitHub comment with Docker Compose approach](https://github.com/jagrosh/MusicBot/issues/1783#issuecomment-2694462400)
* [\[19/03/2026\] latest working fork](https://github.com/jagrosh/MusicBot/issues/1851#issuecomment-3939107026)
