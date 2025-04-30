#!/bin/bash

# Repository cleanup script to remove duplicates and fix structure
echo "🧹 Starting repository cleanup..."

# 1. Remove duplicate docs inside scripts folder
echo "🗑️ Removing duplicate docs in scripts folder..."
rm -rf scripts/docs

# 2. Move configuration files out of scripts folder to root
echo "📦 Moving configuration files from scripts to root..."

# Check if these files exist in scripts folder and are not in root already
if [ -f "scripts/_config.yml" ] && [ ! -f "_config.yml.bak" ]; then
  # Backup existing config if needed
  if [ -f "_config.yml" ]; then
    mv _config.yml _config.yml.bak
  fi
  # Move config from scripts to root
  mv scripts/_config.yml ./
fi

if [ -f "scripts/404.html" ] && [ ! -f "404.html.bak" ]; then
  # Backup existing 404 if needed
  if [ -f "404.html" ]; then
    mv 404.html 404.html.bak
  fi
  # Move 404 from scripts to root
  mv scripts/404.html ./
fi

if [ -f "scripts/index.md" ] && [ ! -f "index.md.bak" ]; then
  # Backup existing index if needed
  if [ -f "index.md" ]; then
    mv index.md index.md.bak
  fi
  # Move index from scripts to root
  mv scripts/index.md ./
fi

# 3. Ensure nav_footer_custom.html exists for dark mode toggle
echo "🌓 Ensuring dark mode toggle is in place..."
mkdir -p _includes
if [ -f "scripts/_includes/nav_footer_custom.html" ]; then
  # Use the one from scripts if it exists
  cp scripts/_includes/nav_footer_custom.html _includes/
elif [ ! -f "_includes/nav_footer_custom.html" ]; then
  # Create a new one if it doesn't exist
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

# 4. Ensure jekyll-include-cache is in Gemfile and _config.yml
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

echo "✅ Repository cleanup complete! Now run:"
echo "git add ."
echo "git commit -m \"Clean up repository structure and remove duplicates\""
echo "git push origin main"