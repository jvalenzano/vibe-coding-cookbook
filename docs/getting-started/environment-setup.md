---
layout: default
title: Environment Setup
parent: Getting Started Guide
nav_order: 2
permalink: /docs/getting-started/environment-setup
---

# Environment Setup

This guide covers setting up your development environment for Vibe Coding.

### Prerequisites

- An AI assistant capable of using these prompts (Claude, GPT-4, Gemini, etc.)
- Optional burt HIGHLY Recommended: Access to [Deep Research AI](https://bytebridge.medium.com/comparing-leading-ai-deep-research-tools-chatgpt-google-perplexity-kompas-ai-and-elicit-59678c511f18)
- Basic understanding of Cursor / Windsurf / Replit / Cline / Roo / CoPilot Agent
- A software product or project idea you want to build with AI

### How to Use with your UI or IDE of choice

#### Gemini (Google)

- Configure a Custom Gem for each mode you want to use. For example, I recommend before even going into your IDE set up the ba, pm and ux Gems at a minimum, also potentially the architect. Especially if you intend to use deep research (which you might as well with it be so great) - you will want to make use of the custom modes in Gemini.

#### Cursor

- Ensure you have Custom Modes (Beta) turned on in your cursor options
- Create the Custom Modes for each of your intended agents, going into the advanced options to give them custom prompts (copied and modified as needed from the ./custom-mode-prompts folder)

#### RooCode

- Follow this [guide](https://publish.obsidian.md/aixplore/AI+Systems+%26+Architecture/custom-modes-quick-start) along with the prompts (copied and modified as needed from the ./custom-mode-prompts folder)

#### Other IDEs

Other IDEs do not yet seem to have the exact same way of creating custom modes - but you can still use this methodology through rules, plan/act modes, and using the mode prompts as a prompt to start a new chat session.


## System Requirements

- **Operating System**: Windows 10+, macOS 10.15+, or Linux
- **Memory**: 8GB RAM (16GB recommended)
- **Disk Space**: At least 2GB free space
- **Software**: Git, Node.js 14+

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/jvalenzano/vibe-coding-cookbook.git
cd vibe-coding-cookbook
```

### Step 2: Run the Setup Script

```bash
./scripts/setup-dev-environment.sh
```

This script will:
- Create directory structure for AI tools, projects, and templates
- Clone BMAD Method, CursorRIPER, and vibe-tools repositories
- Configure vibe-tools globally
- Initialize sample projects

### Step 3: Verify Installation

After installation, verify that everything is set up correctly:

```bash
vibe-tools --version
```

You should see the version number displayed if the installation was successful.

## IDE Integration

The Vibe Coding tools work with any text editor or IDE, but we recommend:

- **VS Code** with the "AI Companion" extension
- **JetBrains IDEs** with the "AI Assistant" plugin
- **Cursor Editor** for native AI integration

## Configuration

You can customize your setup by editing the configuration files:

### vibe-tools Configuration

Create a `vibe-tools.config.json` file in your project root:

```json
{
  "defaultModel": "claude-3-opus-20240229",
  "apiKey": "<your-api-key>",
  "outputFormat": "markdown"
}
```

### BMAD Method Configuration

The BMAD Method custom prompts are located in `AI-Tools/BMAD-METHOD/custom-mode-prompts/`.

### CursorRIPER Configuration

CursorRIPER configuration is located in `AI-Tools/CursorRIPER/src/templates/`.

## Troubleshooting

If you encounter any issues during setup:

1. Make sure you have the latest version of Git and Node.js
2. Check the logs in `~/.vibe-tools/logs`
3. Try running the setup script with verbose logging: `./scripts/setup-dev-environment.sh --verbose`

## Next Steps

Now that your environment is set up, learn how to [create your first AI-assisted project](./first-project).
