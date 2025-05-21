<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Driver</title>
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
      --danger-color: #ef4444; /* A modern red for danger */
      --danger-light: #fee2e2; /* Lighter red for warning box */
    }

    .dark-mode {
      --bg-color: #1a202c;
      --card-bg: #2d3748;
      --text-color: #f7fafc;
      --primary: #5f6fdb;
      --secondary: #4a5568;
      --welcome-bg: #2d3748;
      --danger-color: #dc2626; /* Darker red for dark mode */
      --danger-light: #be123c; /* Darker light red for dark mode */
    }

    /* New rules for dark mode warning text */
    .dark-mode .warning-box {
      color: #000000; /* Set warning box text to black in dark mode */
    }

    .dark-mode .warning-box .warning-title {
      color: #000000; /* Set warning title text to black in dark mode */
    }


    body {
      font-family: 'Poppins', sans-serif;
      background-color: var(--bg-color);
      color: var(--text-color);
      margin: 0;
      padding: 0;
      transition: all 0.3s ease;
    }

    .container {
      max-width: 600px;
      margin: 30px auto;
      padding: 20px;
      background-color: var(--card-bg);
      border-radius: 12px; /* Consistent with other pages */
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12); /* Consistent with other pages */
      transition: all 0.3s ease;
    }

    .header {
      display: flex;
      justify-content: space-between; /* To push theme toggle to right */
      align-items: center;
      margin-bottom: 30px;
      border-bottom: 1px solid var(--secondary); /* Softer border */
      padding-bottom: 15px;
    }

    .header-left { /* Group logo and title */
      display: flex;
      align-items: center;
    }

    .logo-icon {
      font-size: 2rem; /* Adjusted size */
      color: var(--danger-color); /* Danger color for delete icon */
      margin-right: 15px;
    }

    h2 {
      color: var(--danger-color); /* Danger color for delete title */
      margin: 0;
      font-size: 1.8rem; /* Adjusted size */
      font-weight: 600;
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

    .form-container {
      background-color: var(--card-bg); /* Uses card background */
      border-radius: 12px; /* Consistent with other cards */
      padding: 30px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08); /* Consistent shadow */
      margin-bottom: 20px;
      transition: all 0.3s ease;
    }

    .warning-box {
      background-color: var(--danger-light);
      border-left: 5px solid var(--danger-color);
      padding: 15px;
      margin-bottom: 25px;
      border-radius: 0 8px 8px 0;
      font-size: 1rem;
      color: var(--danger-color);
    }

    .warning-title {
      font-weight: 600;
      margin-bottom: 8px;
      display: block;
    }

    .form-group {
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: var(--text-color);
      font-weight: 500; /* Consistent font weight */
      font-size: 1rem;
    }

    input[type="text"] {
      width: 100%;
      padding: 14px;
      border: 1px solid var(--secondary); /* Uses secondary for subtle border */
      border-radius: 8px; /* Consistent border radius */
      box-sizing: border-box;
      font-size: 1rem;
      color: var(--text-color);
      background-color: var(--bg-color); /* Input background matching overall background */
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus {
      border-color: var(--danger-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.2); /* Softer focus glow, danger color */
    }

    .btn-danger {
      background-color: var(--danger-color);
      color: white;
      border: none;
      padding: 15px 25px; /* Adjusted padding */
      border-radius: 8px; /* Consistent border radius */
      cursor: pointer;
      font-size: 1.1rem; /* Consistent font size */
      font-weight: 600;
      transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

    .btn-danger:hover {
      background-color: #c02a2a; /* Slightly darker red on hover */
      transform: translateY(-3px); /* Consistent hover effect */
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2); /* Consistent hover shadow */
    }

    .back-link {
      display: inline-flex;
      align-items: center;
      color: var(--text-color); /* Uses text-color */
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease, transform 0.2s ease;
      margin-top: 20px; /* Adjusted margin */
      font-size: 1rem; /* Consistent font size */
    }

    .back-link:hover {
      color: var(--primary); /* Primary color on hover */
      transform: translateX(-5px); /* Slight movement on hover */
    }

    .back-link i { /* Styling for Font Awesome icon */
      margin-right: 8px;
      font-size: 1.1rem;
    }

    .form-actions {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 30px;
    }

    .confirmation-group {
      margin-top: 20px;
      display: flex;
      align-items: center;
      color: var(--text-color);
      font-size: 1rem;
    }

    .confirmation-group input[type="checkbox"] {
      margin-right: 10px;
      width: 18px;
      height: 18px;
      accent-color: var(--danger-color); /* Style checkbox with danger color */
    }

    .confirmation-group label {
      margin-bottom: 0;
      font-weight: 400; /* Lighter font weight for checkbox label */
    }

    #delete-form {
      transition: opacity 0.3s;
    }

    @media (max-width: 768px) {
      .form-actions {
        flex-direction: column;
        align-items: stretch;
        gap: 15px;
      }

      .back-link {
        margin-top: 0;
        margin-bottom: 10px;
        width: 100%;
        text-align: center;
        justify-content: center; /* For back-link icon centering */
      }
      .btn-danger {
        width: 100%;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="header-left">
      <div class="logo-icon">
        <i class="fas fa-trash-alt"></i>
      </div>
      <h2>Delete Driver</h2>
    </div>
    <button class="theme-toggle" id="themeToggle">
      <i class="fas fa-moon"></i>
    </button>
  </div>

  <div class="form-container">
    <div class="warning-box">
      <span class="warning-title">Warning: Permanent Action</span>
      Deleting a driver will permanently remove their data from the system. This action cannot be undone.
    </div>

    <form id="delete-form" action="DeleteDriverServlet" method="post" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="id">Driver ID to Delete</label>
        <input type="text" id="id" name="id" required placeholder="Enter driver ID">
      </div>

      <div class="confirmation-group">
        <input type="checkbox" id="confirm-delete" name="confirm-delete">
        <label for="confirm-delete">I understand that this action is irreversible</label>
      </div>

      <div class="form-actions">
        <a href="admin_dashboard.jsp" class="back-link">
          <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
        <button type="submit" class="btn-danger">Delete Driver</button>
      </div>
    </form>
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

  // Your existing validateForm function
  function validateForm() {
    var confirmation = document.getElementById('confirm-delete').checked;
    if (!confirmation) {
      alert('Please confirm the deletion.');
      return false;
    }
    return confirm('Are you sure you want to delete this driver? This action cannot be undone.');
  }
</script>
</body>
</html>