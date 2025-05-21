<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Driver</title>
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

    .container {
      max-width: 800px;
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
      color: var(--primary);
      margin-right: 15px;
    }

    h2 {
      color: var(--primary);
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

    input[type="text"],
    input[type="email"],
    input[type="tel"] { /* Added type="tel" for phone number consistency */
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

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="tel"]:focus {
      border-color: var(--primary);
      outline: none;
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2); /* Softer focus glow */
    }

    .btn-submit {
      background-color: var(--primary);
      color: white;
      border: none;
      padding: 15px 25px; /* Adjusted padding */
      border-radius: 8px; /* Consistent border radius */
      cursor: pointer;
      font-size: 1.1rem; /* Consistent font size */
      font-weight: 600;
      transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

    .btn-submit:hover {
      background-color: #3a56d4;
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
      color: var(--primary);
      transform: translateX(-5px); /* Slight movement on hover */
    }

    .back-link i { /* Styling for Font Awesome icon */
      margin-right: 8px;
      font-size: 1.1rem;
    }

    .form-row {
      display: flex;
      flex-wrap: wrap;
      margin: 0 -10px;
    }

    .form-col {
      flex: 1 0 calc(50% - 20px);
      padding: 0 10px;
      box-sizing: border-box;
      margin-bottom: 20px;
    }

    .form-actions {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 30px;
    }

    @media (max-width: 768px) {
      .form-col {
        flex: 1 0 100%;
      }
      .header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
      }
      .form-actions {
        flex-direction: column;
        gap: 20px;
        align-items: stretch;
      }
      .btn-submit, .back-link {
        width: 100%;
        text-align: center;
        justify-content: center; /* For back-link icon centering */
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="header-left">
      <div class="logo-icon">
        <i class="fas fa-user-plus"></i> </div>
      <h2>Add New Driver</h2>
    </div>
    <button class="theme-toggle" id="themeToggle">
      <i class="fas fa-moon"></i>
    </button>
  </div>

  <div class="form-container">
    <form action="AddDriverServlet" method="post">
      <div class="form-row">
        <div class="form-col">
          <div class="form-group">
            <label for="id">Driver ID</label>
            <input type="text" id="id" name="id" required>
          </div>
        </div>
        <div class="form-col">
          <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" required>
          </div>
        </div>
      </div>

      <div class="form-row">
        <div class="form-col">
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" required>
          </div>
        </div>
        <div class="form-col">
          <div class="form-group">
            <label for="phoneNumber">Phone Number</label>
            <input type="tel" id="phoneNumber" name="phoneNumber" required> </div>
        </div>
      </div>

      <div class="form-group">
        <label for="licenseNumber">License Number</label>
        <input type="text" id="licenseNumber" name="licenseNumber" required>
      </div>

      <div class="form-actions">
        <a href="admin_dashboard.jsp" class="back-link">
          <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
        <button type="submit" class="btn-submit">Add Driver</button>
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
</script>
</body>
</html>