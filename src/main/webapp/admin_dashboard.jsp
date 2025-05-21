<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --bg-color: #f5f7fa;
      --card-bg: #ffffff;
      --text-color: #2d3748;
      --primary: #4361ee;
      --secondary: #f8f9fa;
      --welcome-bg: #eef2ff;
    }

    .dark-mode {
      --bg-color: #1a202c;
      --card-bg: #2d3748;
      --text-color: #f7fafc;
      --primary: #5f6fdb;
      --secondary: #4a5568;
      --welcome-bg: #2d3748;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--bg-color);
      color: var(--text-color);
      margin: 0;
      padding: 0;
      transition: all 0.3s ease;
    }

    .dashboard-container {
      max-width: 1200px;
      margin: 30px auto;
      padding: 20px;
      background-color: var(--card-bg);
      border-radius: 12px; /* Consistent with other pages */
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12); /* Consistent with other pages */
      transition: all 0.3s ease;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-bottom: 20px; /* Adjusted from padding: 20px 0; */
      border-bottom: 1px solid var(--secondary); /* Softer border */
      margin-bottom: 30px;
    }

    .logo {
      display: flex;
      align-items: center;
    }

    .logo-icon {
      font-size: 2.5rem; /* Adjusted size */
      color: var(--primary);
      margin-right: 10px;
    }

    .brand-name {
      font-size: 1.8rem; /* Adjusted size */
      font-weight: 600;
      color: var(--text-color);
    }

    .header-controls { /* New container for theme toggle and logout */
      display: flex;
      align-items: center;
      gap: 15px;
    }

    .theme-toggle {
      background: none;
      border: none;
      color: var(--text-color);
      font-size: 1.2rem;
      cursor: pointer;
      transition: all 0.3s;
      padding: 8px;
      border-radius: 6px;
    }

    .theme-toggle:hover {
      transform: rotate(25deg);
    }

    .logout-btn {
      background-color: var(--primary); /* Primary color for consistency */
      color: white;
      border: none; /* Removed border */
      padding: 10px 20px;
      border-radius: 8px; /* Consistent with other buttons */
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
      display: inline-block;
      font-size: 1rem; /* Consistent font size */
    }

    .logout-btn:hover {
      background-color: #3a56d4; /* Darker primary on hover */
      transform: translateY(-2px); /* Lift effect on hover */
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15); /* Softer shadow */
    }

    .welcome-section {
      background-color: var(--welcome-bg); /* Consistent welcome background */
      border-radius: 12px; /* Consistent with other sections */
      padding: 30px;
      margin-bottom: 40px; /* Adjusted margin */
      text-align: center; /* Centered text */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05); /* Soft shadow */
    }

    h2 {
      color: var(--primary);
      margin-top: 0;
      font-size: 1.8rem; /* Consistent with welcome section title in index.jsp */
      margin-bottom: 15px;
      font-weight: 600;
    }

    p {
      font-size: 1.1rem; /* Consistent text size */
      color: var(--text-color);
      max-width: 700px;
      margin: 0 auto;
      line-height: 1.6;
    }

    .menu-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); /* Consistent grid size */
      gap: 25px; /* Consistent gap */
      margin-bottom: 50px; /* Adjusted margin */
    }

    .menu-item {
      background-color: var(--card-bg);
      border-radius: 12px; /* Consistent with driver cards */
      padding: 25px; /* Consistent padding */
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08); /* Consistent shadow */
      border-left: none; /* Removed specific border-left, using shadow for depth */
      text-align: center; /* Center content */
    }

    .menu-item:hover {
      transform: translateY(-8px); /* Consistent hover effect */
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12); /* Consistent hover shadow */
    }

    .menu-item a {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-decoration: none;
      color: var(--text-color); /* Use text-color */
    }

    .menu-icon {
      font-size: 3rem; /* Consistent icon size */
      margin-bottom: 20px;
      color: var(--primary);
      display: inline-block;
      animation: float 3s ease-in-out infinite; /* Added float animation */
    }

    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
    }

    .menu-text {
      font-size: 1.3rem; /* Consistent text size */
      font-weight: 600; /* Consistent font weight */
      text-align: center;
    }

    @media (max-width: 768px) {
      .menu-grid {
        grid-template-columns: 1fr;
      }

      .header {
        flex-direction: column;
        align-items: flex-start; /* Align items to start for stacked layout */
        gap: 15px; /* Add gap for spacing */
      }

      .header-controls {
        width: 100%; /* Take full width */
        justify-content: flex-end; /* Align controls to the right */
      }

      .welcome-section {
        padding: 20px;
      }
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="header">
    <div class="logo">
      <div class="logo-icon">
        <i class="fas fa-taxi"></i> </div>
      <div class="brand-name">Admin Portal</div> </div>
    <div class="header-controls">
      <button class="theme-toggle" id="themeToggle">
        <i class="fas fa-moon"></i>
      </button>
      <a href="LogoutServlet" class="logout-btn">
        <i class="fas fa-sign-out-alt"></i> Log Out
      </a>
    </div>
  </div>

  <div class="welcome-section">
    <h2>Welcome, Administrator!</h2>
    <p>Manage your fleet operations, driver profiles, and system settings efficiently from here.</p>
  </div>

  <div class="menu-grid">
    <div class="menu-item">
      <a href="addDriver.jsp">
        <div class="menu-icon">
          <i class="fas fa-user-plus"></i> </div>
        <div class="menu-text">Add Driver</div>
      </a>
    </div>

    <div class="menu-item">
      <a href="view-drivers">
        <div class="menu-icon">
          <i class="fas fa-users-viewfinder"></i> </div>
        <div class="menu-text">View Drivers</div>
      </a>
    </div>

    <div class="menu-item">
      <a href="updateDriver.jsp">
        <div class="menu-icon">
          <i class="fas fa-user-edit"></i> </div>
        <div class="menu-text">Update Driver</div>
      </a>
    </div>

    <div class="menu-item">
      <a href="deleteDriver.jsp">
        <div class="menu-icon">
          <i class="fas fa-user-minus"></i> </div>
        <div class="menu-text">Delete Driver</div>
      </a>
    </div>
  </div>
</div>

<script>
  // Theme toggle functionality
  const themeToggle = document.getElementById('themeToggle');
  const icon = themeToggle.querySelector('i');

  // Check for saved theme preference
  if (localStorage.getItem('theme') === 'dark') {
    document.body.classList.add('dark-mode');
    icon.classList.replace('fa-moon', 'fa-sun');
  }

  themeToggle.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');

    if (document.body.classList.contains('dark-mode')) {
      icon.classList.replace('fa-moon', 'fa-sun');
      localStorage.setItem('theme', 'dark');
    } else {
      icon.classList.replace('fa-sun', 'fa-moon');
      localStorage.setItem('theme', 'light');
    }
  });
</script>
</body>
</html>