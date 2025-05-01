// Dark mode toggle and Mermaid integration
document.addEventListener("DOMContentLoaded", function() {
  console.log("DOM Content Loaded - Dark Mode Script Running");
  
  // Check if we're on a page that has the dark mode toggle
  const toggleDarkMode = document.querySelector('.js-toggle-dark-mode');
  console.log("Toggle button found:", toggleDarkMode !== null);
  
  // Function to apply the theme based on localStorage or system preference
  function applyTheme() {
    const savedTheme = localStorage.getItem('theme');
    console.log("Saved theme from localStorage:", savedTheme);
    
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    console.log("System prefers dark:", systemPrefersDark);
    
    // If theme is saved in localStorage, use that, otherwise use system preference
    const themeToApply = savedTheme || (systemPrefersDark ? 'dark' : 'light');
    console.log("Theme to apply:", themeToApply);
    
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
        console.log("Using jtd.setTheme for dark mode");
        jtd.setTheme('dark');
      }
    } else {
      document.querySelector('html').setAttribute('data-theme', 'light');
      
      // If jtd object exists (Just the Docs theme), use its setTheme function
      if (typeof jtd !== 'undefined' && jtd.setTheme) {
        console.log("Using jtd.setTheme for light mode");
        jtd.setTheme('light');
      }
    }
  }
  
  // Apply theme on page load
  applyTheme();
  
  // If toggle button exists, add event listener
  if (toggleDarkMode) {
    console.log("Adding click event listener to toggle button");
    toggleDarkMode.addEventListener('click', function() {
      console.log("Toggle button clicked");
      const currentTheme = localStorage.getItem('theme') || 'light';
      console.log("Current theme before toggle:", currentTheme);
      
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      console.log("New theme after toggle:", newTheme);
      
      setTheme(newTheme);
      
      // Update button text
      this.textContent = newTheme === 'dark' ? 'Toggle Light Mode' : 'Toggle Dark Mode';
    });
  } else {
    console.log("No toggle button found - skipping event listener");
  }
  
  // Also respond to system preference changes if user hasn't manually selected a theme
  const prefersDarkScheme = window.matchMedia('(prefers-color-scheme: dark)');
  prefersDarkScheme.addEventListener('change', function(e) {
    console.log("System theme preference changed");
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