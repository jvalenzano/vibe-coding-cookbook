---
layout: default
title: "Getting Started Guide"
nav_order: 4
has_children: true
permalink: /docs/getting-started
---
# Getting Started Guide

This guide will help you set up your environment and start using AI-assisted development tools.

## Prerequisites

- Basic familiarity with command line interfaces
- Git installed on your system
- Node.js and npm (for JavaScript projects)

## Installation Options

Choose one of the following options to get started:

### Option 1: Complete Development Environment

**Installation Steps:**

```bash
# Download the development environment setup script
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/setup-dev-environment.sh

# Make it executable
chmod +x setup-dev-environment.sh

# Run the script
./setup-dev-environment.sh
```

**This will:**
- Create directory structure for AI tools, projects, and templates
- Clone BMAD Method, CursorRIPER, and vibe-tools repositories
- Configure vibe-tools globally
- Initialize sample projects

### Option 2: Cookbook Repository Setup

**Installation Steps:**

```bash
# Download the vibe cookbook setup script
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/setup-vibe-cookbook.sh

# Make it executable
chmod +x setup-vibe-cookbook.sh

# Run the script
./setup-vibe-cookbook.sh vibe-coding-cookbook
```

**This will:**
- Create structured documentation repository
- Set up examples, templates, and image directories
- Add GitHub-ready configuration

