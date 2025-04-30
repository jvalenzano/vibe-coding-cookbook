#!/bin/bash

# Enhanced Vibe Coding Cookbook Update Script (Fixed Version)
# This script automates the reorganization of your GitHub Pages site

# Exit on error
set -e

echo "🔄 Starting Vibe Coding Cookbook enhanced update process..."

# Determine repository root directory
if [[ $(basename $(pwd)) == "scripts" ]]; then
  echo "📂 Running from scripts directory, moving to parent directory..."
  cd ..
fi

# Store the repository directory
REPO_DIR=$(pwd)
echo "📂 Repository directory: $REPO_DIR"

# 1. Update the _config.yml file
echo "📝 Updating _config.yml..."
cat > _config.yml << 'EOL'
title: Vibe Coding Cookbook
description: A guide for AI-assisted software development teams
theme: just-the-docs

# URL settings
url: "https://jvalenzano.github.io"
baseurl: "/vibe-coding-cookbook"

# Enable search
search_enabled: true
search:
  # Split pages into sections that can be searched individually
  heading_level: 2
  previews: 3
  preview_words_before: 5
  preview_words_after: 10
  tokenizer_separator: /[\s\-/]+/
  rel_url: true
  button: false

# Enable Mermaid diagrams
mermaid:
  # Version of mermaid library
  version: "9.1.6"
  # Set to true to initialize mermaid on every page load
  initialize: true

# Navigation structure
nav_external_links:
  - title: View on GitHub
    url: https://github.com/jvalenzano/vibe-coding-cookbook
    hide_icon: false
    opens_in_new_tab: true

# Aux links for the upper right navigation
aux_links:
  "View on GitHub":
    - "https://github.com/jvalenzano/vibe-coding-cookbook"

# Makes Aux links open in a new tab
aux_links_new_tab: true

# Sort order for navigation links
nav_sort: case_insensitive # options: case_sensitive, case_insensitive

# Back to top link
back_to_top: true
back_to_top_text: "Back to top"

# Footer content
footer_content: "Copyright &copy; 2025 Vibe Coding. Distributed by an <a href=\"https://github.com/jvalenzano/vibe-coding-cookbook/blob/main/LICENSE\">MIT license.</a>"

# Optional: Logo and favicon
logo: "/images/vibe-coding-cookbook.png"
favicon_ico: "/images/favicon.ico"

# Optional: Enable callouts
callouts:
  note:
    title: Note
    color: blue
  warning:
    title: Warning
    color: yellow
  highlight:
    title: Highlight
    color: purple
  important:
    title: Important
    color: red

# Collections for organizing content
collections:
  tools:
    permalink: "/:collection/:path/"
    output: true
  examples:
    permalink: "/:collection/:path/"
    output: true

# Default front matter for pages
defaults:
  - scope:
      path: ""
      type: "pages"
    values:
      layout: "default"
EOL

# 2. Update index.md (keep most of the content but fix front matter)
echo "📝 Updating index.md..."
if [ -f index.md ]; then
  # Backup original index.md
  cp index.md index.md.bak
  # Remove front matter if it exists
  if grep -q "^---" index.md; then
    sed -i '' '1,/^---$/d' index.md 2>/dev/null || sed -i '1,/^---$/d' index.md
    # Remove the second --- line
    sed -i '' '1,/^---$/d' index.md 2>/dev/null || sed -i '1,/^---$/d' index.md
  fi
  # Add new front matter
  temp_file=$(mktemp)
  echo "---" > "$temp_file"
  echo "layout: default" >> "$temp_file"
  echo "title: Home" >> "$temp_file"
  echo "nav_order: 1" >> "$temp_file"
  echo "permalink: /" >> "$temp_file"
  echo "---" >> "$temp_file"
  cat index.md >> "$temp_file"
  mv "$temp_file" index.md
else
  echo "⚠️ index.md not found, creating it..."
  cat > index.md << 'EOL'
