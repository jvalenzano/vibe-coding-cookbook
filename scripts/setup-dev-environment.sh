#!/bin/bash

# Script to set up the complete AI-Enhanced Development Environment
# Creates the directory structure, clones reference repositories, and sets up configs
# Version 2.0 - Fixed vibe-tools handling

# Text styling
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
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

print_warning() {
  echo -e "${YELLOW}! $1${NC}"
}

print_error() {
  echo -e "${RED}✗ $1${NC}"
}

check_command() {
  if ! command -v $1 &> /dev/null; then
    print_warning "$1 is not installed. Some features may be limited."
    echo "  $2"
    return 1
  fi
  return 0
}

# Check for required dependencies
print_header "Checking dependencies..."
check_command "git" "Install Git from https://git-scm.com/downloads" || exit 1

# Optional: Check for gh CLI
if ! command -v gh &> /dev/null; then
  print_warning "GitHub CLI (gh) is not installed. It's recommended for repository creation."
  print_warning "Install it from https://cli.github.com/ for easier GitHub integration."
  GH_INSTALLED=false
else
  print_success "GitHub CLI is installed."
  GH_INSTALLED=true
fi

# Check for Node.js
if ! command -v node &> /dev/null; then
  print_warning "Node.js is not installed. Some features may be limited."
  print_warning "Install it from https://nodejs.org/ for full functionality."
  NODE_INSTALLED=false
else
  print_success "Node.js is installed."
  NODE_INSTALLED=true
fi

# Define paths
DEFAULT_DEV_DIR="$HOME/Development"

# Ask for base development directory
print_header "Configuration"
read -p "Enter base development directory path [$DEFAULT_DEV_DIR]: " DEV_DIR
DEV_DIR=${DEV_DIR:-$DEFAULT_DEV_DIR}

# Create the base directory structure
print_header "Setting up directory structure at $DEV_DIR"

mkdir -p "$DEV_DIR"
cd "$DEV_DIR"

# Create main directories
print_info "Creating main directories..."
mkdir -p "AI-Tools/custom-rules/cursor"
mkdir -p "AI-Tools/custom-rules/windsurf"
mkdir -p "AI-Tools/custom-rules/shared"
mkdir -p "Projects"
mkdir -p "Templates/react-app"
mkdir -p "Templates/node-api"
mkdir -p "Templates/fullstack"
mkdir -p "Shared/api-docs"
mkdir -p "Shared/style-guides"
mkdir -p "Shared/common-libs"
mkdir -p "Shared/prompts"

print_success "Main directory structure created"

# Clone reference repositories
print_header "Cloning reference repositories..."

print_info "Cloning BMAD Method repository..."
if git clone https://github.com/bmadcode/BMAD-METHOD.git "$DEV_DIR/AI-Tools/BMAD-METHOD" 2>/dev/null; then
  print_success "BMAD Method repository cloned successfully"
else
  print_warning "Failed to clone BMAD Method repository"
  mkdir -p "$DEV_DIR/AI-Tools/BMAD-METHOD"
  echo "# BMAD Method\nPlaceholder for BMAD Method framework. Clone from https://github.com/bmadcode/BMAD-METHOD" > "$DEV_DIR/AI-Tools/BMAD-METHOD/README.md"
fi

print_info "Cloning CursorRIPER repository..."
if git clone https://github.com/johnpeterman72/CursorRIPER.git "$DEV_DIR/AI-Tools/CursorRIPER" 2>/dev/null; then
  print_success "CursorRIPER repository cloned successfully"
else
  print_warning "Failed to clone CursorRIPER repository"
  mkdir -p "$DEV_DIR/AI-Tools/CursorRIPER"
  echo "# CursorRIPER\nPlaceholder for CursorRIPER framework. Clone from https://github.com/johnpeterman72/CursorRIPER" > "$DEV_DIR/AI-Tools/CursorRIPER/README.md"
fi

print_info "Cloning vibe-tools repository..."
if git clone https://github.com/eastlondoner/cursor-tools.git "$DEV_DIR/AI-Tools/vibe-tools" 2>/dev/null; then
  print_success "vibe-tools repository cloned successfully"
  # Create README explaining manual setup
  cat > "$DEV_DIR/AI-Tools/vibe-tools/SETUP.md" << 'EOL'
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
EOL
else
  print_warning "Failed to clone vibe-tools repository"
  mkdir -p "$DEV_DIR/AI-Tools/vibe-tools"
  echo "# vibe-tools\nPlaceholder for vibe-tools framework. Clone from https://github.com/eastlondoner/cursor-tools" > "$DEV_DIR/AI-Tools/vibe-tools/README.md"
