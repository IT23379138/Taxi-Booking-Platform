<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Admin Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f8f9fa;
      color: #333;
      margin: 0;
      padding: 0;
    }

    .dashboard-container {
      max-width: 1200px;
      margin: 30px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 20px 0;
      border-bottom: 2px solid #ddd;
      margin-bottom: 30px;
    }

    .logo {
      display: flex;
      align-items: center;
    }

    .logo-icon {
      font-size: 32px;
      color: #4361ee;
      margin-right: 10px;
    }

    .brand-name {
      font-size: 24px;
      font-weight: 600;
      color: #333;
    }

    .welcome-section {
      background-color: #e9ecef;
      border-radius: 8px;
      padding: 25px;
      margin-bottom: 30px;
    }

    h2 {
      color: #4361ee;
      margin-top: 0;
      font-size: 26px;
      margin-bottom: 10px;
    }

    p {
      font-size: 16px;
      color: #6c757d;
    }

    .menu-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }

    .menu-item {
      background-color: #fff;
      border-radius: 8px;
      padding: 20px;
      transition: transform 0.3s, box-shadow 0.3s;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-left: 5px solid #4361ee;
    }

    .menu-item:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .menu-item a {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-decoration: none;
      color: #333;
    }

    .menu-icon {
      font-size: 36px;
      margin-bottom: 15px;
      color: #4361ee;
    }

    .menu-text {
      font-size: 18px;
      font-weight: 500;
      text-align: center;
    }

    .logout-section {
      text-align: right;
      margin-top: 20px;
    }

    .logout-btn {
      background-color: transparent;
      color: #4361ee;
      border: 2px solid #4361ee;
      padding: 10px 20px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s;
      display: inline-block;
    }

    .logout-btn:hover {
      background-color: #4361ee;
      color: #fff;
      box-shadow: 0 2px 5px rgba(67, 97, 238, 0.3);
    }

    @media (max-width: 768px) {
      .menu-grid {
        grid-template-columns: 1fr;
      }

      .header {
        flex-direction: column;
        text-align: center;
      }

      .logout-section {
        text-align: center;
        margin-top: 20px;
      }
    }
  </style>
</head>
<body>
<div class="dashboard-container">
  <div class="header">
    <div class="logo">
      <div class="logo-icon">🚕</div>
      <div class="brand-name">Admin Panel</div>
    </div>
    <div class="logout-section">
      <a href="LogoutServlet" class="logout-btn">Log Out</a>
    </div>
  </div>

  <div class="welcome-section">
    <h2>Welcome, Administrator!</h2>
    <p>Manage your taxi service efficiently with the options below.</p>
  </div>

  <div class="menu-grid">
    <div class="menu-item">
      <a href="addDriver.jsp">
        <div class="menu-icon">➕</div>
        <div class="menu-text">Add Driver</div>
      </a>
    </div>

    <div class="menu-item">
      <a href="view-drivers">
        <div class="menu-icon">🚗</div>
        <div class="menu-text">View Drivers</div>
      </a>
    </div>

    <div class="menu-item">
      <a href="updateDriver.jsp">
        <div class="menu-icon">✏️</div>
        <div class="menu-text">Update Driver</div>
      </a>
    </div>

    <div class="menu-item">
      <a href="deleteDriver.jsp">
        <div class="menu-icon">🗑️</div>
        <div class="menu-text">Delete Driver</div>
      </a>
    </div>
  </div>
</div>
</body>
</html>