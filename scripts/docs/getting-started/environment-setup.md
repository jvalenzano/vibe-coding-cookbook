---
layout: default
title: Environment Setup
parent: Getting Started
nav_order: 1
---

# Environment Setup

This guide covers setting up your development environment for Vibe Coding.

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

### Step 3: Verify Installation

```bash
vibe-tools --version
```

You should see the version number displayed if the installation was successful.

## Troubleshooting

If you encounter any issues during setup:

1. Make sure you have the latest version of Git and Node.js
2. Check the logs in `~/.vibe-tools/logs`
3. Try running the setup script with verbose logging: `./scripts/setup-dev-environment.sh --verbose`

## IDE Integration

The Vibe Coding tools work with any text editor or IDE, but we recommend:

- **VS Code** with the "AI Companion" extension
- **JetBrains IDEs** with the "AI Assistant" plugin
- **Cursor Editor** for native AI integration

## Next Steps

Now that your environment is set up, learn how to [create your first AI-assisted project](./first-project).