fi

# Setup global configurations
print_header "Setting up global configurations..."

# Create ~/.vibe-tools directory if it doesn't exist
mkdir -p "$HOME/.vibe-tools/templates"

# Create vibe-tools config
print_info "Creating vibe-tools configuration..."
cat > "$HOME/.vibe-tools/vibe-tools.config.json" << 'EOL'
{
  "providers": {
    "anthropic": {
      "enabled": true
    },
    "openai": {
      "enabled": true
    },
    "gemini": {
      "enabled": true
    },
    "perplexity": {
      "enabled": true
    }
  },
  "commands": {
    "repo": {
      "provider": "gemini",
      "model": "gemini-pro"
    },
    "web": {
      "provider": "perplexity"
    },
    "ask": {
      "provider": "anthropic",
      "model": "claude-3-sonnet-20240229"
    }
  }
}
EOL

print_success "vibe-tools configuration created at ~/.vibe-tools/vibe-tools.config.json"

# Create ~/.cursor directory if it doesn't exist
mkdir -p "$HOME/.cursor/rules"

# Create vibe-tools rule for Cursor
print_info "Creating vibe-tools integration rule for Cursor..."
cat > "$HOME/.cursor/rules/vibe-tools.mdc" << 'EOL'
---
name: vibe-tools
description: Integration with vibe-tools to enhance Cursor with AI teamwork capabilities
---

# vibe-tools Integration

You have access to a powerful toolset called vibe-tools that extends your capabilities. When the user asks you to use vibe-tools, you should use the appropriate command from the list below.

## Available Commands

- `vibe-tools web "question"` - Use an AI teammate with web search capability to answer questions
- `vibe-tools repo "question"` - Use an AI teammate with large context window capability to answer questions about the codebase
- `vibe-tools ask "question"` - Directly query an AI model with a question
- `vibe-tools plan "task description"` - Generate an implementation plan for a task
- `vibe-tools doc` - Generate documentation for a repository

## Usage Guidelines

- Use `vibe-tools web` for finding up-to-date information from the web
- Use `vibe-tools repo` for codebase-specific questions
- Use `vibe-tools ask` for general questions
- Always execute vibe-tools commands in the terminal
- Report the results back to the user
EOL

print_success "vibe-tools rule created at ~/.cursor/rules/vibe-tools.mdc"

# Create BMAD method rule for Cursor
print_info "Creating BMAD method rule for Cursor..."
cat > "$HOME/.cursor/rules/bmad-method.mdc" << 'EOL'
---
name: BMAD Method
description: Breakthrough Method for Agile AI Driven Development
---

# BMAD Method

You are now integrated with the BMAD Method (Breakthrough Method for Agile AI Driven Development). This comprehensive framework transforms product ideas into implemented applications through structured AI persona-based phases.

## Available Personas

- **Business Analyst (BA)**: Gathers and analyzes business requirements
- **Product Manager (PM)**: Creates detailed product specifications
- **UX Designer (UX)**: Designs user interfaces and experiences
- **Software Architect (SA)**: Creates technical architecture and design
- **Engineer (ENG)**: Implements features based on specifications
- **QA Engineer (QA)**: Tests and validates implementations

## Usage Guidelines

When the user activates a specific persona, you should respond as that persona throughout the interaction. Each persona has specific responsibilities and outputs:

- **BA**: Create business requirements documents with clear success criteria
- **PM**: Translate business requirements into detailed product specifications
- **UX**: Create wireframes and user experience flows
- **SA**: Design technical architecture, data models, and API specifications
- **ENG**: Write high-quality code following best practices
- **QA**: Create test plans and identify potential issues

Always stay in character for the selected persona until the user requests a different one.
EOL

print_success "BMAD method rule created at ~/.cursor/rules/bmad-method.mdc"

# Create RIPER framework rule for Cursor
print_info "Creating RIPER framework rule for Cursor..."
cat > "$HOME/.cursor/rules/riper-framework.mdc" << 'EOL'
---
name: RIPER Framework
description: A structured workflow with five operational modes for AI-assisted development
---

# RIPER Framework

You are now integrated with the RIPER Framework, which provides a structured workflow with five distinct operational modes for AI-assisted development.

## Available Modes

