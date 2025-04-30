#!/bin/bash

# Final fixes for remaining issues
echo "🔧 Applying final fixes..."

# 1. Fix duplicate Home menu items
echo "🏠 Fixing duplicate Home menu items..."
# Check if there's a second home.md or duplicate Home link
find . -type f -name "home.md" | while read -r file; do
  echo "Removing duplicate home file: $file"
  rm "$file"
done

# Ensure index.md has unique title
if [ -f "index.md" ]; then
  sed -i '' 's/title: "Home"/title: "Vibe Coding Cookbook"/g' index.md 2>/dev/null || 
  sed -i 's/title: "Home"/title: "Vibe Coding Cookbook"/g' index.md
  echo "✅ Updated index.md title"
fi

# 2. Fix mermaid diagrams
echo "📊 Fixing mermaid diagrams..."

# Update _config.yml to properly enable mermaid
if [ -f "_config.yml" ]; then
  # Remove existing mermaid config if any
  sed -i '' '/mermaid:/,/initialize:/d' _config.yml 2>/dev/null ||
  sed -i '/mermaid:/,/initialize:/d' _config.yml
  
  # Add updated mermaid config
  cat >> _config.yml << 'EOL'

# Enable Mermaid diagrams
mermaid:
  version: "9.1.6"
  initialize: true
EOL
  echo "✅ Updated mermaid configuration in _config.yml"
fi

# Add mermaid initialization to head_custom.html
mkdir -p _includes
if [ ! -f "_includes/head_custom.html" ]; then
  cat > _includes/head_custom.html << 'EOL'
<!-- Mermaid support -->
<script src="https://cdn.jsdelivr.net/npm/mermaid@9.1.6/dist/mermaid.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    mermaid.initialize({
      startOnLoad: true,
      theme: 'default',
      securityLevel: 'loose',
      flowchart: { useMaxWidth: true, htmlLabels: true }
    });
  });
</script>
EOL
  echo "✅ Added mermaid script to head_custom.html"
fi

# 3. Fix dark mode toggle
echo "🌓 Fixing dark mode toggle..."
cat > _includes/nav_footer_custom.html << 'EOL'
<button class="btn js-toggle-dark-mode">Toggle Dark Mode</button>

