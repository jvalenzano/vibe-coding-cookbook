#!/bin/bash

# Quick fix for navigation issues
echo "🔧 Applying quick navigation fix..."

# 1. Create _includes directory for dark mode toggle
mkdir -p _includes

# 2. Add dark mode toggle
echo "📝 Adding dark mode toggle..."
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
EOL

# 3. Simply rename the duplicate files to fix navigation
if [ -d "docs/getting-started" ]; then
  echo "📝 Fixing duplicate entries..."
  # Rename any duplicate files
  find docs/getting-started -name "*.md" | sort
  # Find files containing duplicate titles and rename them
  grep -l "title: Getting Started" docs/getting-started/*.md | head -n 1 > /tmp/keep.txt
  grep -l "title: Getting Started" docs/getting-started/*.md | grep -v -f /tmp/keep.txt > /tmp/rename.txt
  
  # Process files to rename
  if [ -s /tmp/rename.txt ]; then
    while read file; do
      echo "Fixing duplicate title in $file"
      # Create a temporary file
      temp=$(mktemp)
      # Change the title in the front matter
      sed '0,/title: Getting Started/s//title: Getting Started Overview/' "$file" > "$temp"
      mv "$temp" "$file"
    done < /tmp/rename.txt
  fi
  
  # Do the same for Environment Setup
  grep -l "title: Environment Setup" docs/getting-started/*.md | head -n 1 > /tmp/keep.txt
  grep -l "title: Environment Setup" docs/getting-started/*.md | grep -v -f /tmp/keep.txt > /tmp/rename.txt
  
  # Process files to rename
  if [ -s /tmp/rename.txt ]; then
    while read file; do
      echo "Fixing duplicate title in $file"
      # Create a temporary file
      temp=$(mktemp)
      # Change the title in the front matter
      sed '0,/title: Environment Setup/s//title: Setup Guide/' "$file" > "$temp"
      mv "$temp" "$file"
    done < /tmp/rename.txt
  fi
fi

# 4. Update _config.yml to include required plugin
if [ -f "_config.yml" ]; then
  echo "📝 Updating _config.yml..."
  if ! grep -q "jekyll-include-cache" _config.yml; then
    if grep -q "plugins:" _config.yml; then
      # Add to existing plugins
      sed -i '' '/plugins:/a\\n  - jekyll-include-cache' _config.yml 2>/dev/null || 
      sed -i '/plugins:/a\  - jekyll-include-cache' _config.yml
    else
      # Add plugins section
      echo -e "\nplugins:\n  - jekyll-include-cache" >> _config.yml
    fi
  fi
fi

echo "✅ Quick fix applied! Now run:"
echo "git add ."
echo "git commit -m \"Fix navigation duplicates and add dark mode toggle\""
echo "git push origin main"