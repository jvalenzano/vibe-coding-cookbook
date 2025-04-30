---
layout: default
title: Your First AI-Assisted Project
parent: Getting Started Guide
nav_order: 3
permalink: /docs/getting-started/first-project
---

# Your First AI-Assisted Project

This guide will walk you through creating your first project using Vibe Coding principles and tools.

## Prerequisites

Before starting, make sure you've completed the [Environment Setup](../environment-setup) guide.

## Project Initialization

The easiest way to start a new project is using our initialization script:

```bash
# Initialize a new project
./scripts/init-project.sh my-first-project webapp
```

This will:
- Create a new directory with the project name
- Set up a basic project structure
- Initialize Git repository
- Add initial configuration files

## Project Structure

After initialization, your project will have the following structure:

```
my-first-project/
├── docs/                 # Documentation
│   ├── requirements/     # Project requirements
│   ├── architecture/     # System architecture
│   └── tasks/            # Task breakdown
├── src/                  # Source code
├── tests/                # Test files
├── .gitignore            # Git ignore rules
└── README.md             # Project overview
```

## Next Steps

With your project initialized, you can:

1. Define project requirements using the BMAD Business Analyst persona
2. Design the architecture using the BMAD Architect persona
3. Break down tasks using CursorRIPER's Plan mode
4. Start implementation using CursorRIPER's Execute mode

## Example Workflow

Here's a typical workflow for developing a feature:

1. **Define Requirements**: Document what the feature should do
2. **Plan Implementation**: Break down into tasks and subtasks
3. **Write Code**: Implement the feature with AI assistance
4. **Test**: Verify the feature works correctly
5. **Document**: Update documentation with new feature details

## Common Commands

Here are some common commands you'll use in your project:

```bash
# Get AI assistance for a task
vibe-tools ask "How do I implement user authentication in my project?"

# Generate documentation
vibe-tools doc --save-to=api-docs.md

# Analyze repository
vibe-tools repo "Explain how the authentication flow works"
```

Happy coding with your new AI-assisted project!
