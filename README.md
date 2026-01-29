<h1 align="center">winbot</h1>

<h3 align="center"><i>
  A discord bot that keeps your friend group accountable on their daily goals!
</i></h3>

## For Collaborators

This repository contains a shared Discord bot for our friend group.

**Quick start:**
1. Clone this repo
2. Run the setup script (`setup.sh` or `setup.bat`)
3. Get credentials from Luan privately
4. Edit `config.yaml` with the credentials
5. Run `python winbot.py`

**IMPORTANT:** Never commit `config.yaml` - it contains sensitive credentials.

## Setup

### Prerequisites
- Python 3.8+
- Discord bot token (get from Luan or create at [discord.com/developers](https://discord.com/developers/applications))

### Running the bot

**Without Docker:**
```bash
python -m pip install -U -r requirements.txt
python winbot.py
```

**With Docker:**
```bash
docker compose up
```

## Configuration

Edit `config.yaml` to configure:
- `bot_token` - Your Discord bot token
- `client_id` - Your Discord application client ID
- `status_message` - Custom status message for the bot
- `permissions` - Control who can use the bot
