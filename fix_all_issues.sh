#!/bin/bash

# Complete fix script to address all remaining issues
echo "🔧 Starting fixes for all remaining issues..."

# 1. Fix duplicate Home menu items
echo "🏠 Fixing duplicate Home menu items..."
if [ -f "index.md" ]; then
  # Modify the index.md to ensure it has a unique title
  sed -i '' 's/title: Home/title: "Vibe Coding Cookbook"/g' index.md 2>/dev/null || 
  sed -i 's/title: Home/title: "Vibe Coding Cookbook"/g' index.md
  
  echo "✅ Updated index.md with a unique title"
fi

# Check if there are any other files with Home title
grep -r "title: Home" --include="*.md" . | while read -r file; do
  filename=$(echo "$file" | cut -d':' -f1)
  if [ "$filename" != "./index.md" ]; then
    echo "🔄 Renaming title in $filename"
    sed -i '' 's/title: Home/title: "Home Page"/g' "$filename" 2>/dev/null || 
    sed -i 's/title: Home/title: "Home Page"/g' "$filename"
  fi
done

# 2. Create missing pages
echo "📄 Creating missing pages..."

# Create environment-setup.md
mkdir -p docs/getting-started
cat > docs/getting-started/environment-setup.md << 'EOL'
---
layout: default
title: Environment Setup
parent: Getting Started Guide
nav_order: 2
permalink: /docs/getting-started/environment-setup
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

This script will:
- Create directory structure for AI tools, projects, and templates
- Clone BMAD Method, CursorRIPER, and vibe-tools repositories
- Configure vibe-tools globally
- Initialize sample projects

### Step 3: Verify Installation

After installation, verify that everything is set up correctly:

```bash
vibe-tools --version
```

You should see the version number displayed if the installation was successful.

## IDE Integration

The Vibe Coding tools work with any text editor or IDE, but we recommend:

- **VS Code** with the "AI Companion" extension
- **JetBrains IDEs** with the "AI Assistant" plugin
- **Cursor Editor** for native AI integration

## Configuration

You can customize your setup by editing the configuration files:

### vibe-tools Configuration

Create a `vibe-tools.config.json` file in your project root:

```json
{
  "defaultModel": "claude-3-opus-20240229",
  "apiKey": "<your-api-key>",
  "outputFormat": "markdown"
}
```

### BMAD Method Configuration

The BMAD Method custom prompts are located in `AI-Tools/BMAD-METHOD/custom-mode-prompts/`.

### CursorRIPER Configuration

CursorRIPER configuration is located in `AI-Tools/CursorRIPER/src/templates/`.

## Troubleshooting

If you encounter any issues during setup:

1. Make sure you have the latest version of Git and Node.js
2. Check the logs in `~/.vibe-tools/logs`
3. Try running the setup script with verbose logging: `./scripts/setup-dev-environment.sh --verbose`

## Next Steps

Now that your environment is set up, learn how to [create your first AI-assisted project](./first-project).
EOL

# Create first-project.md
cat > docs/getting-started/first-project.md << 'EOL'
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

Before starting, make sure you've completed the [Environment Setup](/docs/getting-started/environment-setup) guide.

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
EOL

# Create workflow.md
cat > docs/getting-started/workflow.md << 'EOL'
---
layout: default
title: Understanding Vibe Coding Workflow
parent: Getting Started Guide
nav_order: 4
permalink: /docs/getting-started/workflow
---

# Understanding Vibe Coding Workflow

The Vibe Coding Workflow combines the best elements of the BMAD Method and CursorRIPER Framework to create a cohesive development process.

## Workflow Overview

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

## Phases Explained

### 1. Requirements Gathering (BMAD Business Analyst)

The Business Analyst persona focuses on understanding:
- User needs and pain points
- Business objectives
- Functional requirements
- Non-functional requirements

**Example Prompt:**
```
As a Business Analyst, gather requirements for a user authentication system. Consider security requirements, user experience, and industry best practices.
```

### 2. System Design (BMAD Architect)

The Architect persona designs the system architecture:
- Component design
- Data models
- API specifications
- Technology stack decisions

**Example Prompt:**
```
As a Software Architect, design a scalable microservice architecture for our e-commerce platform that needs to handle 10,000+ concurrent users.
```

### 3. Implementation Planning (CursorRIPER Plan)

The Plan mode breaks down the implementation into manageable tasks:
- Task decomposition
- Dependency identification
- Timeline estimations
- Resource allocation

**Example Prompt:**
```
Using CursorRIPER Plan mode, break down the implementation of our user authentication system into specific tasks with dependencies and time estimates.
```

### 4. Code Generation (CursorRIPER Execute)

The Execute mode focuses on implementation:
- Writing code
- Integrating components
- Implementing features
- Resolving issues

**Example Prompt:**
```
Using CursorRIPER Execute mode, implement the login functionality for our user authentication system based on the design we've created.
```

### 5. Testing & Optimization (CursorRIPER Review)

The Review mode ensures quality:
- Code review
- Testing
- Performance optimization
- Security analysis

