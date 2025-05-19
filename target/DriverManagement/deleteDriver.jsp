<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Delete Driver</title>
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
      max-width: 600px;
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

    .warning-box {
      background-color: #ffebee;
      border-left: 5px solid #f44336;
      padding: 15px;
      margin-bottom: 25px;
      border-radius: 0 8px 8px 0;
      font-size: 16px;
      color: #d32f2f;
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
      color: #333;
      font-weight: 600;
      font-size: 16px;
    }

    input[type="text"] {
      width: 100%;
      padding: 14px;
      border: 1px solid #ddd;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 16px;
      transition: border-color 0.3s ease;
    }

    input[type="text"]:focus {
      border-color: #f44336;
      outline: none;
      box-shadow: 0 0 5px rgba(244, 67, 54, 0.3);
    }

    .btn-danger {
      background-color: #f44336;
      color: white;
      border: none;
      padding: 14px 24px;
      border-radius: 8px;
      cursor: pointer;
      font-size: 18px;
      font-weight: 600;
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .btn-danger:hover {
      background-color: #d32f2f;
      transform: translateY(-2px);
      box-shadow: 0 2px 5px rgba(211, 47, 47, 0.3);
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
      color: #495057;
      font-size: 16px;
    }

    .confirmation-group input[type="checkbox"] {
      margin-right: 10px;
      width: 18px;
      height: 18px;
    }

    .confirmation-group label {
      margin-bottom: 0;
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
      }
    }
  </style>
  <script>
    function validateForm() {
      var confirmation = document.getElementById('confirm-delete').checked;
      if (!confirmation) {
        alert('Please confirm the deletion.');
        return false;
      }
      return confirm('Are you sure you want to delete this driver? This action cannot be undone.');
    }
  </script>
</head>
<body>
<div class="container">
  <div class="header">
    <div class="logo-icon">🚕</div>
    <h2>Delete Driver</h2>
  </div>

  <div class="form-container">
    <div class="warning-box">
      <span class="warning-title">Warning: Permanent Action</span>
      Deleting a driver will permanently remove their data from the system.
    </div>

    <form id="delete-form" action="DeleteDriverServlet" method="post" onsubmit="return validateForm()">
      <div class="form-group">
        <label for="id">Driver ID to Delete</label>
        <input type="text" id="id" name="id" required placeholder="Enter driver ID">
      </div>

      <div class="confirmation-group">
        <input type="checkbox" id="confirm-delete" name="confirm-delete">
        <label for="confirm-delete">Confirm deletion</label>
      </div>

      <div class="form-actions">
        <a href="index.jsp" class="back-link">Back to Dashboard</a>
        <button type="submit" class="btn-danger">Delete Driver</button>
      </div>
    </form>
  </div>
</div>
</body>
</html>