# Setup Instructions for Collaborators

## Overview
This is a shared Discord bot that can be hosted by any collaborator when needed. We all use the same Discord bot tokens and API keys, so anyone can run the bot on their machine.

## Prerequisites
- **Python 3.8+** installed on your system
- **Git** installed
- Access to shared credentials (contact Luan privately)

## Quick Setup

### 1. Clone the Repository
```bash
git clone https://github.com/[YOUR_USERNAME]/llmcord.git
cd llmcord
```

### 2. Create Virtual Environment
```bash
python3 -m venv venv
```

### 3. Activate Virtual Environment
**macOS/Linux:**
```bash
source venv/bin/activate
```

**Windows:**
```cmd
venv\Scripts\activate
```

### 4. Install Dependencies
```bash
pip install -r requirements.txt
```

### 5. Set Up Configuration File
```bash
# Copy the example config
cp config-example.yaml config.yaml
```

### 6. Get Shared Credentials
Contact Luan privately to get the shared credentials. You'll need:
- Discord bot token
- Discord client ID
- Google API key
- Any other API keys for providers you want to use

**IMPORTANT:** These will be shared via a secure method (Signal, encrypted password manager, etc.), NOT via GitHub or regular chat.

### 7. Edit Configuration
Open `config.yaml` in your text editor and paste in the credentials you received. The file structure will already be set up from the example template.

### 8. Run the Bot
```bash
python llmcord.py
```

The bot should now start up and connect to Discord!

## Troubleshooting

### Virtual Environment Issues
If you have trouble activating the virtual environment:
- Make sure you're in the `llmcord` directory
- On Windows, you may need to run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Missing Dependencies
If you get import errors, make sure your virtual environment is activated and run:
```bash
pip install -r requirements.txt --upgrade
```

### Bot Won't Connect
- Verify your Discord bot token is correct in `config.yaml`
- Check that the bot is invited to your Discord server with proper permissions
- Look for error messages in the console output

## When You're Done Hosting

When you shut down the bot (Ctrl+C), simply deactivate the virtual environment:
```bash
deactivate
```

Someone else can then start hosting it on their machine by following these same steps.

## CRITICAL Security Notes

⚠️ **NEVER commit `config.yaml` to GitHub** ⚠️

The `.gitignore` file is already configured to prevent this, but be aware:
- Do NOT run `git add config.yaml`
- Do NOT run `git add .` or `git add -A` and force-add ignored files
- The `config.yaml` file contains sensitive credentials that must stay private

If you accidentally commit credentials:
1. Stop immediately and don't push
2. Contact Luan for help cleaning the git history
3. All credentials will need to be rotated (new tokens generated)

## Credentials Sharing Guide

### What Needs to Be Shared

When setting up a new collaborator, they will need the following credentials from `config.yaml`:

1. **Discord Bot Token** (Line 3 in config.yaml)
   - Format: Long alphanumeric string
   - Used for: Connecting the bot to Discord

2. **Discord Client ID** (Line 4 in config.yaml)
   - Format: Numeric string
   - Used for: Bot identification and OAuth

3. **Google API Key** (Line 41 in config.yaml, under providers)
   - Format: Alphanumeric string starting with "AIza..."
   - Used for: Accessing Google Gemini models

4. **Additional API Keys** (if configured)
   - Any other provider API keys you've added
   - Check the `providers` section of your config.yaml

5. **System Prompt Personal Info** (Optional, Line 84 in config.yaml)
   - Discord user IDs mentioned in system_prompt
   - Only needed if you want the bot to recognize specific users

### Secure Sharing Methods (RECOMMENDED)

Choose ONE of these methods to share credentials:

**Best Options:**
1. **Signal or Telegram** (with disappearing messages enabled)
   - Send credentials as text messages
   - Enable auto-delete after viewing
   - Most convenient for quick sharing

2. **Encrypted Password Manager Shared Vault**
   - 1Password, Bitwarden, LastPass
   - Create a shared vault/collection
   - Add all credentials as secure notes
   - Grant access to collaborators

3. **Keybase**
   - End-to-end encrypted chat
   - File sharing with encryption
   - Good for technical users

**Acceptable Options:**
4. **GPG-Encrypted Email**
   - Encrypt config.yaml with recipient's public key
   - Send via email
   - Requires GPG setup on both ends

5. **In-Person or Screen Share**
   - Show credentials over video call
   - Have them type it directly into their config.yaml
   - No digital trace left behind

### Insecure Methods (NEVER USE)

❌ **DO NOT share via:**
- Regular email (unencrypted)
- Discord messages (even DMs)
- SMS text messages
- GitHub (issues, PRs, commit messages, wikis)
- Slack or similar workplace chat
- Pastebin or similar text sharing sites
- Google Docs or cloud documents
- Social media DMs

### Example: Sharing via Signal

1. Open Signal and create a group or DM with the new collaborator
2. Enable disappearing messages (Settings → 1 hour or less)
3. Send a message like:

```
llmcord Bot Credentials:

Discord Bot Token:
[paste token here]

Discord Client ID:
[paste client ID here]

Google API Key:
[paste API key here]

Instructions: Copy these into your config.yaml file after running setup.
See SETUP.md in the repo for full instructions.
```

4. Confirm they've saved it to their config.yaml
5. Messages will auto-delete after the timer expires

### When Credentials Are Compromised

If credentials are accidentally exposed publicly:

1. **Immediately rotate all credentials:**
   - Generate new Discord bot token at discord.com/developers
   - Generate new API keys from each provider
   - Update everyone's config.yaml with new credentials

2. **Revoke old credentials:**
   - Delete old bot tokens from Discord developer portal
   - Delete old API keys from provider dashboards

3. **Review what was exposed:**
   - Check git history if committed
   - Check browser history/cache if pasted in browser
   - Review any logs or screenshots

4. **Notify all collaborators:**
   - Let everyone know credentials changed
   - Share new credentials via secure method
   - Explain what happened to prevent future incidents

## Sharing With New Collaborators

If you want to invite someone new:
1. They need to be added as a GitHub collaborator (ask Luan or do it yourself if you have access)
2. Share the credentials with them using one of the secure methods above
3. Send them a link to this SETUP.md file

## Using Automated Setup Scripts

For convenience, you can use the automated setup scripts:

**macOS/Linux:**
```bash
chmod +x setup.sh
./setup.sh
```

**Windows:**
```cmd
setup.bat
```

These scripts will automatically:
- Create the virtual environment
- Activate it
- Install dependencies
- Copy the config template

You'll still need to edit `config.yaml` with the actual credentials manually.

## Additional Configuration

Once you have the bot running, you can customize:
- **Allowed channels** - Edit the `allowed_channel_ids` in `config.yaml`
- **System prompts** - Customize the bot's personality and behavior
- **Model providers** - Add or remove AI model providers
- **Plugins** - Enable/disable available plugins

See the [original llmcord documentation](https://github.com/jakobdylanc/llmcord) for advanced configuration options.

## Getting Help

If you run into issues:
1. Check the Troubleshooting section above
2. Ask in the group chat
3. Check the [original llmcord repo](https://github.com/jakobdylanc/llmcord) for documentation
4. Look for similar issues in the GitHub issues section
