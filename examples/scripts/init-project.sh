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
