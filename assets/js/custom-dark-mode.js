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
