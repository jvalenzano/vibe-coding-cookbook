// Dark mode toggle and Mermaid integration
document.addEventListener("DOMContentLoaded", function() {
  // Check if we're on a page that has the dark mode toggle
  const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');
  
  if (!toggleDarkMode) {
    // If the toggle doesn't exist on this page, we still need to apply the saved theme
    applyTheme();
    return;
  }
  
  // Apply theme on page load
  applyTheme();
  
  // Toggle theme when button is clicked
  toggleDarkMode.addEventListener('click', function() {
    const currentTheme = localStorage.getItem('theme') || 'light';
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
    
    setTheme(newTheme);
    
    // Update button text
    this.textContent = newTheme === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
  });
  
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
  
  // Handle Mermaid diagrams with theme changes
  setupMermaidThemeObserver();
});

// Function to apply the theme based on localStorage or system preference
function applyTheme() {
  const savedTheme = localStorage.getItem('theme');
  const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  
  // If theme is saved in localStorage, use that, otherwise use system preference
  const themeToApply = savedTheme || (systemPrefersDark ? 'dark' : 'light');
  
  setTheme(themeToApply);
  
  // Update button text if it exists
  const toggleButton = document.querySelector('.js-toggle-dark-mode');
  if (toggleButton) {
    toggleButton.textContent = themeToApply === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
  }
}

// Function to set the theme
function setTheme(theme) {
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
}

// Function to set up theme observer for Mermaid diagrams
function setupMermaidThemeObserver() {
  // Wait for mermaid to be available
  if (typeof window.mermaid !== 'undefined') {
    updateMermaidTheme();
    
    // Watch for theme changes
    const observer = new MutationObserver(function(mutations) {
      mutations.forEach(function(mutation) {
        if (mutation.attributeName === 'data-theme') {
          updateMermaidTheme();
        }
      });
    });
    
    observer.observe(document.querySelector('html'), { attributes: true });
  }
}

// Function to update Mermaid theme based on current site theme
function updateMermaidTheme() {
  if (typeof window.mermaid !== 'undefined') {
    const isDarkMode = document.querySelector('html').getAttribute('data-theme') === 'dark';
    
    window.mermaid.initialize({
      theme: isDarkMode ? 'dark' : 'default'
    });
    
    // Re-render Mermaid diagrams
    try {
      // For diagrams using the <div class="mermaid"> format
      window.mermaid.init(undefined, document.querySelectorAll('.mermaid'));
      
      // For diagrams using the ```mermaid format
      window.mermaid.init(undefined, document.querySelectorAll('.language-mermaid'));
    } catch (error) {
      console.warn('Failed to reinitialize Mermaid diagrams:', error);
    }
  }
}