<script>
  // Handle dark mode toggle
  document.addEventListener("DOMContentLoaded", function() {
    const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');
    
    // Check for saved preference or use system preference
    const savedTheme = localStorage.getItem('theme') ||
                      (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    
    // Apply theme on page load
    if (savedTheme === 'dark') {
      document.querySelector('html').setAttribute('data-theme', 'dark');
      toggleDarkMode.textContent = 'Toggle Light Mode';
    }
    
    // Toggle theme when button is clicked
    toggleDarkMode.addEventListener('click', function() {
      const currentTheme = document.querySelector('html').getAttribute('data-theme') || 'light';
      
      if (currentTheme === 'dark') {
        document.querySelector('html').setAttribute('data-theme', 'light');
        toggleDarkMode.textContent = 'Toggle Dark Mode';
        localStorage.setItem('theme', 'light');
        jtd.setTheme('light');
      } else {
        document.querySelector('html').setAttribute('data-theme', 'dark');
        toggleDarkMode.textContent = 'Toggle Light Mode';
        localStorage.setItem('theme', 'dark');
        jtd.setTheme('dark');
      }
    });
  });
</script>

<hr>
<p class="text-small text-grey-dk-100">
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook">GitHub</a> |
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook/issues">Report an Issue</a>
</p>
EOL
echo "✅ Updated dark mode toggle"

# 4. Replace mermaid diagrams with image references to ensure they work
echo "🖼️ Replacing mermaid diagrams with images..."

# Create images directory if it doesn't exist
mkdir -p images/diagrams

# Create a workflow diagram image file if it doesn't exist
cat > images/diagrams/workflow.svg << 'EOL'
<svg xmlns="http://www.w3.org/2000/svg" width="800" height="400" viewBox="0 0 800 400">
  <style>
    .box { fill: #fff; stroke-width: 2px; }
    .box-bmad { stroke: #5E35B1; fill: #e8eaf6; }
    .box-cursor { stroke: #00897B; fill: #e0f2f1; }
    .box-default { stroke: #ccc; fill: #f9f9f9; }
    .arrow { stroke: #666; stroke-width: 2px; fill: none; }
    text { font-family: Arial, sans-serif; font-size: 14px; fill: #333; }
    .title { font-weight: bold; font-size: 16px; }
  </style>
  
  <!-- Boxes -->
  <rect x="350" y="20" width="100" height="50" rx="5" class="box box-default" />
  <rect x="350" y="90" width="100" height="50" rx="5" class="box box-bmad" />
  <rect x="350" y="160" width="100" height="50" rx="5" class="box box-bmad" />
  <rect x="350" y="230" width="100" height="50" rx="5" class="box box-cursor" />
  <rect x="350" y="300" width="100" height="50" rx="5" class="box box-cursor" />
  <rect x="350" y="370" width="100" height="50" rx="5" class="box box-cursor" />
  <rect x="350" y="440" width="100" height="50" rx="5" class="box box-default" />
  
  <!-- Arrows -->
  <path d="M400 70 L400 90" class="arrow" marker-end="url(#arrowhead)" />
  <path d="M400 140 L400 160" class="arrow" marker-end="url(#arrowhead)" />
  <path d="M400 210 L400 230" class="arrow" marker-end="url(#arrowhead)" />
  <path d="M400 280 L400 300" class="arrow" marker-end="url(#arrowhead)" />
  <path d="M400 350 L400 370" class="arrow" marker-end="url(#arrowhead)" />
  <path d="M400 420 L400 440" class="arrow" marker-end="url(#arrowhead)" />
  
  <!-- Text -->
  <text x="400" y="45" text-anchor="middle" class="title">Project Idea</text>
  <text x="400" y="115" text-anchor="middle" class="title">BMAD Business Analyst</text>
  <text x="400" y="130" text-anchor="middle">Gather Requirements</text>
  <text x="400" y="185" text-anchor="middle" class="title">BMAD Architect</text>
  <text x="400" y="200" text-anchor="middle">Design System</text>
  <text x="400" y="255" text-anchor="middle" class="title">CursorRIPER Plan</text>
  <text x="400" y="270" text-anchor="middle">Implementation Strategy</text>
  <text x="400" y="325" text-anchor="middle" class="title">CursorRIPER Execute</text>
  <text x="400" y="340" text-anchor="middle">Generate Code</text>
  <text x="400" y="395" text-anchor="middle" class="title">CursorRIPER Review</text>
  <text x="400" y="410" text-anchor="middle">Test & Optimize</text>
  <text x="400" y="465" text-anchor="middle" class="title">Project Delivery</text>
  
  <!-- Arrowhead marker -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#666" />
    </marker>
  </defs>
</svg>
EOL

# Update workflow.md to use the image instead of mermaid
if [ -f "docs/getting-started/workflow.md" ]; then
  # Replace mermaid diagram with an image
  sed -i '' '/<div class="mermaid"/,/<\/div>/c\
![Workflow Diagram](/vibe-coding-cookbook/images/diagrams/workflow.svg)
' docs/getting-started/workflow.md 2>/dev/null ||
  sed -i '/<div class="mermaid"/,/<\/div>/c\
![Workflow Diagram](/vibe-coding-cookbook/images/diagrams/workflow.svg)
' docs/getting-started/workflow.md
  echo "✅ Updated workflow.md to use SVG image"
fi

# Update index.md to use the image instead of mermaid
if [ -f "index.md" ]; then
  # Replace mermaid diagram with an image
  sed -i '' '/<div class="mermaid"/,/<\/div>/c\
![Workflow Diagram](/vibe-coding-cookbook/images/diagrams/workflow.svg)
' index.md 2>/dev/null ||
  sed -i '/<div class="mermaid"/,/<\/div>/c\
![Workflow Diagram](/vibe-coding-cookbook/images/diagrams/workflow.svg)
' index.md
  echo "✅ Updated index.md to use SVG image"
fi

# 5. Fix resource links in other files
echo "🔗 Fixing resource links..."

# Fix environment setup link in first-project.md
if [ -f "docs/getting-started/first-project.md" ]; then
  sed -i '' 's#/docs/getting-started/environment-setup#../environment-setup#g' docs/getting-started/first-project.md 2>/dev/null ||
  sed -i 's#/docs/getting-started/environment-setup#../environment-setup#g' docs/getting-started/first-project.md
  echo "✅ Fixed environment setup link in first-project.md"
fi

# Create missing resource pages for scripts, prompt-library, etc.
mkdir -p docs/resources

# Create scripts.md if it doesn't exist
if [ ! -f "docs/resources/scripts.md" ]; then
  cat > docs/resources/scripts.md << 'EOL'
---
layout: default
title: Scripts
parent: Resources
nav_order: 1
permalink: /docs/resources/scripts
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
  echo "✅ Created scripts.md"
fi

# Create prompt-library.md if it doesn't exist
if [ ! -f "docs/resources/prompt-library.md" ]; then
  cat > docs/resources/prompt-library.md << 'EOL'
---
layout: default
title: Prompt Library
parent: Resources
nav_order: 2
permalink: /docs/resources/prompt-library
---

# Prompt Library

A collection of effective prompts for AI-assisted development.

## BMAD Method Prompts

### Business Analyst

```
As a Business Analyst, analyze the requirements for a [feature/system]. Consider user needs, business objectives, and industry standards. Provide a comprehensive list of functional and non-functional requirements.
```

### Software Architect

```
As a Software Architect, design a system architecture for [feature/application] that needs to handle [requirements]. Consider scalability, security, and maintainability. Provide component diagrams and data flow.
```

### Developer

```
As a Developer, implement [feature] based on the provided requirements and architecture. Write clean, maintainable code with appropriate error handling and comments.
```

## CursorRIPER Prompts

### Research Mode

```
Using CursorRIPER Research mode, gather information about [topic/technology]. Find best practices, common patterns, and potential pitfalls. Summarize the findings in a concise report.
```

### Innovate Mode

```
Using CursorRIPER Innovate mode, brainstorm creative solutions for [problem]. Generate at least 3 different approaches, highlighting the pros and cons of each.
```

### Plan Mode

```
Using CursorRIPER Plan mode, create a detailed implementation plan for [feature]. Break down the work into tasks, estimate effort, identify dependencies, and suggest a timeline.
```

### Execute Mode

```
Using CursorRIPER Execute mode, implement [specific task] according to the plan. Generate code that follows our coding standards and includes appropriate tests.
```

### Review Mode

```
Using CursorRIPER Review mode, analyze the implementation of [feature/code]. Identify potential bugs, security vulnerabilities, performance issues, and suggest improvements.
```

## Vibe-Tools Prompts

```
vibe-tools ask "How do I implement a secure authentication system using JWT in a Node.js application?"

vibe-tools web "Best practices for React state management in 2025"

vibe-tools repo "Explain how our authentication flow works"

vibe-tools plan "Add a user profile feature to our application"

vibe-tools doc "Generate API documentation for our user service"
```

## Contribution Guidelines

When contributing to the prompt library, please:

1. Test your prompts with different AI models
2. Ensure prompts are clear and specific
3. Include examples of expected output
4. Document any limitations or edge cases
EOL
  echo "✅ Created prompt-library.md"
fi

# Create style-guides.md if it doesn't exist
if [ ! -f "docs/resources/style-guides.md" ]; then
  cat > docs/resources/style-guides.md << 'EOL'
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
EOL
  echo "✅ Created style-guides.md"
fi

# Create external-links.md if it doesn't exist
if [ ! -f "docs/resources/external-links.md" ]; then
  cat > docs/resources/external-links.md << 'EOL'
---
layout: default
title: External Links
parent: Resources
nav_order: 4
permalink: /docs/resources/external-links
---

# External Links

Useful resources from around the web to support your Vibe Coding journey.

## AI Tools & Resources

- [Anthropic Claude Documentation](https://docs.anthropic.com/)
- [OpenAI Documentation](https://platform.openai.com/docs/)
- [Cursor Editor](https://cursor.sh/)
- [GitHub Copilot](https://github.com/features/copilot)
- [Prompt Engineering Guide](https://www.promptingguide.ai/)

## BMAD Method

- [BMAD Method Repository](https://github.com/bmadcode/BMAD-METHOD)
- [BMAD Method Documentation](https://github.com/bmadcode/BMAD-METHOD/blob/main/README.md)

## CursorRIPER Framework

- [CursorRIPER Repository](https://github.com/johnpeterman72/CursorRIPER)
- [CursorRIPER Documentation](https://github.com/johnpeterman72/CursorRIPER/blob/main/README.md)

## Vibe-Tools Framework

- [vibe-tools Repository](https://github.com/eastlondoner/cursor-tools)
- [vibe-tools Documentation](https://github.com/eastlondoner/cursor-tools/blob/main/README.md)

## Development Resources

- [Modern JavaScript Tutorial](https://javascript.info/)
- [Python Documentation](https://docs.python.org/3/)
- [React Documentation](https://react.dev/)
- [Node.js Documentation](https://nodejs.org/en/docs/)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)

## Design Patterns & Architecture

- [Refactoring Guru](https://refactoring.guru/)
- [Martin Fowler's Patterns](https://martinfowler.com/articles/patterns-of-distributed-systems/)
- [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Microservices.io](https://microservices.io/)

## Books & Articles

- [Software Engineering at Google](https://abseil.io/resources/swe-book)
- [Designing Data-Intensive Applications](https://dataintensive.net/)
- [The Pragmatic Programmer](https://pragprog.com/titles/tpp20/the-pragmatic-programmer-20th-anniversary-edition/)
- [Clean Code](https://www.oreilly.com/library/view/clean-code-a/9780136083238/)

## Communities

- [Stack Overflow](https://stackoverflow.com/)
- [Dev.to](https://dev.to/)
- [Hacker News](https://news.ycombinator.com/)
- [Reddit r/programming](https://www.reddit.com/r/programming/)
EOL
  echo "✅ Created external-links.md"
fi

# Create index.md for resources if it doesn't exist
if [ ! -f "docs/resources/index.md" ]; then
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
  echo "✅ Created resources index.md"
fi

echo "✅ All fixes complete! Now run:"
echo "git add ."
echo "git commit -m \"Fix remaining issues with mermaid diagrams and resource links\""
echo "git push origin main"