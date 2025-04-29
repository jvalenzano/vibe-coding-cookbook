# vibe-tools Setup Guide

This guide provides instructions for setting up vibe-tools manually after cloning the repository.

## Prerequisites

- Node.js and npm installed
- Git installed
- Access to the terminal/command line

## Installation Steps

1. Navigate to the vibe-tools directory:
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

## Troubleshooting

If you encounter issues:

1. Make sure Node.js is installed and up to date
2. Check that you have the necessary permissions
3. Try removing the node_modules directory and reinstalling:
   ```bash
   rm -rf node_modules
   npm install
   npm link
   ```

## Updates

To update vibe-tools to the latest version:

```bash
cd ~/Development/AI-Tools/vibe-tools
git pull
npm install
npm link
```