---
layout: default
title: Home
nav_order: 1
permalink: /
---

# Vibe Coding Cookbook

{: .fs-9 }
A practical guide for AI-assisted software development teams
{: .fs-6 .fw-300 }

[Get Started](#quick-start){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[View on GitHub](https://github.com/jvalenzano/vibe-coding-cookbook){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## What is Vibe Coding?

**Vibe Coding** is a collaborative approach where developers work alongside AI tools to create software more efficiently. Rather than writing every line of code manually, teams describe what they want to build in natural language, and AI tools help generate, refine, and implement the code.

## Our Integrated Framework

The Vibe Coding Cookbook combines three powerful tools:

- **BMAD METHOD** - Breakthrough Method for Agile AI-Driven Development
- **CursorRIPER** - Research, Innovate, Plan, Execute, Review framework
- **Vibe-Tools Framework** - CLI utility for enhancing AI-assisted development

## Quick Start

Get started with Vibe Coding in three easy steps:

1. **Set up your environment**
2. **Initialize a new project**
3. **Start collaborating with AI**

Explore templates, prompts, and automation guides using the sidebar navigation!
EOL
fi

# 3. Create about.md from README.md
echo "📝 Creating about.md from README.md..."
if [ -f README.md ]; then
  cp README.md about.md
  # Add front matter to about.md
  temp_file=$(mktemp)
  echo "---" > "$temp_file"
  echo "layout: default" >> "$temp_file"
  echo "title: About" >> "$temp_file"
  echo "nav_order: 2" >> "$temp_file"
  echo "---" >> "$temp_file"
  cat about.md >> "$temp_file"
  mv "$temp_file" about.md
else
  echo "⚠️ README.md not found, creating simple about.md..."
  cat > about.md << 'EOL'
---
layout: default
title: About
nav_order: 2
---

# About Vibe Coding

Vibe Coding is a comprehensive approach to AI-assisted software development. It combines powerful tools and methodologies to help developers create better software more efficiently.

## Key Components

- **BMAD METHOD**: Specialized AI personas for different development roles
- **CursorRIPER**: A structured framework for organizing AI interactions
- **Vibe-Tools**: Command-line utilities for streamlining AI-assisted workflows

## Benefits

- Faster development cycles
- Improved code quality
- Better documentation
- Easier onboarding for new team members
- More innovative solutions

This cookbook provides everything you need to get started with Vibe Coding, including setup guides, best practices, and examples.
EOL
fi

# 4. Update cookbook.md if it exists
if [ -f cookbook.md ]; then
  echo "📝 Updating cookbook.md..."
  # Backup original cookbook.md
  cp cookbook.md cookbook.md.bak
  # Add front matter to cookbook.md if it doesn't exist
  if ! grep -q "^---" cookbook.md; then
    temp_file=$(mktemp)
    echo "---" > "$temp_file"
    echo "layout: default" >> "$temp_file"
    echo "title: Cookbook" >> "$temp_file"
    echo "nav_order: 3" >> "$temp_file"
    echo "---" >> "$temp_file"
    cat cookbook.md >> "$temp_file"
    mv "$temp_file" cookbook.md
  fi
else
  echo "⚠️ cookbook.md not found, skipping..."
fi

# 5. Ensure docs directory structure exists
echo "📝 Creating directory structure..."
mkdir -p docs/getting-started
mkdir -p docs/core-frameworks
mkdir -p docs/examples
mkdir -p docs/resources

# 6. Create Getting Started index
echo "📝 Creating Getting Started index..."
mkdir -p docs/getting-started
cat > docs/getting-started/index.md << 'EOL'
---
layout: default
title: Getting Started
nav_order: 4
has_children: true
permalink: /docs/getting-started
---

# Getting Started with Vibe Coding

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

## Next Steps

- [Environment Setup](./environment-setup)
- [Your First AI-Assisted Project](./first-project)
- [Understanding Vibe Coding Workflow](./workflow)
EOL

# 7. Create environment-setup.md
echo "📝 Creating Environment Setup page..."
cat > docs/getting-started/environment-setup.md << 'EOL'
---
layout: default
title: Environment Setup
parent: Getting Started
nav_order: 1
---

# Environment Setup

This guide covers setting up your development environment for Vibe Coding.

## System Requirements

- **Operating System**: Windows 10+, macOS 10.15+, or Linux
- **Memory**: 8GB RAM (16GB recommended)
- **Disk Space**: At least 2GB free space
- **Software**: Git, Node.js 14+

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/jvalenzano/vibe-coding-cookbook.git
cd vibe-coding-cookbook
```

### Step 2: Run the Setup Script

```bash
./scripts/setup-dev-environment.sh
```

### Step 3: Verify Installation

```bash
vibe-tools --version
```

You should see the version number displayed if the installation was successful.

## Troubleshooting

If you encounter any issues during setup:

1. Make sure you have the latest version of Git and Node.js
2. Check the logs in `~/.vibe-tools/logs`
3. Try running the setup script with verbose logging: `./scripts/setup-dev-environment.sh --verbose`

## IDE Integration

The Vibe Coding tools work with any text editor or IDE, but we recommend:

- **VS Code** with the "AI Companion" extension
- **JetBrains IDEs** with the "AI Assistant" plugin
- **Cursor Editor** for native AI integration

## Next Steps

Now that your environment is set up, learn how to [create your first AI-assisted project](./first-project).
EOL

# 8. Create Core Frameworks section
echo "📝 Creating Core Frameworks section..."
mkdir -p docs/core-frameworks
cat > docs/core-frameworks/index.md << 'EOL'
---
layout: default
title: Core Frameworks
nav_order: 5
has_children: true
permalink: /docs/core-frameworks
---

# Core Frameworks

The Vibe Coding approach combines three powerful frameworks that work together to enhance AI-assisted development:

## Framework Overview

| Framework | Purpose | When to Use |
|---------|------|-------------|
| [BMAD Method](./bmad-method) | Specialized AI personas for development | Throughout project lifecycle |
| [CursorRIPER](./cursor-riper) | Five-mode operational structure | For structured AI interactions |
| [vibe-tools](./vibe-tools) | CLI utility for AI assistance | Daily development tasks |

Each framework addresses different aspects of the AI-assisted development process, and they can be used together or independently based on your project needs.

## Getting Started

To begin using these frameworks, visit the individual framework pages for detailed instructions:

- [BMAD Method](./bmad-method)
- [CursorRIPER Framework](./cursor-riper)
- [Vibe-Tools Framework](./vibe-tools)
EOL

# 9. Create BMAD Method page
echo "📝 Creating BMAD Method page..."
cat > docs/core-frameworks/bmad-method.md << 'EOL'
---
layout: default
title: BMAD Method
parent: Core Frameworks
nav_order: 1
---

# BMAD Method

The **B**reakthrough **M**ethod for **A**gile AI-**D**riven Development provides specialized AI personas to enhance the software development lifecycle.

## Specialized AI Personas

| Persona | Role | When to Use |
|---------|------|-------------|
| Business Analyst | Gather requirements | Project initiation |
| Product Manager | Define features | Feature planning |
| UX Designer | Design interfaces | Before frontend work |
| Software Architect | Design systems | Before implementation |
| Engineer | Implement features | During development |
| QA Engineer | Validate implementation | After implementation |

## How to Use BMAD

1. **Identify the current phase** of your project
2. **Select the appropriate persona** based on the task at hand
3. **Prompt the AI** using the persona's specialized knowledge and perspective
4. **Iterate and refine** the output based on project requirements

## Example Prompts

### Business Analyst Persona

```
As a Business Analyst, analyze the requirements for a user authentication system. Consider security requirements, user experience, and industry best practices.
```

### Software Architect Persona

```
As a Software Architect, design a scalable microservice architecture for an e-commerce platform that needs to handle 10,000+ concurrent users.
```

## Resources

For more information about the BMAD Method, check out the [official repository](https://github.com/bmadcode/BMAD-METHOD).
EOL

# 10. Create CursorRIPER page
echo "📝 Creating CursorRIPER page..."
cat > docs/core-frameworks/cursor-riper.md << 'EOL'
---
layout: default
title: CursorRIPER
parent: Core Frameworks
nav_order: 2
---

# CursorRIPER Framework

The CursorRIPER framework provides a structured approach to AI-assisted development through five specialized modes.

## The RIPER Modes

| Mode | Purpose | Example Prompt |
|------|---------|----------------|
| Research | Gather context | "Research best practices for API security" |
| Innovate | Brainstorm solutions | "Innovate approaches for user authentication" |
| Plan | Structure implementation | "Plan our task management app" |
| Execute | Write/refine code | "Implement the login feature" |
| Review | Test and improve | "Review for security vulnerabilities" |

## Workflow Process

<div class="mermaid">
graph LR
    A[Research] --> B[Innovate]
    B --> C[Plan]
    C --> D[Execute]
    D --> E[Review]
    E -.-> B
    E -.-> C
    E -.-> D
</div>

## Benefits

- **Structured approach** to AI collaboration
- **Specialized modes** for different development phases
- **Consistent workflow** across team members
- **Improved output quality** through targeted prompting

## Getting Started

1. **Identify your current development phase**
2. **Select the appropriate RIPER mode**
3. **Craft your prompt using the mode's specific language**
4. **Iterate through the modes** as your project progresses

## Resources

For more information about CursorRIPER, check out the [official repository](https://github.com/johnpeterman72/CursorRIPER).
EOL

# 11. Create Vibe-Tools page
echo "📝 Creating Vibe-Tools page..."
cat > docs/core-frameworks/vibe-tools.md << 'EOL'
---
layout: default
title: Vibe-Tools Framework
parent: Core Frameworks
nav_order: 3
---

# Vibe-Tools Framework

A CLI utility for enhancing AI-assisted development across various tasks and contexts.

## Key Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `vibe-tools ask` | Query AI models directly | `vibe-tools ask "How do I optimize this React component?"` |
| `vibe-tools web` | Web-aware AI assistance | `vibe-tools web "Security practices for Express apps"` |
| `vibe-tools repo` | Context-aware repo analysis | `vibe-tools repo "Explain our authentication flow"` |
| `vibe-tools plan` | Implementation planning | `vibe-tools plan "Add user profile feature"` |
| `vibe-tools doc` | Documentation generation | `vibe-tools doc --save-to=api-docs.md` |

## Installation

```bash
# Install globally
npm install -g vibe-tools

# Verify installation
vibe-tools --version
```

## Configuration

Create a `vibe-tools.config.json` file in your project root:

```json
{
  "defaultModel": "claude-3-opus-20240229",
  "apiKey": "<your-api-key>",
  "outputFormat": "markdown"
}
```

## Integration with Other Frameworks

Vibe-tools works seamlessly with both the BMAD Method and CursorRIPER:

- Use `vibe-tools ask` with BMAD personas
- Structure `vibe-tools plan` commands using CursorRIPER modes

## Resources

For more information about vibe-tools, check out the [official repository](https://github.com/eastlondoner/cursor-tools).
EOL

# 12. Create Examples section
echo "📝 Creating Examples section..."
mkdir -p docs/examples
cat > docs/examples/index.md << 'EOL'
---
layout: default
title: Examples
nav_order: 6
has_children: true
permalink: /docs/examples
---

# Examples

Explore real-world examples of Vibe Coding in action, including templates, sample projects, and case studies.

## Available Examples

- [Project Templates](./project-templates) - Ready-to-use templates for various project types
- [Sample Scripts](./sample-scripts) - Utility scripts to automate common tasks
- [Case Studies](./case-studies) - Real-world applications of Vibe Coding

## How to Use Examples

All examples are designed to be easily customized for your specific needs. Simply copy the relevant files or code snippets and modify them as needed for your project.

## Contributing Examples

We welcome contributions to our examples library! If you've created a useful template, script, or case study using the Vibe Coding approach, please consider sharing it with the community.
EOL

# 13. Create Project Templates page
echo "📝 Creating Project Templates page..."
cat > docs/examples/project-templates.md << 'EOL'
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
EOL

# 14. Create Resources section
echo "📝 Creating Resources section..."
mkdir -p docs/resources
cat > docs/resources/index.md << 'EOL'
---
layout: default
title: Resources
nav_order: 7
has_children: true
permalink: /docs/resources
---

# Resources

Additional tools, scripts, guides, and references to support your Vibe Coding journey.

## Available Resources

- [Scripts](./scripts) - Utility scripts to automate common tasks
- [Prompt Library](./prompt-library) - Collection of effective prompts for AI-assisted development
- [Style Guides](./style-guides) - Coding standards and best practices
- [External Links](./external-links) - Useful resources from around the web

## Using Resources

These resources are designed to complement the Vibe Coding frameworks and can be used independently or together to enhance your development process.

## Contributing Resources

We welcome contributions to our resource library! If you've created a useful script, prompt, or guide, please consider sharing it with the community.
EOL

# 15. Create Scripts page
echo "📝 Creating Scripts page..."
cat > docs/resources/scripts.md << 'EOL'
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
EOL

# 16. Add a 404 page if it doesn't exist
if [ ! -f 404.html ]; then
  echo "📝 Creating 404 page..."
  cat > 404.html << 'EOL'
---
layout: default
title: 404
permalink: /404.html
nav_exclude: true
---

<h1>Page not found</h1>

<p>The page you requested could not be found. Try using the navigation or search to find what you're looking for.</p>

<p><a href="{{ site.baseurl }}/">Return to Home</a></p>
EOL
fi

# 17. Add custom nav footer if it doesn't exist
mkdir -p _includes
if [ ! -f _includes/nav_footer_custom.html ]; then
  echo "📝 Creating custom nav footer..."
  cat > _includes/nav_footer_custom.html << 'EOL'
<button class="btn js-toggle-dark-mode">Toggle Dark Mode</button>

<script>
const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');

jtd.addEvent(toggleDarkMode, 'click', function(){
  if (jtd.getTheme() === 'dark') {
    jtd.setTheme('light');
    toggleDarkMode.textContent = 'Toggle Dark Mode';
  } else {
    jtd.setTheme('dark');
    toggleDarkMode.textContent = 'Toggle Light Mode';
  }
});
</script>

<hr>
<p class="text-small text-grey-dk-100">
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook">GitHub</a> |
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook/issues">Report an Issue</a>
</p>
EOL
fi

# 18. Check if index.html exists and remove it if needed
if [ -f index.html ]; then
  echo "🗑️ Removing index.html in favor of index.md..."
  git rm -f index.html 2>/dev/null || rm -f index.html
fi

# 19. Commit and push changes
echo "📦 Committing changes..."
git add _config.yml index.md about.md docs/ _includes/ 404.html
if [ -f cookbook.md ]; then
  git add cookbook.md
fi
echo "✅ Files staged for commit. To complete, run:"
echo "git commit -m \"Enhanced documentation with improved navigation structure\""
echo "git push origin main"

echo "🔍 The sidebar navigation is now properly organized with clear categories"
echo "🎨 Dark mode toggle has been added for better user experience"
echo "📚 New sections for Core Frameworks, Examples, and Resources have been created"

echo ""
echo "Next steps you might want to consider:"
echo "1. Add real content to the framework pages based on your actual documentation"
echo "2. Create additional example pages for specific use cases"
echo "3. Add screenshots or diagrams to illustrate key concepts"
echo "4. Configure a custom domain if desired"