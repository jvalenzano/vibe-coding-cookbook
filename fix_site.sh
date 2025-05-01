#!/bin/bash

# Comprehensive fix script for Vibe Coding Cookbook website

echo "🔧 Starting comprehensive website fixes..."

# 1. Fix Dark Mode Toggle
echo "🌓 Fixing dark mode toggle..."

# Update nav_footer_custom.html
echo "Updating nav_footer_custom.html..."
cat > _includes/nav_footer_custom.html << 'EOL'
<button id="dark-mode-toggle" class="btn js-toggle-dark-mode">
  <span class="toggle-text">Toggle Dark Mode</span>
</button>

<hr>
<p class="text-small text-grey-dk-100">
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook">GitHub</a> |
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook/issues">Report an Issue</a>
</p>
EOL
echo "✅ Updated nav_footer_custom.html"

# Update custom-dark-mode.js
echo "Updating custom-dark-mode.js..."
cat > assets/js/custom-dark-mode.js << 'EOL'
// Dark mode toggle and theme persistence
document.addEventListener("DOMContentLoaded", function() {
  console.log("Dark mode script loaded");
  
  // Check if we're on a page that has the dark mode toggle
  const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');
  
  // Function to apply the theme based on localStorage or system preference
  function applyTheme() {
    const savedTheme = localStorage.getItem('theme');
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    
    // If theme is saved in localStorage, use that, otherwise use system preference
    const themeToApply = savedTheme || (systemPrefersDark ? 'dark' : 'light');
    
    setTheme(themeToApply);
  }
  
  // Function to update button text
  function updateButtonText(theme) {
    if (toggleDarkMode) {
      const textSpan = toggleDarkMode.querySelector('.toggle-text');
      if (textSpan) {
        textSpan.textContent = theme === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
      } else {
        toggleDarkMode.textContent = theme === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
      }
    }
  }
  
  // Function to set the theme
  function setTheme(theme) {
    console.log("Setting theme to:", theme);
    
    // Store the theme preference in localStorage
    localStorage.setItem('theme', theme);
    
    // Apply the theme to the document
    if (theme === 'dark') {
      document.querySelector('html').setAttribute('data-theme', 'dark');
      
      // If jtd object exists (Just the Docs theme), use its setTheme function
      if (typeof jtd !== 'undefined' && jtd.setTheme) {
        jtd.setTheme('dark');
      }
    } else {
      document.querySelector('html').setAttribute('data-theme', 'light');
      
      // If jtd object exists (Just the Docs theme), use its setTheme function
      if (typeof jtd !== 'undefined' && jtd.setTheme) {
        jtd.setTheme('light');
      }
    }
    
    // Update button text
    updateButtonText(theme);
    
    // Update SVG elements with data-theme
    updateSvgTheme(theme);
  }
  
  // Function to update SVG elements with the current theme
  function updateSvgTheme(theme) {
    // Force SVG elements to respect the current theme
    const svgElements = document.querySelectorAll('svg');
    svgElements.forEach(svg => {
      if (theme === 'dark') {
        svg.setAttribute('data-theme', 'dark');
      } else {
        svg.removeAttribute('data-theme');
      }
    });
  }
  
  // Apply theme on page load
  applyTheme();
  
  // If toggle button exists, add event listener
  if (toggleDarkMode) {
    console.log("Adding click listener to toggle button");
    toggleDarkMode.addEventListener('click', function(e) {
      console.log("Toggle button clicked");
      e.preventDefault(); // Prevent any default behavior
      
      const currentTheme = localStorage.getItem('theme') || 'light';
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      
      setTheme(newTheme);
    });
  } else {
    console.log("Toggle button not found on this page");
  }
  
  // Also respond to system preference changes if user hasn't manually selected a theme
  const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
  prefersDarkScheme.addEventListener('change', function(e) {
    const userSetTheme = localStorage.getItem('theme');
    if (!userSetTheme) {
      setTheme(e.matches ? 'dark' : 'light');
    }
  });
});
EOL
echo "✅ Updated custom-dark-mode.js"

