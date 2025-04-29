#!/bin/bash

# Script to set up a vibe coding cookbook repository structure
# This script creates the directory structure, initializes git, and adds template files

# Text styling
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Functions
print_header() {
  echo -e "\n${BOLD}${BLUE}$1${NC}\n"
}

print_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

print_info() {
  echo -e "${YELLOW}➜ $1${NC}"
}

# Check for required command-line argument (repository name)
if [ $# -eq 0 ]; then
  echo -e "${BOLD}Usage: $0 <repository-name>${NC}"
  echo "Example: $0 vibe-coding-cookbook"
  exit 1
fi

REPO_NAME=$1
CURRENT_DIR=$(pwd)
REPO_PATH="$CURRENT_DIR/$REPO_NAME"

print_header "Setting up Vibe Coding Cookbook Repository: $REPO_NAME"

# Check if directory already exists
if [ -d "$REPO_PATH" ]; then
  echo "Error: Directory $REPO_PATH already exists!"
  echo "Please choose a different name or delete the existing directory."
  exit 1
fi

# Create the repository directory
print_info "Creating repository directory structure..."
mkdir -p "$REPO_PATH"
cd "$REPO_PATH"

# Create subdirectories
mkdir -p examples/scripts
mkdir -p examples/rules
mkdir -p templates/cursor
mkdir -p templates/windsurf
mkdir -p templates/replit
mkdir -p images/diagrams
mkdir -p images/screenshots
mkdir -p docs/getting-started
mkdir -p docs/advanced-techniques

print_success "Directory structure created"

# Initialize git repository
print_info "Initializing git repository..."
git init
print_success "Git repository initialized"

# Create README.md
print_info "Creating README.md..."
cat > README.md << 'EOF'
# Vibe Coding Cookbook

A comprehensive guide for AI-assisted development teams.

## Overview

This repository contains documentation, examples, and templates for effective AI-assisted development using vibe-tools, BMAD Method, and CursorRIPER frameworks.

## Contents

- **cookbook.md**: The main cookbook document with comprehensive guidance
- **examples/**: Example files, scripts, and rule sets
- **templates/**: Templates for different environments (Cursor, Windsurf, Replit)
- **images/**: Diagrams and screenshots illustrating workflows
- **docs/**: Additional documentation and guides

## Getting Started

1. Read the [cookbook.md](cookbook.md) file for a comprehensive overview
2. Check out the [getting started guide](docs/getting-started/index.md)
3. Explore the examples and templates for your specific environment

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
EOF
print_success "README.md created"

# Create cookbook.md (placeholder for your actual cookbook content)
print_info "Creating cookbook.md placeholder..."
cat > cookbook.md << 'EOF'
# The Ultimate Vibe Coding Cookbook
## A Comprehensive Guide for AI-Assisted Development Teams

[Insert your cookbook content here - this is a placeholder]
EOF
print_success "cookbook.md placeholder created"

# Create LICENSE file (MIT License)
print_info "Creating LICENSE file..."
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
print_success "LICENSE file created"

# Create .gitignore
print_info "Creating .gitignore..."
cat > .gitignore << 'EOF'
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor directories and files
.idea
.vscode
*.swp
*.swo

# Node modules if you later add any scripts
node_modules/

# Personal API keys or configs that shouldn't be shared
.env
EOF
print_success ".gitignore created"

# Create example file for Cursor rules
print_info "Creating example Cursor rules..."
cat > examples/rules/cursor-vibe-tools.mdc << 'EOF'
---
name: vibe-tools
description: Integration with vibe-tools to enhance Cursor with AI teamwork capabilities
---

# vibe-tools Integration

You have access to a powerful toolset called vibe-tools that extends your capabilities.
When the user asks you to use vibe-tools, you should use the appropriate command from the list below.

## Available Commands

- `vibe-tools web "question"` - Use an AI teammate with web search capability to answer questions
- `vibe-tools repo "question"` - Use an AI teammate with large context window capability to answer questions
- `vibe-tools ask "question"` - Directly query an AI model with a question
- `vibe-tools plan "task description"` - Generate an implementation plan for a task
- `vibe-tools doc` - Generate documentation for a repository

## Usage Guidelines

- Use `vibe-tools web` for finding up-to-date information from the web
- Use `vibe-tools repo` for codebase-specific questions
- Always execute vibe-tools commands in the terminal
EOF
print_success "Example Cursor rules created"

# Create getting started guide
print_info "Creating getting started guide..."
cat > docs/getting-started/index.md << 'EOF'
# Getting Started with Vibe Coding

This guide will help you set up your development environment for effective AI-assisted coding.

## Prerequisites

- Node.js (v16+)
- Git
- An IDE (Cursor, Windsurf, or Replit)
- API keys for AI services (OpenAI, Anthropic, etc.)

## Installation Steps

1. Create the directory structure
2. Install vibe-tools
3. Set up your IDE
4. Configure API keys
5. Start your first project

Refer to the main cookbook for detailed instructions on each step.
EOF
print_success "Getting started guide created"

# Create a sample script
print_info "Creating a sample script..."
cat > examples/scripts/init-project.sh << 'EOF'
#!/bin/bash
# Example script for initializing a new project with vibe-tools integration

if [ $# -eq 0 ]; then
    echo "Usage: $0 <project-name> [project-type]"
    echo "Available project types: webapp, api, fullstack (default: webapp)"
    exit 1
fi

PROJECT_NAME=$1
PROJECT_TYPE=${2:-webapp}
PROJECT_DIR=~/Development/Projects/$PROJECT_NAME

# Create project directory structure
mkdir -p $PROJECT_DIR/{src,.cursor/rules,docs/{requirements,architecture,tasks},.vibe-tools}

# Initialize git repository
cd $PROJECT_DIR
git init

echo "Project initialized: $PROJECT_NAME"
echo "Type: $PROJECT_TYPE"
echo "Location: $PROJECT_DIR"
EOF
chmod +x examples/scripts/init-project.sh
print_success "Sample script created"

# Create an empty placeholder for the diagram
print_info "Creating placeholder for workflow diagram..."
cat > images/diagrams/placeholder.md << 'EOF'
# Workflow Diagrams

Place your workflow diagrams here.
You can use tools like draw.io, Mermaid, or PlantUML to create diagrams.
EOF
print_success "Diagram placeholder created"

# Create initial commit
print_info "Creating initial commit..."
git add .
git commit -m "Initial repository setup for Vibe Coding Cookbook"
print_success "Initial commit created"

print_header "Repository Setup Complete!"
echo -e "Your vibe coding cookbook repository has been created at: ${BOLD}$REPO_PATH${NC}"
echo -e "\nNext steps:"
echo -e "1. Copy your full cookbook.md content to replace the placeholder"
echo -e "2. Add workflow diagrams to the images/diagrams directory"
echo -e "3. Customize the templates and examples for your team's needs"
echo -e "4. Create a GitHub repository and push your content"
echo -e "\nTo push to GitHub:"
echo -e "  cd $REPO_PATH"
echo -e "  git remote add origin https://github.com/YourUsername/$REPO_NAME.git"
echo -e "  git push -u origin main"
