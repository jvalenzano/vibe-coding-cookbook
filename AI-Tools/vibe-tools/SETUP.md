# vibe-tools Setup Guide

This repository contains vibe-tools, a CLI utility for enhancing AI capabilities in development environments.

## Manual Installation (Recommended)

To install vibe-tools for use in your projects:

1. Navigate to this directory:
   ```bash
   cd ~/Development/AI-Tools/vibe-tools
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Link the package globally:
   ```bash
   npm link
   ```

4. Test the installation:
   ```bash
   vibe-tools --version
   ```

5. Configure vibe-tools:
   ```bash
   vibe-tools install
   ```

## API Key Configuration

You'll need to set up API keys for the AI services you plan to use:

- For Anthropic (Claude): Set the `ANTHROPIC_API_KEY` environment variable
- For OpenAI: Set the `OPENAI_API_KEY` environment variable
- For Google: Set the `GEMINI_API_KEY` environment variable
- For Perplexity: Set the `PERPLEXITY_API_KEY` environment variable

Add these to your shell configuration file (~/.bashrc, ~/.zshrc, etc.) for persistence.

## Updates

To update vibe-tools to the latest version:

```bash
cd ~/Development/AI-Tools/vibe-tools
git pull
npm install
npm link
```
