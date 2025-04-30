---
layout: default
title: Style Guides
parent: Resources
nav_order: 3
permalink: /docs/resources/style-guides
---

# Style Guides

Coding standards and best practices for Vibe Coding projects.

## General Principles

- **Consistency**: Follow established patterns throughout the codebase
- **Readability**: Code should be easy to understand for both humans and AI
- **Maintainability**: Write code that can be easily maintained and extended
- **Documentation**: Document code thoroughly for future reference

## Language-Specific Guides

### JavaScript/TypeScript

- Use ESLint with a standard configuration
- Prefer const over let; avoid var
- Use async/await instead of callbacks or raw promises
- Follow naming conventions:
  - camelCase for variables and functions
  - PascalCase for classes and components
  - UPPER_CASE for constants

### Python

- Follow PEP 8 guidelines
- Use type hints
- Document functions with docstrings
- Organize imports: standard library, third-party, local

### CSS/SCSS

- Use a consistent naming convention (BEM, SMACSS, etc.)
- Organize styles by component
- Avoid deep nesting (max 3 levels)
- Use variables for colors, spacing, etc.

## AI Interaction Guidelines

### Prompt Structure

- **Context**: Provide relevant background information
- **Task**: Clearly define what you want AI to do
- **Format**: Specify the desired output format
- **Examples**: Include examples when possible

### Code Review

When asking AI to review code:

1. Provide the full context of the code
2. Specify the areas of concern
3. Ask for specific types of feedback (readability, security, performance, etc.)

### Code Generation

When asking AI to generate code:

1. Specify the programming language and environment
2. Include any constraints or requirements
3. Request comments and explanations

## Git Workflow

- Use feature branches
- Write meaningful commit messages
- Keep pull requests small and focused
- Review code before merging

## Documentation Guidelines

- Use Markdown for documentation
- Update documentation as code changes
- Include:
  - Overview of the component/feature
  - Installation/setup instructions
  - Usage examples
  - API references
