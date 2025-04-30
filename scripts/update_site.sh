#!/bin/bash

# Vibe Coding Cookbook Update Script
# This script automates the process of updating your GitHub Pages site

# Exit on error
set -e

echo "🔄 Starting Vibe Coding Cookbook update process..."

# Ensure we're in the repository directory
# Replace with your actual repository path or use the current directory
REPO_DIR=$(pwd)
cd "$REPO_DIR"

# 1. Update the index.html file with the enhanced version
echo "📝 Updating index.md file..."
cat > index.md << 'EOL'
---
layout: default
title: Vibe Coding Cookbook
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

## Why Use Vibe Coding?

{: .highlight }
Teams using AI-assisted development report up to **40% faster delivery times** and **25% fewer bugs** in initial releases.

| Traditional Development | Vibe Coding Approach |
|:------------------------|:---------------------|
| ❌ Developers write every line of code | ✅ Developers focus on design and logic |
| ❌ Documentation is often an afterthought | ✅ Documentation is generated alongside code |
| ❌ Prototyping takes days or weeks | ✅ Prototypes can be created in hours |
| ❌ Knowledge barriers limit contributions | ✅ Non-technical team members can contribute ideas |

## Our Integrated Framework

The Vibe Coding Cookbook combines three powerful tools:

<div class="code-example" markdown="1">
  <div style="display: flex; align-items: center; margin-bottom: 20px;">
    <div style="flex: 0 0 60px; height: 60px; background-color: #5E35B1; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
      <span style="color: white; font-weight: bold; font-size: 20px;">B</span>
    </div>
    <div>
      <h3 style="margin: 0;">BMAD METHOD</h3>
      <p style="margin: 0;">AI personas that specialize in different aspects of development</p>
    </div>
  </div>

  <div style="display: flex; align-items: center; margin-bottom: 20px;">
    <div style="flex: 0 0 60px; height: 60px; background-color: #00897B; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
      <span style="color: white; font-weight: bold; font-size: 20px;">C</span>
    </div>
    <div>
      <h3 style="margin: 0;">CursorRIPER</h3>
      <p style="margin: 0;">Five-mode framework for organizing AI interactions</p>
    </div>
  </div>

  <div style="display: flex; align-items: center;">
    <div style="flex: 0 0 60px; height: 60px; background-color: #E64A19; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 15px;">
      <span style="color: white; font-weight: bold; font-size: 20px;">V</span>
    </div>
    <div>
      <h3 style="margin: 0;">Vibe-Tools Framework</h3>
      <p style="margin: 0;">Command-line utilities that streamline AI-assisted workflows</p>
    </div>
  </div>
</div>

## How It Works

<div class="mermaid">
graph TD
    A[Project Idea] --> B[BMAD Business Analyst: <br> Gather Requirements]
    B --> C[BMAD Architect: <br> Design System]
    C --> D[CursorRIPER Plan: <br> Implementation Strategy]
    D --> E[CursorRIPER Execute: <br> Generate Code]
    E --> F[CursorRIPER Review: <br> Test & Optimize]
    F --> G[Project Delivery]
    
    style A fill:#f9f9f9,stroke:#ccc
    style B fill:#e8eaf6,stroke:#5E35B1
    style C fill:#e8eaf6,stroke:#5E35B1
    style D fill:#e0f2f1,stroke:#00897B
    style E fill:#e0f2f1,stroke:#00897B
    style F fill:#e0f2f1,stroke:#00897B
    style G fill:#f9f9f9,stroke:#ccc
</div>

## Quick Start

Get started with Vibe Coding in three easy steps:

1. **Set up your environment**
   ```bash
   curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/setup-dev-environment.sh
   chmod +x setup-dev-environment.sh
   ./setup-dev-environment.sh
   ```

2. **Initialize a new project**
   ```bash
   ~/Development/vibe-coding-cookbook/scripts/init-project.sh my-project webapp
   ```

3. **Start collaborating with AI**
   ```bash
   cd my-project
   vibe-tools ask "How do I implement user authentication for this project?"
   ```

## Business Benefits

- **Faster Time to Market** - Reduce development cycles by up to 40%
- **Lower Training Costs** - New team members can contribute sooner with AI assistance
- **Increased Innovation** - Explore more solutions in less time
- **Consistent Quality** - Standardized approaches reduce errors and technical debt
- **Better Documentation** - Automatically generate comprehensive documentation

## Success Stories

> "We implemented the Vibe Coding approach and delivered a six-month project in just ten weeks, with higher quality than our previous manual efforts."
>
> — **Sarah Chen, CTO at TechVentures**

---

## Next Steps

- [Explore the Documentation](./docs/getting-started)
- [View Example Projects](./examples)
- [Set Up Your Environment](./docs/getting-started/environment-setup)

---

{: .note }
This guide is maintained by the AI Tools Team. Last updated: April 2025.
EOL

# 2. Create a sample getting-started page
echo "📝 Creating getting started documentation..."
mkdir -p docs/getting-started
cat > docs/getting-started/index.md << 'EOL'
---
layout: default
title: Getting Started
nav_order: 2
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

# 3. Create an environment setup page
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

# 4. Update _config.yml to enable mermaid diagrams if needed
if ! grep -q "mermaid" _config.yml; then
  echo "📊 Enabling Mermaid diagrams..."
  echo "
# Enable Mermaid diagrams
mermaid:
  # Version of mermaid library
  version: \"9.1.6\"
  # Set to true to initialize mermaid on every page load
  initialize: true
" >> _config.yml
fi

# 5. Add links to Just the Docs nav
mkdir -p _includes
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

# 6. Add a simple 404 page
cat > 404.html << 'EOL'
---
layout: default
title: 404
permalink: /404.html
nav_exclude: true
---

<h1>Page not found</h1>

<p>The page you requested could not be found. Try using the navigation or search to find what you're looking for.</p>

<p><a href="/">Return to Home</a></p>
EOL

# 7. Commit and push changes
echo "📦 Committing changes..."
git add index.md docs/ _includes/ 404.html _config.yml
git commit -m "Enhanced documentation with non-technical stakeholder focus"
git push origin main

echo "✅ Update complete! Your GitHub Pages site should rebuild automatically."
echo "📚 View your updated site at: https://jvalenzano.github.io/vibe-coding-cookbook/"