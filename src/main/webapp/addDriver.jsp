<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add Driver</title>
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

    .container {
      max-width: 800px;
      margin: 30px auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    .header {
      display: flex;
      align-items: center;
      margin-bottom: 30px;
      color: #4361ee;
      border-bottom: 2px solid #ddd;
      padding-bottom: 15px;
    }

    .logo-icon {
      font-size: 28px;
      color: #4361ee;
      margin-right: 15px;
    }

    h2 {
      color: #4361ee;
      margin: 0;
      font-size: 26px;
    }

    .form-container {
      background-color: #fff;
      border-radius: 8px;
      padding: 30px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 25px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #333;
      font-weight: 600;
      font-size: 16px;
    }

    input[type="text"],
    input[type="email"] {
      width: 100%;
      padding: 14px;
      border: 1px solid #ddd;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 16px;
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus {
      border-color: #4361ee;
      outline: none;
      box-shadow: 0 0 5px rgba(67, 97, 238, 0.3);
    }

    .btn-submit {
      background-color: #4361ee;
      color: white;
      border: none;
      padding: 14px 24px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 18px;
      font-weight: 600;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .btn-submit:hover {
      background-color: #3a56d4;
      transform: translateY(-2px);
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
    }

    .back-link {
      display: inline-flex;
      align-items: center;
      color: #6c757d;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s ease;
      margin-top: 20px;
    }

    .back-link:before {
      content: "←";
      margin-right: 8px;
      font-size: 18px;
    }

    .back-link:hover {
      color: #4361ee;
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
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="logo-icon">🚕</div>
    <h2>Add New Driver</h2>
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

      <div class="form-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-col">
        <div class="form-group">
          <label for="phoneNumber">Phone Number</label>
          <input type="text" id="phoneNumber" name="phoneNumber" required>
        </div>
      </div>


      <div class="form-row">
        <div class="form-col">
          <div class="form-group">
            <label for="licenseNumber">License Number</label>
            <input type="text" id="licenseNumber" name="licenseNumber" required>
          </div>
        </div>
      </div>



      <div class="form-actions">
        <a href="index.jsp" class="back-link">Back to Dashboard</a>
        <button type="submit" class="btn-submit">Add Driver</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>