# Update head_custom.html with button styling
echo "Updating head_custom.html with button styling..."
if [ -f "_includes/head_custom.html" ]; then
  # Check if style section already exists
  if grep -q "<style>" "_includes/head_custom.html"; then
    # Add button styling to existing style section
    sed -i '' '/<style>/a\
  /* Dark mode toggle button styling */\
  #dark-mode-toggle {\
    background-color: var(--body-background-color);\
    color: var(--body-text-color);\
    border: 1px solid var(--border-color);\
    transition: all 0.2s ease;\
    padding: 0.5rem 1rem;\
    font-weight: 500;\
  }\
  \
  #dark-mode-toggle:hover {\
    background-color: var(--body-heading-color);\
    color: var(--body-background-color);\
  }\
  \
  #dark-mode-toggle:active {\
    transform: translateY(1px);\
  }\
  \
  [data-theme="dark"] #dark-mode-toggle {\
    box-shadow: 0 0 3px rgba(255, 255, 255, 0.2);\
  }\
  \
  [data-theme="light"] #dark-mode-toggle {\
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);\
  }
' "_includes/head_custom.html" 2>/dev/null || 
    sed -i '/<style>/a\
  /* Dark mode toggle button styling */\
  #dark-mode-toggle {\
    background-color: var(--body-background-color);\
    color: var(--body-text-color);\
    border: 1px solid var(--border-color);\
    transition: all 0.2s ease;\
    padding: 0.5rem 1rem;\
    font-weight: 500;\
  }\#dark-mode-toggle:hover {
    background-color: var(--body-heading-color);
    color: var(--body-background-color);
  }
  
  #dark-mode-toggle:active {
    transform: translateY(1px);
  }
  
  [data-theme="dark"] #dark-mode-toggle {
    box-shadow: 0 0 3px rgba(255, 255, 255, 0.2);
  }
  
  [data-theme="light"] #dark-mode-toggle {
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);
  }
' "_includes/head_custom.html"
  else
    # Add new style section with button styling
    echo '<!-- Dark mode toggle button styling -->
<style>
  #dark-mode-toggle {
    background-color: var(--body-background-color);
    color: var(--body-text-color);
    border: 1px solid var(--border-color);
    transition: all 0.2s ease;
    padding: 0.5rem 1rem;
    font-weight: 500;
  }
  
  #dark-mode-toggle:hover {
    background-color: var(--body-heading-color);
    color: var(--body-background-color);
  }
  
  #dark-mode-toggle:active {
    transform: translateY(1px);
  }
  
  [data-theme="dark"] #dark-mode-toggle {
    box-shadow: 0 0 3px rgba(255, 255, 255, 0.2);
  }
  
  [data-theme="light"] #dark-mode-toggle {
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);
  }
</style>' >> "_includes/head_custom.html"
  fi
else
  # Create new head_custom.html with button styling
  cat > _includes/head_custom.html << 'EOL'
<!-- Custom dark mode and diagram support -->

<!-- Dark mode SVG styles -->
<style>
  /* Force SVG elements to respect dark mode */
  [data-theme="dark"] svg {
    color-scheme: dark;
  }
  
  /* Add these CSS variables that SVGs can access */
  :root {
    --box-bg: #ffffff;
    --box-stroke: #dddddd;
    --box-bmad-bg: #e8eaf6;
    --box-bmad-stroke: #5E35B1;
    --box-cursor-bg: #e0f2f1;
    --box-cursor-stroke: #00897B;
    --text-color: #333333;
    --arrow-color: #666666;
    --highlight-color: rgba(255, 0, 0, 0.1);
  }
  
  [data-theme="dark"] {
    --box-bg: #21262d;
    --box-stroke: #30363d;
    --box-bmad-bg: #372E4F;
    --box-bmad-stroke: #7B61C0;
    --box-cursor-bg: #1D3B39;
    --box-cursor-stroke: #26A69A;
    --text-color: #c9d1d9;
    --arrow-color: #aaaaaa;
    --highlight-color: rgba(255, 0, 0, 0.2);
  }
  
  /* Dark mode toggle button styling */
  #dark-mode-toggle {
    background-color: var(--body-background-color);
    color: var(--body-text-color);
    border: 1px solid var(--border-color);
    transition: all 0.2s ease;
    padding: 0.5rem 1rem;
    font-weight: 500;
  }
  
  #dark-mode-toggle:hover {
    background-color: var(--body-heading-color);
    color: var(--body-background-color);
  }
  
  #dark-mode-toggle:active {
    transform: translateY(1px);
  }
  
  [data-theme="dark"] #dark-mode-toggle {
    box-shadow: 0 0 3px rgba(255, 255, 255, 0.2);
  }
  
  [data-theme="light"] #dark-mode-toggle {
    box-shadow: 0 0 3px rgba(0, 0, 0, 0.2);
  }
