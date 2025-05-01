#!/bin/bash

# Script to fix common issues with links in the Vibe Coding Cookbook

echo "🔍 Fixing links in the Vibe Coding Cookbook..."

# Create missing pages first
echo "📄 Creating missing pages..."

# 1. Create project-templates.md if it doesn't exist
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

# Fix links in markdown files
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

# Fix dark mode toggle
echo "🌓 Fixing dark mode toggle..."

# Update custom-dark-mode.js
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
    
    // Update button text if it exists
    if (toggleDarkMode) {
      toggleDarkMode.textContent = themeToApply === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
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
      
      // Update button text
      this.textContent = newTheme === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
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
      
      // Update button text if it exists
      if (toggleDarkMode) {
        toggleDarkMode.textContent = e.matches ? 'Toggle Light Mode' : 'Toggle Dark Mode';
      }
    }
  });
});
EOL
echo "✅ Updated custom-dark-mode.js"

# Update nav_footer_custom.html
cat > _includes/nav_footer_custom.html << 'EOL'
<button id="dark-mode-toggle" class="btn js-toggle-dark-mode">Toggle Dark Mode</button>

<hr>
<p class="text-small text-grey-dk-100">
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook">GitHub</a> |
  <a href="https://github.com/jvalenzano/vibe-coding-cookbook/issues">Report an Issue</a>
</p>
EOL
echo "✅ Updated nav_footer_custom.html"

# Ensure _config.yml has the dark scheme
if grep -q "color_scheme:" "_config.yml"; then
  # Update existing color_scheme setting
  sed -i '' 's/color_scheme:.*/color_scheme: dark/' _config.yml 2>/dev/null ||
  sed -i 's/color_scheme:.*/color_scheme: dark/' _config.yml
else
  # Add color_scheme setting if it doesn't exist
  echo "color_scheme: dark" >> _config.yml
fi
echo "✅ Updated _config.yml with dark color scheme"

echo "🎉 All fixes complete!"
echo "Now run:"
echo "git add ."
echo "git commit -m \"Fix links and dark mode toggle\""
echo "git push origin main"