#!/bin/bash

# Exit on error
set -e

echo "🔄 Starting Vibe Coding Cookbook navigation fix..."

# Ensure we're in the repository directory
if [[ $(basename $(pwd)) == "scripts" ]]; then
  echo "📂 Running from scripts directory, moving to parent directory..."
  cd ..
fi

# Store the repository directory
REPO_DIR=$(pwd)
echo "📂 Repository directory: $REPO_DIR"

# 1. Fix duplicate Getting Started items by ensuring unique titles and nav_order values
echo "📝 Fixing duplicate Getting Started items..."

# Update the main Getting Started page
if [ -f docs/getting-started/index.md ]; then
  echo "Updating docs/getting-started/index.md..."
  sed -i '' 's/title: Getting Started/title: Getting Started Guide/g' docs/getting-started/index.md 2>/dev/null || sed -i 's/title: Getting Started/title: Getting Started Guide/g' docs/getting-started/index.md
  sed -i '' 's/Getting Started with Vibe Coding/Getting Started Guide/g' docs/getting-started/index.md 2>/dev/null || sed -i 's/Getting Started with Vibe Coding/Getting Started Guide/g' docs/getting-started/index.md
fi

# 2. Fix duplicate Environment Setup pages
echo "📝 Fixing duplicate Environment Setup pages..."

# Check if there's a duplicate environment setup page
if [ -f "docs/getting-started/Environment Setup.md" ] && [ -f "docs/getting-started/environment-setup.md" ]; then
  echo "Removing duplicate Environment Setup.md..."
  rm "docs/getting-started/Environment Setup.md"
fi

# 3. Add dark mode toggle if not already present
echo "📝 Ensuring dark mode toggle is added..."

mkdir -p _includes

# Check if nav_footer_custom.html exists and contains dark mode toggle
if [ ! -f _includes/nav_footer_custom.html ] || ! grep -q "js-toggle-dark-mode" _includes/nav_footer_custom.html; then
  echo "Adding dark mode toggle..."
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

# 4. Fix other duplicate pages if needed
echo "📝 Checking for other potential duplicates..."

# Find all md files and rename them consistently
find docs -name "*.md" | while read file; do
  # Convert to lowercase with hyphens
  dir=$(dirname "$file")
  base=$(basename "$file" .md)
  new_base=$(echo "$base" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  
  # If the base name has changed, rename the file
  if [ "$base" != "$new_base" ]; then
    new_file="$dir/$new_base.md"
    if [ ! -f "$new_file" ]; then
      echo "Renaming $file to $new_file..."
      mv "$file" "$new_file"
    fi
  fi
done

# Fix duplicate items in _config.yml
if grep -q "duplicates" _config.yml; then
  echo "Updating _config.yml to handle duplicates better..."
  # Add or update configuration to better handle duplicates
  if ! grep -q "collections_dir" _config.yml; then
    echo "
# Better organization for collections
collections_dir: collections
" >> _config.yml
  fi
fi

# 5. Commit the changes
echo "📦 Changes made. To apply them, run:"
echo "git add ."
echo "git commit -m \"Fix navigation duplicates and add dark mode toggle\""
echo "git push origin main"

echo "✅ Navigation fix complete!"