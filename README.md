# The Ultimate Vibe Coding Guide

![Vibe Coding Banner](images/vibe-coding-banner.svg)

## A Comprehensive Guide for AI-Assisted Development Teams

This guide provides everything you need to get started with AI-assisted development, including environment setup, project workflows, and best practices.

## Table of Contents

1. [Introduction to Vibe Coding](#introduction-to-vibe-coding)
2. [Getting Started](#getting-started)
   - [Environment Setup](#environment-setup)
   - [Setup Scripts](#setup-scripts)
3. [Core Frameworks](#core-frameworks)
   - [vibe-tools](#vibe-tools)
   - [BMAD Method](#bmad-method)
   - [CursorRIPER Framework](#cursorriper-framework)
4. [Project Workflow](#project-workflow)
5. [Best Practices](#best-practices)
6. [Troubleshooting](#troubleshooting)
7. [Resources](#resources)

---

## Introduction to Vibe Coding

Vibe coding is a development approach where developers collaborate with AI tools to create software more efficiently. Rather than writing every line of code manually, developers describe what they want to build in natural language, and AI tools help generate, refine, and implement the code.

Our team has adopted an integrated approach to vibe coding that combines:

1. **Structured Methodologies** - BMAD Method and CursorRIPER for organized workflows
2. **Cross-Platform Tools** - vibe-tools for consistency across different IDE environments
3. **Collaborative Workflows** - Clear checkpoints and documentation to ensure team alignment

## Getting Started

### Environment Setup

To get started with vibe coding, you'll need to set up a proper development environment. We provide two scripts to help with this process:

1. **AI-Enhanced Development Environment Setup Script** - Sets up the entire development directory structure
2. **Vibe Coding Cookbook Repository Setup Script** - Creates a repository for our team's vibe coding documentation

#### Setup Scripts

##### Option 1: Complete Environment Setup

This script sets up a complete AI-enhanced development environment with all necessary directories, configurations, and reference repositories.

**Installation Steps:**

1. Download the setup script:
   ```bash
   curl -O https://raw.githubusercontent.com/YourOrganization/vibe-coding-guide/main/scripts/setup-dev-environment.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x setup-dev-environment.sh
   ```

3. Run the script:
   ```bash
   ./setup-dev-environment.sh
   ```

4. Follow the prompts to configure your environment

**What the Script Creates:**

- Directory structure for AI-Tools, Projects, Templates, and Shared resources
- Cloned repositories for BMAD Method, CursorRIPER, and vibe-tools
- Global configurations for vibe-tools and Cursor rules
- Project initialization script
- Sample templates and shared prompts

##### Option 2: Cookbook Repository Setup

This script sets up just the vibe coding cookbook repository, which contains our team's documentation and guides.

**Installation Steps:**

1. Download the setup script:
   ```bash
   curl -O https://raw.githubusercontent.com/YourOrganization/vibe-coding-guide/main/scripts/setup-vibe-cookbook.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x setup-vibe-cookbook.sh
   ```

3. Run the script with your desired repository name:
   ```bash
   ./setup-vibe-cookbook.sh vibe-coding-cookbook
   ```

**What the Script Creates:**

- A well-structured repository for vibe coding documentation
- Directory organization for examples, templates, and images
- Placeholder files for documentation
- Basic GitHub configuration

### Post-Setup Configuration

After running the setup scripts, there are a few additional steps to complete your environment:

1. **Setup vibe-tools manually**:
   ```bash
   cd ~/Development/AI-Tools/vibe-tools
   npm install
   npm link
   vibe-tools install
   ```

2. **Configure API keys**:
   Add the following to your shell configuration file (~/.bashrc, ~/.zshrc, etc.):
   ```bash
   export ANTHROPIC_API_KEY="your_api_key_here"
   export OPENAI_API_KEY="your_api_key_here"
   export GEMINI_API_KEY="your_api_key_here"
   export PERPLEXITY_API_KEY="your_api_key_here"
   ```

3. **Create your first project**:
   ```bash
   ~/Development/AI-Tools/init-project.sh my-first-project
   ```

## Core Frameworks

Our team's approach integrates three powerful frameworks for AI-assisted development:

### vibe-tools

vibe-tools is a CLI utility that enhances AI capabilities across different development environments.

**Key Commands:**

| Command | Purpose | Example |
|---------|---------|---------|
| `vibe-tools ask` | Query AI models directly | `vibe-tools ask "How do I optimize this React component?"` |
| `vibe-tools web` | Web-aware AI assistance | `vibe-tools web "Latest security practices for Express apps"` |
| `vibe-tools repo` | Codebase-aware assistance | `vibe-tools repo "Explain our authentication flow"` |
| `vibe-tools plan` | Implementation planning | `vibe-tools plan "Add user profile feature"` |
| `vibe-tools doc` | Documentation generation | `vibe-tools doc --save-to=api-docs.md` |

### BMAD Method

The BMAD Method (Breakthrough Method for Agile AI Driven Development) provides a structured approach using specialized AI personas.

**Key Personas:**

| Persona | Role | When to Use |
|---------|------|-------------|
| Business Analyst | Gather requirements | Project initiation |
| Product Manager | Create specifications | Feature planning |
| UX Designer | Design user interfaces | Before frontend work |
| Software Architect | Design technical architecture | Before implementation |
| Engineer | Implement features | During development |
| QA Engineer | Test and validate | After implementation |

### CursorRIPER Framework

CursorRIPER provides a structured workflow with five operational modes.

**RIPER Modes:**

| Mode | Purpose | Example Prompt |
|------|---------|----------------|
| Research | Gather information and context | "Research best practices for API security in Node.js" |
| Innovate | Brainstorm solutions | "Innovate different approaches for implementing user authentication" |
| Plan | Break down implementation | "Plan the implementation of the user profile feature" |
| Execute | Write and refine code | "Execute the plan for implementing the login feature" |
| Review | Test and improve | "Review the implementation for security vulnerabilities" |

## Project Workflow

Our team follows this integrated workflow that combines elements from all three frameworks:

### 1. Project Initialization

Use the project initialization script to create a new project:

```bash
~/Development/AI-Tools/init-project.sh my-project webapp
```

### 2. Requirements Gathering (BMAD Business Analyst Phase)

Use the Business Analyst persona to gather requirements:

```
Act as a Business Analyst according to the BMAD method. Help me gather requirements for a task management application. The application should allow users to create, update, delete, and mark tasks as complete. It should also support task categorization and due dates.
```

Save the output to `docs/requirements/requirements.md`.

### 3. Architecture Design (BMAD Software Architect Phase)

Use vibe-tools to generate architecture design:

```bash
vibe-tools repo "Act as a Software Architect. Based on these requirements, design a technical architecture for our task management application. Include component diagrams, data models, and API specifications." > docs/architecture/architecture.md
```

### 4. Task Breakdown (RIPER Plan Phase)

Generate a task breakdown using vibe-tools:

```bash
vibe-tools plan "Break down the implementation of our task management app into specific, actionable tasks based on our architecture design. Separate tasks into frontend, backend, and integration categories." > docs/tasks/task_breakdown.md
```

### 5. Implementation (RIPER Execute Phase)

For each task in the breakdown, use Cursor or your preferred IDE with the AI assistant:

```
Based on our architecture design in docs/architecture/architecture.md, help me implement the task creation feature. Create the MongoDB schema for tasks, then implement the API endpoint for task creation.
```

### 6. Review and Documentation (RIPER Review Phase)

Use vibe-tools to generate comprehensive documentation:

```bash
vibe-tools doc --save-to=docs/api_documentation.md
```

## Best Practices

### Effective Prompting

Use the STAR Prompting Framework:

- **S**ituation: Provide context and background
- **T**ask: Clearly state what you need
- **A**ction: Specify the approach if you have one in mind
- **R**esult: Describe the expected outcome

### Guardrails for AI-Generated Code

1. **Never blindly accept code**: Always review before applying
2. **Test thoroughly**: AI may miss edge cases
3. **Security-first mindset**: Verify security practices
4. **Maintain consistency**: Ensure code matches existing patterns
5. **Document deviations**: Note when you modify AI suggestions

### Directory Structure

Maintain this consistent directory structure for all projects:

```
project-root/
└── docs/
    ├── requirements/           # Requirements Phase
    │   ├── business_req.md     # BMAD Business Analyst output
    │   └── product_req.md      # BMAD Product Manager output
    │
    ├── architecture/           # Architecture Phase
    │   ├── design.md           # BMAD Software Architect output
    │   ├── diagrams/           # Architectural diagrams
    │   └── api_specs.md        # API specifications
    │
    ├── tasks/                  # Task Planning Phase
    │   ├── task_breakdown.md   # Overall task list
    │   └── tasks/              # Individual task specifications
    │       ├── task-001.md
    │       └── task-002.md
    │
    └── review/                 # Review Phase
        ├── test_results.md     # Testing outcomes
        └── issues.md           # Identified issues
```

## Troubleshooting

### Common Issues and Solutions

#### AI generates incorrect or outdated code

**Solution**: Provide more context about your specific environment and dependencies. Include version information in your prompts.

**Example prompt**: "Help me implement user authentication using React 18.2.0 and Express 4.18.2 with modern best practices."

#### AI misunderstands project structure

**Solution**: Use vibe-tools repo command which provides better context awareness.

**Example**:
```bash
vibe-tools repo "Given our project structure, explain how the authentication flow works"
```

#### Inconsistent results across team members

**Solution**: Standardize prompts and use shared rule files. Create template prompts in the Shared directory.

**Example**: Use `~/Development/Shared/prompts/auth-implementation.txt` with standardized prompts.

### When to Ask for Help

1. **Complex Architectural Decisions**: Consult with Tech Lead
2. **Security-Critical Components**: Involve Security Team
3. **Persistently Incorrect AI Outputs**: Report to AI Tools Manager
4. **API Access Issues**: Contact Operations Team

## Resources

### Script Locations

- Development Environment Setup: `~/Development/scripts/setup-dev-environment.sh`
- Cookbook Repository Setup: `~/Development/scripts/setup-vibe-cookbook.sh`
- Project Initialization: `~/Development/scripts/init-project.sh`

### Documentation

- Vibe Coding Cookbook: `~/Development/vibe-coding-cookbook/cookbook.md`
- vibe-tools Setup Guide: `~/Development/AI-Tools/vibe-tools-setup-guide.md`
- Shared Prompts: `~/Development/Shared/prompts/`

### External Resources

- BMAD Method: [GitHub Repository](https://github.com/bmadcode/BMAD-METHOD)
- CursorRIPER: [GitHub Repository](https://github.com/johnpeterman72/CursorRIPER)
- vibe-tools: [GitHub Repository](https://github.com/eastlondoner/cursor-tools)

---

*This guide is maintained by the AI Tools Team. Last updated: April 2025*