---
layout: default
title: Project Templates
parent: Examples
nav_order: 1
---

# Project Templates

Ready-to-use templates to jumpstart your development with the Vibe Coding approach.

## Available Templates

| Template | Description | Technologies | Use Case |
|----------|-------------|--------------|----------|
| [React App](https://github.com/jvalenzano/vibe-coding-cookbook/tree/main/templates/projects/react-app) | Frontend web application | React, TypeScript, Tailwind CSS | Single-page applications |
| [Node API](https://github.com/jvalenzano/vibe-coding-cookbook/tree/main/templates/projects/node-api) | Backend REST API | Node.js, Express, MongoDB | Microservices, APIs |
| [Fullstack](https://github.com/jvalenzano/vibe-coding-cookbook/tree/main/templates/projects/fullstack) | Complete web application | React, Node.js, PostgreSQL | Full-featured web apps |

## Using Templates

```bash
# Initialize a new project using a template
~/Development/vibe-coding-cookbook/scripts/init-project.sh my-project react-app
```

## Template Structure

Each template follows a consistent structure to make it easy to understand and customize:

```
project-name/
├── docs/                 # Documentation
├── src/                  # Source code
├── tests/                # Test files
├── .gitignore            # Git ignore rules
├── package.json          # Dependencies and scripts
└── README.md             # Project overview
```

## Customizing Templates

Templates are designed to be starting points, not rigid frameworks. Feel free to:

1. Add or remove dependencies
2. Modify folder structures
3. Change configuration files
4. Adapt to your team's coding standards

## Template Design Principles

All templates follow these key principles:

- **Simplicity**: No unnecessary complexity
- **Modern Practices**: Up-to-date dependencies and patterns
- **Testing Ready**: Testing infrastructure included
- **Well Documented**: Clear documentation for all components
