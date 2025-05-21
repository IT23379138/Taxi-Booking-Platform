<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.model.Driver" %>
<%@ page import="org.example.util.DriverFileUtil" %>
<%@ page import="java.util.List" %>
<%
  if (session == null || session.getAttribute("role") == null || !session.getAttribute("role").equals("user")) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Driver> drivers = DriverFileUtil.getAllDriversSortedByRating();
%>

<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
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
      --table-header-bg: #e9ecef;
      --table-row-even: #f8f9fa;
      --table-row-hover: #f0f0f5;
      --star-color: #ffc107;
      --info-bar-bg: #f0f0f5;
    }

    .dark-mode {
      --bg-color: #1a202c;
      --card-bg: #2d3748;
      --text-color: #f7fafc;
      --primary: #5f6fdb;
      --secondary: #4a5568;
      --welcome-bg: #2d3748;
      --table-header-bg: #4a5568;
      --table-row-even: #2d3748;
      --table-row-hover: #4a5568;
      --star-color: #fdd835;
      --info-bar-bg: #4a5568;
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
      margin: 0 auto;
      padding: 20px;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 30px;
      padding-bottom: 15px;
      border-bottom: 1px solid var(--secondary);
    }

    .header-left {
      display: flex;
      align-items: center;
    }

    .logo-icon {
      font-size: 2rem;
      color: var(--primary);
      margin-right: 15px;
    }

    h1 {
      color: var(--primary);
      margin: 0;
      font-size: 1.8rem;
      font-weight: 600;
    }

    .user-actions {
      display: flex;
      gap: 15px;
    }

    .btn {
      padding: 8px 16px;
      border-radius: 6px;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }

    .btn-primary {
      background-color: var(--primary);
      color: white;
      border: none;
    }

    .btn-primary:hover {
      background-color: #3a56d4;
      transform: translateY(-2px);
    }

    .btn-danger {
      background-color: #e63946;
      color: white;
      border: none;
    }

    .btn-danger:hover {
      background-color: #d62839;
      transform: translateY(-2px);
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

    .welcome-card {
      background-color: var(--welcome-bg);
      padding: 20px;
      border-radius: 12px;
      margin-bottom: 30px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
    }

    .welcome-message {
      font-size: 1.2rem;
      margin-bottom: 10px;
    }

    .welcome-subtext {
      color: var(--text-color);
      opacity: 0.8;
    }

    /* Table Styles (same as before) */
    .table-container {
      background-color: var(--card-bg);
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
      overflow-x: auto;
      margin-bottom: 20px;
      transition: all 0.3s ease;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    th {
      background-color: var(--table-header-bg);
      color: var(--text-color);
      text-align: left;
      padding: 14px 16px;
      font-weight: 600;
      border-bottom: 2px solid var(--secondary);
    }

    td {
      padding: 14px 16px;
      border-bottom: 1px solid var(--secondary);
      color: var(--text-color);
    }

    tr:nth-child(even) {
      background-color: var(--table-row-even);
    }

    tr:hover {
      background-color: var(--table-row-hover);
    }

    .rating-cell {
      position: relative;
    }

    .rating-value {
      display: flex;
      align-items: center;
      color: var(--star-color);
      font-weight: 500;
    }

    .rating-stars {
      display: inline-block;
      margin-left: 8px;
      color: var(--star-color);
      font-size: 16px;
    }

    .info-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 20px;
      color: var(--text-color);
      font-size: 14px;
      background-color: var(--info-bar-bg);
      padding: 12px 20px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
    }

    .driver-count strong {
      color: var(--primary);
    }

    @media (max-width: 768px) {
      .header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
      }

      .user-actions {
        width: 100%;
        justify-content: space-between;
      }

      .dashboard-container {
        padding: 10px;
      }

      th, td {
        padding: 10px;
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="header">
    <div class="header-left">
      <div class="logo-icon">
        <i class="fas fa-taxi"></i>
      </div>
      <h1>Taxi Booking Dashboard</h1>
    </div>
    <div class="user-actions">
      <button class="theme-toggle" id="themeToggle">
        <i class="fas fa-moon"></i>
      </button>
      <a href="logout" class="btn btn-danger">
        <i class="fas fa-sign-out-alt"></i> Logout
      </a>
    </div>
  </div>

  <div class="welcome-card">
    <div class="welcome-message">Welcome, User!</div>
    <div class="welcome-subtext">Here you can view all available drivers sorted by their ratings.</div>
  </div>

  <div class="info-bar">
    <div class="driver-count">
      <strong><%= drivers.size() %></strong> drivers available
    </div>
    <div>Sorted by highest rating</div>
  </div>

  <div class="table-container">
    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>License</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Rating</th>
      </tr>
      </thead>
      <tbody>
      <% for (Driver driver : drivers) {
        String stars = "";
        double rating = driver.getRating();
        int fullStars = (int)rating;
        boolean hasHalfStar = (rating - fullStars) >= 0.5;

        for (int i = 0; i < fullStars; i++) {
          stars += "★";
        }

        if (hasHalfStar) {
          stars += "½";
        }

        while (stars.length() < 5) {
          stars += "☆";
        }
      %>
      <tr>
        <td><%= driver.getId() %></td>
        <td><%= driver.getName() %></td>
        <td><%= driver.getLicenseNumber() %></td>
        <td><%= driver.getPhone() %></td>
        <td><%= driver.getEmail() %></td>
        <td class="rating-cell">
          <div class="rating-value">
            <%= String.format("%.1f", driver.getRating()) %>
            <span class="rating-stars"><%= stars %></span>
          </div>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
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
  });//
</script>
</body>
</html>