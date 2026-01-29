# GitHub Fork and Remote Setup Instructions

## Overview
Before pushing this repository to GitHub, you need to create your own fork of the original llmcord repository and update your local git remote to point to your fork.

## Step-by-Step Instructions

### 1. Create Your Fork on GitHub

1. Go to the original llmcord repository: https://github.com/jakobdylanc/llmcord
2. Click the **"Fork"** button in the top-right corner
3. Choose your GitHub account as the destination
4. Wait for GitHub to create the fork (this takes a few seconds)
5. You'll be redirected to your new fork at: `https://github.com/[YOUR_USERNAME]/llmcord`

### 2. Update Your Local Git Remote

Now you need to tell your local repository to push to YOUR fork instead of the original repo.

Open a terminal in the llmcord directory and run:

```bash
# Check current remote (should show jakobdylanc's repo)
git remote -v

# Update remote to point to YOUR fork
git remote set-url origin https://github.com/[YOUR_USERNAME]/llmcord.git

# Verify the change
git remote -v
```

Replace `[YOUR_USERNAME]` with your actual GitHub username.

**Example:**
If your GitHub username is `luandev`, the command would be:
```bash
git remote set-url origin https://github.com/luandev/llmcord.git
```

### 3. Verify Everything is Ready

Before pushing, do a final security check:

```bash
# Verify config.yaml is NOT tracked
git status

# Should show "working tree clean" or only show new files like SETUP.md
# Should NOT show config.yaml
```

```bash
# Verify config.yaml is in .gitignore
git check-ignore -v config.yaml

# Should output: .gitignore:3:*	config.yaml
```

### 4. Push to Your Fork

Now you can safely push to GitHub:

```bash
git push -u origin main
```

If this is your first push, you may be prompted to authenticate with GitHub.

### 5. Verify on GitHub

1. Go to your fork on GitHub: `https://github.com/[YOUR_USERNAME]/llmcord`
2. Verify these files are present:
   - ✅ SETUP.md
   - ✅ GITHUB_SETUP.md
   - ✅ setup.sh
   - ✅ setup.bat
   - ✅ Updated README.md
3. Verify this file is NOT present:
   - ❌ config.yaml (should not be visible!)

### 6. Add Collaborators

To give your friends access to the repository:

1. On your GitHub fork, go to **Settings** → **Collaborators**
2. Click **"Add people"**
3. Enter each friend's GitHub username
4. Click **"Add [username] to this repository"**
5. They'll receive an email invitation to accept

### 7. Share Repository with Friends

Send your friends:
1. **Repository URL:** `https://github.com/[YOUR_USERNAME]/llmcord`
2. **Setup instructions:** Point them to SETUP.md in the repo
3. **Credentials:** Share via secure method (Signal, encrypted password manager, etc.)
   - See the "Credentials Sharing Guide" section in SETUP.md

## Alternative: SSH Instead of HTTPS

If you prefer to use SSH for git operations:

```bash
# Set remote to SSH URL
git remote set-url origin git@github.com:[YOUR_USERNAME]/llmcord.git

# Verify
git remote -v

# Push
git push -u origin main
```

Note: This requires you to have SSH keys set up with GitHub.

## Troubleshooting

### "Permission denied" when pushing
- Make sure you're pushing to YOUR fork, not the original repo
- Check that you've authenticated with GitHub (may need personal access token)
- Verify the remote URL is correct: `git remote -v`

### "config.yaml appears in the repository"
- STOP! Do not continue
- This means config.yaml was accidentally committed
- Run: `git rm --cached config.yaml`
- Commit the removal: `git commit -m "Remove config.yaml from tracking"`
- Then follow the git history cleaning steps in the main plan

### Fork is out of sync with original repo
- This is okay! Your fork is meant to diverge from the original
- Only sync if you want to pull in updates from the original llmcord project
- To sync: Add original as upstream, fetch, and merge (see GitHub's fork sync documentation)

## Keeping Your Fork Updated (Optional)

If you want to pull in updates from the original llmcord repository later:

```bash
# Add original repo as upstream (one-time setup)
git remote add upstream https://github.com/jakobdylanc/llmcord.git

# Fetch updates from original repo
git fetch upstream

# Merge updates into your main branch
git merge upstream/main

# Push updates to your fork
git push origin main
```

**Warning:** Merging upstream changes may conflict with your modifications (like README changes). You'll need to resolve conflicts manually.

## Next Steps

After completing this setup:
1. ✅ Your code is safely on GitHub
2. ✅ config.yaml with secrets is NOT on GitHub
3. ✅ Collaborators can be added
4. ✅ Ready to share with friends

Now you can share the repository URL and credentials with your collaborators!