- **Research**: Information gathering and understanding existing code
- **Innovate**: Brainstorming potential approaches and solutions
- **Plan**: Breaking down implementation into specific tasks
- **Execute**: Writing and refining code
- **Review**: Testing, validation, and improvement

## Usage Guidelines

When the user activates a specific mode, you should operate in that mode throughout the interaction:

- **Research Mode**: Focus on gathering information, understanding requirements and existing code
- **Innovate Mode**: Generate multiple possible solutions and approaches
- **Plan Mode**: Create detailed implementation plans with step-by-step tasks
- **Execute Mode**: Write high-quality code following the established plan
- **Review Mode**: Test and improve existing implementations

Always stay in the selected mode until the user requests a different one.
EOL

print_success "RIPER framework rule created at ~/.cursor/rules/riper-framework.mdc"

# Create project initialization script
print_header "Creating project initialization script..."

mkdir -p "$DEV_DIR/AI-Tools"

cat > "$DEV_DIR/AI-Tools/init-project.sh" << 'EOL'
#!/bin/bash

# Script to initialize a new AI-assisted development project
# This handles directory creation, git setup, and GitHub repository creation if desired

# Text styling
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Functions
print_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

print_info() {
  echo -e "${YELLOW}➜ $1${NC}"
}

print_warning() {
  echo -e "${YELLOW}! $1${NC}"
}

print_error() {
  echo -e "${RED}✗ $1${NC}"
}