</style>

<!-- Mermaid support -->
<script src="https://cdn.jsdelivr.net/npm/mermaid@9.1.6/dist/mermaid.min.js"></script>

<!-- Custom JavaScript -->
<script src="{{ site.baseurl }}/assets/js/custom-dark-mode.js"></script>
EOL
fi
echo "✅ Updated head_custom.html with button styling"

# 2. Fix Broken Links in Resources Section
echo "🔗 Fixing broken links in resources section..."

# Create resources directory if it doesn't exist
mkdir -p docs/resources

# Create scripts.md
if [ ! -f "docs/resources/scripts.md" ]; then
  echo "Creating docs/resources/scripts.md..."
  cat > docs/resources/scripts.md << 'EOL'
---
layout: default
title: Scripts
parent: Resources
nav_order: 1
permalink: /docs/resources/scripts
---

# Scripts

{: .fs-9 }
Utility scripts to automate common development tasks
{: .fs-6 .fw-300 }

[Setup Scripts](#setup-scripts){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Project Scripts](#project-scripts){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Setup Scripts

These scripts help set up your development environment with all the necessary tools and configurations.

### setup-dev-environment.sh

This script installs and configures all the tools needed for Vibe Coding projects.

```bash
#!/bin/bash
# Setup script for Vibe Coding development environment

echo "Setting up Vibe Coding development environment..."

# Install required packages
echo "Installing required packages..."
# Package installation commands here

# Configure tools
echo "Configuring tools..."
# Configuration commands here

echo "Setup complete! Your Vibe Coding environment is ready."
```

### Usage

```bash
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/setup-dev-environment.sh
chmod +x setup-dev-environment.sh
./setup-dev-environment.sh
```

## Project Scripts

These scripts help initialize and manage your Vibe Coding projects.

### init-project.sh

This script creates a new project based on a template.

```bash
#!/bin/bash
# Initialize a new Vibe Coding project

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 project_name template_type"
  echo "Example: $0 my-project webapp"
  exit 1
fi

PROJECT_NAME=$1
TEMPLATE_TYPE=$2

echo "Creating $TEMPLATE_TYPE project: $PROJECT_NAME..."

# Create project structure
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Initialize based on template
case $TEMPLATE_TYPE in
  webapp)
    echo "Setting up web application template..."
    # Web app setup commands
    ;;
  node-api)
    echo "Setting up Node.js API template..."
    # API setup commands
    ;;
  *)
    echo "Unknown template type: $TEMPLATE_TYPE"
    exit 1
    ;;
esac

echo "Project initialization complete!"
```

### Usage

```bash
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh
./init-project.sh my-project webapp
```

## Contributing Scripts

If you have a useful script you'd like to share:

1. Fork the [Vibe Coding Cookbook repository](https://github.com/jvalenzano/vibe-coding-cookbook)
2. Add your script to the `scripts` directory
3. Make sure to include proper documentation and comments
4. Submit a pull request

---

{: .note }
All scripts are provided as examples and may need modifications to suit your specific environment or needs.
EOL
  echo "✅ Created scripts.md"
fi

# Create prompt-library.md
if [ ! -f "docs/resources/prompt-library.md" ]; then
  echo "Creating docs/resources/prompt-library.md..."
  cat > docs/resources/prompt-library.md << 'EOL'
---
layout: default
title: Prompt Library
parent: Resources
nav_order: 2
permalink: /docs/resources/prompt-library
---

# Prompt Library

{: .fs-9 }
Collection of effective prompts for AI-assisted development
{: .fs-6 .fw-300 }

[Architecture](#architecture-prompts){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Implementation](#implementation-prompts){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Testing](#testing-prompts){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Introduction

This library contains a collection of proven prompts for different phases of the AI-assisted development process. Each prompt is designed to elicit specific types of responses from AI assistants like Claude, ChatGPT, and Gemini.

## Architecture Prompts

These prompts help with the high-level design and architecture of your applications.

### System Design Prompt

```
Act as a senior software architect with expertise in scalable web applications. I need to design a [type of application] that needs to support [specific requirements].

Please help me create a high-level architecture diagram and outline the key components including:
1. Frontend architecture
2. Backend services
3. Data storage approach
4. API design patterns
5. Authentication/authorization strategy

For each component, explain the rationale behind your recommendations and potential tradeoffs.
```

### Component Structure Prompt

```
I'm building a [application type] using [framework/library]. Help me define the best component structure for maintainability and scalability.

The application needs these features:
- [Feature 1]
- [Feature 2]
- [Feature 3]

For each feature, suggest the appropriate components, their responsibilities, and how they should interact.
```

## Implementation Prompts

These prompts help with writing code and implementing features.

### Feature Implementation Prompt

```
Help me implement the following feature for my [language/framework] project:

Feature description: [detailed description]

Technical requirements:
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

Here's the relevant code structure I currently have:
[Paste relevant code snippets or file structure]

Please provide the implementation with clear explanations for each part.
```

### Code Refactoring Prompt

```
I need to refactor the following code to improve [performance/readability/maintainability]:

[Code snippet to refactor]

Specific issues I want to address:
- [Issue 1]
- [Issue 2]

Please provide the refactored version with explanations of the changes and why they improve the code.
```

## Testing Prompts

These prompts help with creating tests and ensuring code quality.

### Unit Test Generator Prompt

```
Generate comprehensive unit tests for the following [language] code using [testing framework]:

[Code to test]

Include tests for:
- Normal operation
- Edge cases
- Error handling
- Any potential corner cases

Ensure good test coverage and explain the purpose of each test case.
```

### Integration Test Strategy Prompt

```
Help me create an integration testing strategy for the following components in my [framework] application:

[Description of components to test]

The components interact through:
[Description of interfaces/APIs]

Please outline:
1. Key integration scenarios to test
2. Testing approach and tools
3. Mocking strategy
4. Test data management
5. Sample test cases
```

## Prompt Customization Tips

To get the best results from these prompts:

1. **Be specific**: Include relevant details about your project, technologies, and requirements
2. **Provide context**: Share existing code, architecture, or constraints
3. **Clarify preferences**: Mention code style, patterns, or approaches you prefer
4. **Iterate**: Refine your prompts based on the responses you receive

## Contributing Prompts

If you have effective prompts you'd like to share:

1. Fork the [Vibe Coding Cookbook repository](https://github.com/jvalenzano/vibe-coding-cookbook)
2. Add your prompts to the appropriate section in this file
3. Submit a pull request

---

{: .note }
Remember that prompts are just starting points. The most effective AI-assisted development involves iterative refinement and collaborative problem-solving.
EOL
  echo "✅ Created prompt-library.md"
fi

# Create style-guides.md
if [ ! -f "docs/resources/style-guides.md" ]; then
  echo "Creating docs/resources/style-guides.md..."
  cat > docs/resources/style-guides.md << 'EOL'
---
layout: default
title: Style Guides
parent: Resources
nav_order: 3
permalink: /docs/resources/style-guides
---

# Style Guides

{: .fs-9 }
Coding standards and best practices for AI-assisted development
{: .fs-6 .fw-300 }

[Code Structure](#code-structure){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Documentation](#documentation){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Testing](#testing){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Introduction

These style guides provide consistent standards for code written in AI-assisted development workflows. Following these guidelines helps ensure that code remains maintainable, understandable, and reliable regardless of whether it was written by humans or AI assistants.

## Code Structure

### File Organization

- Group related functionality in the same file or module
- Keep files focused on a single responsibility
- Limit file size to maintain readability (typically under 300-400 lines)
- Organize imports in a consistent order:
  1. Core/standard libraries
  2. Third-party dependencies
  3. Local application imports

### Naming Conventions

- Use descriptive, intention-revealing names
- Follow language-specific conventions:
  - camelCase for JavaScript/TypeScript variables and functions
  - PascalCase for classes and component names
  - snake_case for Python variables and functions
- Avoid ambiguous abbreviations
- Prefix interface names with "I" (e.g., IUserService)
- Prefix private members with underscore (_) when appropriate

### Function Design

- Functions should do one thing and do it well
- Keep functions small (preferably under 20-30 lines)
- Use clear parameter names
- Limit the number of parameters (3-4 max, use objects for more)
- Return early to avoid deep nesting
- Include appropriate error handling

## Documentation

### Code Comments

- Write comments that explain "why", not "what"
- Use comments to clarify complex logic or business rules
- Include references to requirements or design decisions
- Avoid commenting out code (use version control instead)
- Keep comments up to date when code changes

### Project Documentation

- Maintain a comprehensive README.md with:
  - Project overview
  - Setup instructions
  - Usage examples
  - Architecture explanation
- Document API endpoints with:
  - Purpose
  - Request/response formats
  - Authentication requirements
  - Examples
- Include diagrams for complex systems or workflows

### AI Assistance Notes

- Document any limitations or known issues with AI-generated code
- Note areas where AI assistance was particularly helpful
- Maintain a prompt library for successful AI interactions
- Include explanations of design choices made with AI assistance

## Testing

### Test Organization

- Match test files structure to source files
- Group tests by feature or functionality
- Use descriptive test names that explain the expected behavior

### Test Coverage

- Aim for high coverage of business logic (80%+)
- Test both happy paths and error cases
- Include edge case tests identified by AI
- Verify boundary conditions

### Test Quality

- Each test should verify one specific behavior
- Use setup and teardown functions for common operations
- Make tests deterministic (avoid random values or timing dependencies)
- Mock external dependencies appropriately

## Language-Specific Guidelines

### JavaScript/TypeScript

- Prefer const for variables that won't be reassigned
- Use let for variables that will be reassigned
- Avoid var
- Utilize TypeScript interfaces for complex objects
- Use async/await rather than raw promises
- Prefer template literals over string concatenation

### Python

- Follow PEP 8 guidelines
- Use type hints (PEP 484)
- Prefer list/dict comprehensions for simple transformations
- Use dataclasses for data containers
- Utilize context managers (with statements) for resource handling

### React

- Use functional components with hooks
- Break down complex components into smaller, reusable ones
- Keep UI and business logic separate
- Centralize state management for complex applications
- Use consistent patterns for handling forms

## Contributing

To contribute to these style guides:

1. Fork the [Vibe Coding Cookbook repository](https://github.com/jvalenzano/vibe-coding-cookbook)
2. Make your changes or additions
3. Submit a pull request with a clear explanation of the improvements

---

{: .note }
These guidelines should be adapted to fit your specific project needs and team preferences.
EOL
  echo "✅ Created style-guides.md"
fi

# Create external-links.md
if [ ! -f "docs/resources/external-links.md" ]; then
  echo "Creating docs/resources/external-links.md..."
  cat > docs/resources/external-links.md << 'EOL'
---
layout: default
title: External Links
parent: Resources
nav_order: 4
permalink: /docs/resources/external-links
---

# External Links

{: .fs-9 }
Useful resources from around the web
{: .fs-6 .fw-300 }

[AI Tools](#ai-tools){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Learning Resources](#learning-resources){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Communities](#communities){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## AI Tools

| Name | Description | Link |
|:-----|:------------|:-----|
| Cursor | AI-first code editor | [cursor.sh](https://cursor.sh) |
| GitHub Copilot | AI pair programmer | [github.com/features/copilot](https://github.com/features/copilot) |
| Claude | Advanced AI assistant | [anthropic.com/claude](https://anthropic.com/claude) |
| Gemini | Google's AI assistant | [gemini.google.com](https://gemini.google.com) |
| ChatGPT | OpenAI's chat interface | [chat.openai.com](https://chat.openai.com) |

## Learning Resources

### Guides and Tutorials

- [AI-Assisted Development Guide](https://github.com/sveltejs/ai-assisted-development-guide) - Practical guidance on working effectively with AI coding tools
- [Andrej Karpathy's Vibe Coding](https://twitter.com/karpathy/status/1707437820045062561) - Original thread on vibe coding concept
- [Prompt Engineering Guide](https://www.promptingguide.ai/) - Learn effective prompting techniques for AI models
- [Just the Docs](https://just-the-docs.github.io/just-the-docs/) - Documentation for the Jekyll theme used in this cookbook

### Books and Publications

- [Building LLM Powered Applications](https://www.oreilly.com/library/view/building-llm-powered/9781098153410/) - Practical guide to building AI-powered applications
- [AI-Assisted Software Engineering](https://www.manning.com/books/ai-assisted-software-engineering) - Techniques for working with AI coding tools
- [The Pragmatic Programmer](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/) - Timeless advice on software craftsmanship

## Communities

### Forums and Discussion Boards

- [r/vibecodingcommunity](https://www.reddit.com/r/vibecodingcommunity/) - Reddit community for vibe coding discussions
- [DEV Community](https://dev.to/t/vibecoding) - Developer articles and discussions on vibe coding
- [Hacker News](https://news.ycombinator.com/) - Tech news and discussions
- [Stack Overflow](https://stackoverflow.com/) - Q&A for developers

### Discord Servers

- [Vibe Coding Community](https://discord.gg/vibecoding) - Official Discord for this cookbook's community
- [Cursor Community](https://discord.gg/cursorcom) - Community for the Cursor AI code editor
- [Anthropic Claude](https://discord.gg/anthropic) - Discord for Claude AI assistant users

### GitHub Organizations

- [github.com/jvalenzano](https://github.com/jvalenzano) - Maintainer of the Vibe Coding Cookbook
- [github.com/cursor-community](https://github.com/cursor-community) - Community resources for Cursor users

## Conferences and Events

- [AI Dev World](https://aidevworld.com/) - Conference for AI-assisted development
- [GitHub Universe](https://githubuniverse.com/) - GitHub's annual developer conference
- [DevDay](https://devday.ai/) - Conference focused on AI in development

## Contributing

Know a great resource that should be included here? 

1. Fork the [Vibe Coding Cookbook repository](https://github.com/jvalenzano/vibe-coding-cookbook)
2. Add your resource to the appropriate section
3. Submit a pull request

---

{: .note }
Links to external sites are provided for informational purposes and do not constitute an endorsement.
EOL
  echo "✅ Created external-links.md"
fi

# Create resources index.md
if [ ! -f "docs/resources/index.md" ]; then
  echo "Creating docs/resources/index.md..."
  cat > docs/resources/index.md << 'EOL'
---
layout: default
title: Resources
nav_order: 5
has_children: true
permalink: /docs/resources
---

# Resources

Additional tools, scripts, guides, and references to support your Vibe Coding journey.

{: .fs-6 .fw-300 }

## Available Resources

- [Scripts](./scripts) - Utility scripts to automate common tasks
- [Prompt Library](./prompt-library) - Collection of effective prompts for AI-assisted development
- [Style Guides](./style-guides) - Coding standards and best practices
- [External Links](./external-links) - Useful resources from around the web

## Using Resources

These resources are designed to complement the Vibe Coding frameworks and can be used independently or together to enhance your development process.
EOL
  echo "✅ Created resources index.md"
fi

# 3. Create project-templates.md if it doesn't exist
echo "📄 Creating project-templates.md..."
mkdir -p docs/examples
if [ ! -f "docs/examples/project-templates.md" ]; then
  echo "Creating docs/examples/project-templates.md"
  cat > docs/examples/project-templates.md << 'EOL'
---
layout: default
title: Project Templates
parent: Examples
nav_order: 2
permalink: /docs/examples/project-templates
---

# Project Templates

{: .fs-9 }
Ready-to-use project templates for common development scenarios
{: .fs-6 .fw-300 }

[Web App](#web-app-template){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[API Service](#api-service-template){: .btn .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Mobile App](#mobile-app-template){: .btn .fs-5 .mb-4 .mb-md-0 }

---

## Why Use Templates?

Project templates provide consistent, well-organized starting points for your development projects. Benefits include:

- **Faster Setup**: Start coding features immediately instead of building infrastructure
- **Best Practices**: Templates follow established patterns and coding standards
- **Consistency**: Maintain the same structure across multiple projects
- **AI-Friendly**: Well-structured templates are easier for AI to understand and extend

## Web App Template

This template provides a foundation for creating modern web applications with React.

### Features

- React 18 with TypeScript
- Tailwind CSS for styling
- Vite for fast development and builds
- Authentication scaffolding
- Responsive layout components
- Unit testing setup with Vitest

### Usage

```bash
# Clone the template
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh

# Create project using the webapp template
./init-project.sh my-project webapp
```

## API Service Template

A robust template for building backend API services with Node.js.

### Features

- Express.js framework
- TypeScript support
- Prisma ORM for database access
- JWT authentication
- Request validation
- API documentation with Swagger
- Testing with Jest

### Usage

```bash
# Clone the template
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh

# Create project using the api template
./init-project.sh my-api-service node-api
```

## Mobile App Template

Start building cross-platform mobile applications with React Native.

### Features

- React Native with TypeScript
- Navigation setup
- State management
- Native UI components
- Camera and location access
- Push notifications scaffold
- Testing with React Native Testing Library

### Usage

```bash
# Clone the template
curl -O https://raw.githubusercontent.com/jvalenzano/vibe-coding-cookbook/main/scripts/init-project.sh
chmod +x init-project.sh

# Create project using the mobile template
./init-project.sh my-mobile-app react-native
```

## Customizing Templates

All templates are designed to be easily customizable. Here's how to modify them for your specific needs:

1. **Review the README.md** file in each template for specific customization instructions
2. **Update configuration files** like package.json with your project details
3. **Modify the branding** elements in the UI components
4. **Add or remove features** based on your project requirements

## Vibe Coding with Templates

Templates work especially well with AI-assisted development. Here's a recommended workflow:

1. **Initialize** your project with the appropriate template
2. **Orient your AI** by explaining the template structure
3. **Implement features** collaboratively with your AI assistant
4. **Test and refine** with AI-assisted debugging

## Contributing Templates

Want to share your own templates with the community? Here's how:

1. Fork the [Vibe Coding Cookbook repository](https://github.com/jvalenzano/vibe-coding-cookbook)
2. Add your template to the `templates/projects` directory
3. Include comprehensive documentation
4. Submit a pull request

---

{: .note }
Templates are actively maintained and updated with best practices. Check the repository regularly for updates.
EOL
  echo "✅ Created project-templates.md"
fi

# 4. Fix _config.yml
echo "🔧 Updating _config.yml..."
if grep -q "color_scheme:" "_config.yml"; then
  # Update existing color_scheme setting
  sed -i '' 's/color_scheme:.*/color_scheme: dark/' "_config.yml" 2>/dev/null ||
  sed -i 's/color_scheme:.*/color_scheme: dark/' "_config.yml"
else
  # Add color_scheme setting if it doesn't exist
  echo "color_scheme: dark" >> "_config.yml"
fi
echo "✅ Updated _config.yml"

# 5. Fix links in markdown files
echo "🔗 Fixing links in markdown files..."

# Function to fix links in a file
fix_links_in_file() {
  local file=$1
  echo "Processing $file..."
  
  # Remove .html extensions from internal links
  sed -i '' 's|/docs/\([^/]*\)/\([^/]*\)\.html|/docs/\1/\2|g' "$file" 2>/dev/null || 
  sed -i 's|/docs/\([^/]*\)/\([^/]*\)\.html|/docs/\1/\2|g' "$file"
  
  # Add baseurl to absolute paths
  sed -i '' 's|href="/docs/|href="/vibe-coding-cookbook/docs/|g' "$file" 2>/dev/null || 
  sed -i 's|href="/docs/|href="/vibe-coding-cookbook/docs/|g' "$file"
  
  # Fix markdown links with absolute paths
  sed -i '' 's|\]\(/docs/|\](/vibe-coding-cookbook/docs/|g' "$file" 2>/dev/null || 
  sed -i 's|\]\(/docs/|\](/vibe-coding-cookbook/docs/|g' "$file"
  
  echo "✅ Fixed links in $file"
}

# Find all markdown files and fix links
find . -name "*.md" -not -path "./node_modules/*" -not -path "./.git/*" | while read -r file; do
  fix_links_in_file "$file"
done

echo "🎉 All fixes complete!"
echo ""
echo "Next steps:"
echo "1. Review the changes to make sure everything looks correct"
echo "2. Commit and push your changes:"
echo "   git add ."
echo "   git commit -m \"Fix dark mode toggle and broken links\""
echo "   git push origin main"
echo ""
echo "3. Wait for GitHub Pages to rebuild (usually 1-5 minutes)"
echo "4. Check your site at https://jvalenzano.github.io/vibe-coding-cookbook/"
echo ""
echo "If you encounter any issues, refer to the troubleshooting guide or open an issue on GitHub."