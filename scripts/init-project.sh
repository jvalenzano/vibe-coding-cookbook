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