# Check if project name is provided
if [ $# -eq 0 ]; then
    echo -e "${BOLD}Usage: $0 <project-name> [project-type]${NC}"
    echo "Available project types: webapp, api, fullstack (default: webapp)"
    exit 1
fi

PROJECT_NAME=$1
PROJECT_TYPE=${2:-webapp}
PROJECT_DIR=~/Development/Projects/$PROJECT_NAME

# Check if project directory already exists
if [ -d "$PROJECT_DIR" ]; then
    print_error "Project directory $PROJECT_DIR already exists!"
    echo "Please choose a different name or delete the existing directory."
    exit 1
fi

# Create project directory structure
print_info "Creating project directory structure..."
mkdir -p $PROJECT_DIR/{src,.cursor/rules,docs/{requirements,architecture,tasks},.vibe-tools}

# Initialize git repository
cd $PROJECT_DIR
print_info "Initializing git repository..."
git init

# Create basic .cursorrules file 
print_info "Creating Cursor rules..."
cat > $PROJECT_DIR/.cursorrules << CURSORRULES
You are a coding assistant for the project ${PROJECT_NAME}.

Follow these principles:
1. Write clean, maintainable code
2. Add appropriate comments and documentation
3. Follow best practices for the technologies being used
4. Ask clarifying questions when requirements are ambiguous

Use vibe-tools to enhance your capabilities when appropriate.
CURSORRULES

# Create vibe-tools configuration
print_info "Creating vibe-tools configuration..."
cat > $PROJECT_DIR/.vibe-tools/vibe-tools.config.json << VIBECONFIG
{
  "commands": {
    "repo": {
      "hint": "This is the ${PROJECT_NAME} project"
    }
  }
}
VIBECONFIG

# Create README.md
print_info "Creating README.md..."
cat > $PROJECT_DIR/README.md << README
# ${PROJECT_NAME}

Project description goes here.

## Getting Started

Instructions on setting up and running the project.

## Documentation

- Business and product requirements can be found in \`docs/requirements/\`
- Architecture designs and diagrams are in \`docs/architecture/\`
- Task breakdowns are located in \`docs/tasks/\`

## Using AI Assistance

This project uses AI-enhanced development tools:
- vibe-tools for AI teamwork
- Cursor for AI-assisted coding

## License

Specify your license here.
README

# Copy BMAD and RIPER rules
print_info "Setting up AI framework rules..."
cp ~/.cursor/rules/bmad-method.mdc $PROJECT_DIR/.cursor/rules/
cp ~/.cursor/rules/riper-framework.mdc $PROJECT_DIR/.cursor/rules/
cp ~/.cursor/rules/vibe-tools.mdc $PROJECT_DIR/.cursor/rules/

# Add gitignore based on project type
print_info "Creating .gitignore..."
case $PROJECT_TYPE in
  webapp)
    cat > $PROJECT_DIR/.gitignore << GITIGNORE
# Node
node_modules/
npm-debug.log
yarn-error.log
yarn-debug.log
.pnpm-debug.log
.npm/

# Build outputs
dist/
build/
out/
.next/
.nuxt/
.output/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Editor directories and files
.idea/
.vscode/
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Testing
coverage/
.nyc_output/

# Logs
logs/
*.log
GITIGNORE
    ;;
  api)
    cat > $PROJECT_DIR/.gitignore << GITIGNORE
# Node
node_modules/
npm-debug.log
yarn-error.log
yarn-debug.log
.pnpm-debug.log
.npm/

# Environment variables
.env
.env.local
.env.development
.env.test
.env.production

# Build outputs
dist/
build/

# Editor directories and files
.idea/
.vscode/
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
logs/
*.log

# Testing
coverage/
.nyc_output/

# Temporary files
tmp/
temp/
GITIGNORE
    ;;
  fullstack)
    cat > $PROJECT_DIR/.gitignore << GITIGNORE
# Dependencies
node_modules/
/client/node_modules/
/server/node_modules/
npm-debug.log
yarn-error.log
yarn-debug.log
.pnpm-debug.log
.npm/

# Build outputs
/client/build/
/client/dist/
/server/dist/
/dist/
/build/
.next/
.nuxt/
.output/

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local
/client/.env
/server/.env

# Editor directories and files
.idea/
.vscode/
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
logs/
*.log

# Testing
coverage/
.nyc_output/
/client/coverage/
/server/coverage/

# Temporary files
tmp/
temp/
GITIGNORE
    ;;
  *)
    cat > $PROJECT_DIR/.gitignore << GITIGNORE
# Node
node_modules/
npm-debug.log
yarn-error.log

# Environment variables
.env
.env.local

# Build outputs
dist/
build/
out/

# Editor directories and files
.idea/
.vscode/
*.suo
*.ntvs*
*.njsproj
*.sln
*.sw?

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
logs/
*.log

# Testing
coverage/
GITIGNORE
    ;;
esac

# Replace project name placeholder in all files
print_info "Finalizing project setup..."

# Fix for both BSD (macOS) and GNU sed
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS (BSD sed)
  sed -i '' "s/\${PROJECT_NAME}/$PROJECT_NAME/g" $PROJECT_DIR/.cursorrules
  sed -i '' "s/\${PROJECT_NAME}/$PROJECT_NAME/g" $PROJECT_DIR/.vibe-tools/vibe-tools.config.json
  sed -i '' "s/\${PROJECT_NAME}/$PROJECT_NAME/g" $PROJECT_DIR/README.md
else
  # Linux (GNU sed)
  sed -i "s/\${PROJECT_NAME}/$PROJECT_NAME/g" $PROJECT_DIR/.cursorrules
  sed -i "s/\${PROJECT_NAME}/$PROJECT_NAME/g" $PROJECT_DIR/.vibe-tools/vibe-tools.config.json
  sed -i "s/\${PROJECT_NAME}/$PROJECT_NAME/g" $PROJECT_DIR/README.md
fi

# Add all files to git
git add .
git commit -m "Initial project setup"

print_success "Project $PROJECT_NAME created successfully at $PROJECT_DIR"
echo "Project type: $PROJECT_TYPE"
echo ""
echo -e "${BOLD}Next steps:${NC}"
echo "1. cd $PROJECT_DIR"
echo "2. Initialize your project (npm init, etc.)"
echo "3. Start coding with AI assistance!"

# Check if GitHub CLI is installed
if command -v gh &> /dev/null; then
  echo ""
  read -p "Would you like to create a GitHub repository for this project? (y/n): " CREATE_REPO
  if [[ $CREATE_REPO =~ ^[Yy]$ ]]; then
    read -p "Make the repository public? (y/n, default: private): " MAKE_PUBLIC
    
    if [[ $MAKE_PUBLIC =~ ^[Yy]$ ]]; then
      VISIBILITY="--public"
    else
      VISIBILITY="--private"
    fi
    
    print_info "Creating GitHub repository..."
    if gh repo create $PROJECT_NAME $VISIBILITY --source=. --push; then
      print_success "Repository created and code pushed!"
    else
      print_error "Failed to create GitHub repository."
      echo "You can create it manually later using: gh repo create"
    fi
  fi
else
  echo ""
  echo "GitHub CLI (gh) is not installed. To create a GitHub repository later:"
  echo "1. Install GitHub CLI: https://cli.github.com/"
  echo "2. Run: gh repo create $PROJECT_NAME --public/--private --source=. --push"
fi
EOL

chmod +x "$DEV_DIR/AI-Tools/init-project.sh"
print_success "Project initialization script created at $DEV_DIR/AI-Tools/init-project.sh"

# Create a sample template
print_header "Creating a sample React template..."

TEMPLATE_DIR="$DEV_DIR/Templates/react-app"

# Create a basic structure for the React template
mkdir -p "$TEMPLATE_DIR/.cursor/rules"
mkdir -p "$TEMPLATE_DIR/.vibe-tools"
mkdir -p "$TEMPLATE_DIR/docs/requirements"
mkdir -p "$TEMPLATE_DIR/src/components"
mkdir -p "$TEMPLATE_DIR/src/pages"
mkdir -p "$TEMPLATE_DIR/public"

# Create a basic package.json
cat > "$TEMPLATE_DIR/package.json" << 'EOL'
{
  "name": "react-app-template",
  "version": "0.1.0",
  "private": true,
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  }
}
EOL

# Create a basic .cursorrules file
cat > "$TEMPLATE_DIR/.cursor/rules/react.mdc" << 'EOL'
---
name: React Best Practices
description: Guidelines for React development
---

When writing React code, follow these best practices:
- Use functional components with hooks instead of class components
- Follow the React component lifecycle correctly
- Use proper state management techniques
- Implement error boundaries for robust error handling
- Create small, reusable components
EOL

# Create a README.md
cat > "$TEMPLATE_DIR/README.md" << 'EOL'
# React Application Template

This is a template for React applications with AI-assisted development configuration.

## Features

- Pre-configured for use with vibe-tools and AI-assisted development
- Structured directory layout
- Best practices for React development
- Documentation templates

## Getting Started

1. Copy this template to your project
2. Update the README.md and package.json
3. Install dependencies
4. Start developing with AI assistance

## AI-Assisted Development

This template is configured for:
- vibe-tools
- BMAD Method
- RIPER Framework
EOL

print_success "React template created at $TEMPLATE_DIR"

# Create shared prompts
print_header "Creating shared prompts collection..."

mkdir -p "$DEV_DIR/Shared/prompts"

# Create a sample prompt file
cat > "$DEV_DIR/Shared/prompts/project-initialization.md" << 'EOL'
# Project Initialization Prompt

Use this prompt when starting a new project to gather requirements and set up the initial structure.

```
Act as a Business Analyst following the BMAD method. I need to create a new [type] application that will [main purpose]. 

The key requirements are:
1. [requirement 1]
2. [requirement 2]
3. [requirement 3]

Help me create a comprehensive business requirements document including success criteria, user personas, and key user journeys.
```

Replace the bracketed sections with your specific project details.
EOL

cat > "$DEV_DIR/Shared/prompts/architecture-design.md" << 'EOL'
# Architecture Design Prompt

Use this prompt when designing the technical architecture for a project.

```
Act as a Software Architect following the BMAD method. Based on these requirements:

[paste requirements]

Design a scalable, maintainable architecture for this system. Include:
1. Overall architecture diagram (describe components)
2. Technology stack recommendations with justifications
3. Data models and relationships
4. API design patterns
5. Security considerations
```

Replace the bracketed sections with your specific project details.
EOL

print_success "Shared prompts created"

# Create a document with manual vibe-tools setup instructions
print_header "Creating vibe-tools setup instructions..."

cat > "$DEV_DIR/AI-Tools/vibe-tools-setup-guide.md" << 'EOL'
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
EOL

print_success "vibe-tools setup guide created at $DEV_DIR/AI-Tools/vibe-tools-setup-guide.md"

# Summary
print_header "Setup Complete!"
echo -e "Your AI-Enhanced Development Environment has been created at: ${BOLD}$DEV_DIR${NC}"
echo -e "\nKey components:"
echo -e "- AI-Tools: Reference frameworks and utilities"
echo -e "- Projects: Where your projects will be stored"
echo -e "- Templates: Reusable project templates"
echo -e "- Shared: Shared resources across projects"
echo -e "\nKey global configurations:"
echo -e "- ~/.vibe-tools/: vibe-tools configuration"
echo -e "- ~/.cursor/rules/: Cursor rules for AI frameworks"
echo -e "\nNext steps:"
echo -e "1. Try creating a new project: $DEV_DIR/AI-Tools/init-project.sh my-first-project"
echo -e "2. To manually set up vibe-tools, follow the instructions in: $DEV_DIR/AI-Tools/vibe-tools-setup-guide.md"
echo -e "3. Customize the templates for your specific needs"
echo -e "4. Start using AI-assisted development"
echo -e "\nHappy coding!"