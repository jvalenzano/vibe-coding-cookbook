---
layout: default
title: Scripts
parent: Resources
nav_order: 1
---

# Scripts

Utility scripts to help you automate common tasks in your Vibe Coding workflow.

## Setup Scripts

| Script | Description | Usage |
|--------|-------------|-------|
| [setup-dev-environment.sh](https://github.com/jvalenzano/vibe-coding-cookbook/blob/main/scripts/setup-dev-environment.sh) | Sets up a complete development environment | `./setup-dev-environment.sh` |
| [setup-vibe-cookbook.sh](https://github.com/jvalenzano/vibe-coding-cookbook/blob/main/scripts/setup-vibe-cookbook.sh) | Bootstraps the cookbook repository | `./setup-vibe-cookbook.sh [name]` |

## Project Scripts

| Script | Description | Usage |
|--------|-------------|-------|
| [init-project.sh](https://github.com/jvalenzano/vibe-coding-cookbook/blob/main/scripts/init-project.sh) | Initializes a new project from a template | `./init-project.sh [name] [template]` |

## Using Scripts

All scripts are designed to be run from the command line. Before using a script, make sure to:

1. Download the script to your local machine
2. Make it executable with `chmod +x script-name.sh`
3. Run the script with `./script-name.sh`

## Example

```bash
# Download the development environment setup script
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/setup-dev-environment.sh

# Make it executable
chmod +x setup-dev-environment.sh

# Run the script
./setup-dev-environment.sh
```

## Creating Your Own Scripts

Feel free to modify these scripts or create your own to automate repetitive tasks in your workflow. Some ideas for custom scripts:

- Automated testing and QA processes
- Project scaffolding for your specific tech stack
- Documentation generation
- Deployment automation