**Example Prompt:**
```
Using CursorRIPER Review mode, analyze our authentication implementation for potential security vulnerabilities and performance bottlenecks.
```

## Benefits of the Vibe Coding Workflow

- **Structured Approach**: Clear phases with defined responsibilities
- **Specialized Assistance**: AI personas optimized for each phase
- **Consistent Quality**: Standardized process across projects
- **Faster Delivery**: Reduced friction between phases
- **Comprehensive Documentation**: Documentation generated throughout the process

By following this workflow, you'll maximize the benefits of AI-assisted development while maintaining structure and quality control.
EOL

# 3. Create persistent dark mode toggle
echo "🌓 Creating persistent dark mode toggle..."
mkdir -p _includes
cat > _includes/nav_footer_custom.html << 'EOL'
<button class="btn js-toggle-dark-mode">Toggle Dark Mode</button>

<script>
// Store the user's preference in localStorage
const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');

// Check for saved theme preference or respect OS preference
const savedTheme = localStorage.getItem('theme') || 
                  (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');

// Apply the saved theme on page load
document.addEventListener('DOMContentLoaded', () => {
  if (savedTheme === 'dark') {
    jtd.setTheme('
    dark');
    toggleDarkMode.textContent = 'Toggle Light Mode';
  }
});

// Toggle theme when button is clicked
jtd.addEvent(toggleDarkMode, 'click', function(){
  if (jtd.getTheme() === 'dark') {
    jtd.setTheme('light');
    toggleDarkMode.textContent = 'Toggle Dark Mode';
    localStorage.setItem('theme', 'light');
  } else {
    jtd.setTheme('dark');
    toggleDarkMode.textContent = 'Toggle Light Mode';
    localStorage.setItem('theme', 'dark');
  }
});
</script>

<hr>
<p class="text-small text-grey-dk-100">
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook">GitHub</a> |
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook/issues">Report an Issue</a>
</p>
EOL

# 4. Add How It Works section to index.md
echo "📝 Adding How It Works section to index.md..."
# First, backup current index.md if not already backed up
if [ ! -f "index.md.bak" ]; then
  cp index.md index.md.bak
fi

# Create a new index.md with the How It Works section
cat > index.md << 'EOL'
---
layout: default
title: "Vibe Coding Cookbook"
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

## Next Steps

- [Environment Setup](./docs/getting-started/environment-setup)
- [Your First AI-Assisted Project](./docs/getting-started/first-project)
- [Understanding Vibe Coding Workflow](./docs/getting-started/workflow)

---

{: .note }
This guide is maintained by the AI Tools Team. Last updated: April 2025.
EOL

# 5. Remove duplicate docs in scripts folder
echo "🗑️ Removing duplicate docs in scripts folder..."
if [ -d "scripts/docs" ]; then
  rm -rf scripts/docs
fi

# 6. Update _config.yml to ensure mermaid is enabled
echo "📊 Ensuring mermaid diagrams are enabled..."
if [ -f "_config.yml" ]; then
  if ! grep -q "mermaid:" _config.yml; then
    echo "
# Enable Mermaid diagrams
mermaid:
  # Version of mermaid library
  version: \"9.1.6\"
  # Set to true to initialize mermaid on every page load
  initialize: true
" >> _config.yml
  fi
fi

# 7. Ensure getting-started/index.md has proper parent-child relationship
echo "🔄 Updating getting-started index..."
if [ -f "docs/getting-started/index.md" ]; then
  # Create a temporary file
  temp_file=$(mktemp)
  
  # Add updated front matter
  echo "---" > "$temp_file"
  echo "layout: default" >> "$temp_file"
  echo "title: \"Getting Started Guide\"" >> "$temp_file"
  echo "nav_order: 4" >> "$temp_file"
  echo "has_children: true" >> "$temp_file"
  echo "permalink: /docs/getting-started" >> "$temp_file"
  echo "---" >> "$temp_file"
  
  # Get content after front matter
  sed '1,/^---$/d' docs/getting-started/index.md | tail -n +2 >> "$temp_file"
  
  # Replace original file
  mv "$temp_file" docs/getting-started/index.md
fi

# 8. Ensure jekyll-include-cache is in Gemfile and _config.yml
echo "🔧 Updating Jekyll configuration..."
if [ -f "Gemfile" ]; then
  if ! grep -q "jekyll-include-cache" Gemfile; then
    echo 'gem "jekyll-include-cache"' >> Gemfile
  fi
fi

if [ -f "_config.yml" ]; then
  if ! grep -q "jekyll-include-cache" _config.yml; then
    if grep -q "plugins:" _config.yml; then
      # Add to existing plugins section
      sed -i '' '/plugins:/a\\n  - jekyll-include-cache' _config.yml 2>/dev/null || 
      sed -i '/plugins:/a\  - jekyll-include-cache' _config.yml
    else
      # Add new plugins section
      echo -e "\nplugins:\n  - jekyll-include-cache" >> _config.yml
    fi
  fi
fi

echo "✅ All fixes complete! Now run:"
echo "git add ."
echo "git commit -m \"Fix all remaining issues with navigation and add new content\""
echo "git push origin main"