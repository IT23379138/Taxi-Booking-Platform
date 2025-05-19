<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 320px;
            max-width: 90%;
        }

        h2 {
            color: #4361ee;
            text-align: center;
            font-size: 28px;
            margin-bottom: 30px;
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
        input[type="password"] {
            width: 100%;
            padding: 14px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #4361ee;
            outline: none;
            box-shadow: 0 0 5px rgba(67, 97, 238, 0.3);
        }

        .btn-submit {
            background-color: #4361ee;
            color: white;
            border: none;
            padding: 14px;
            width: 100%;
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

        .error-message {
            color: #ff3d00;
            background-color: #ffebee;
            padding: 12px;
            border-radius: 6px;
            margin-top: 20px;
            font-size: 14px;
            text-align: center;
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-icon {
            font-size: 48px;
            color: #4361ee;
            margin-bottom: 10px;
        }

        .brand-name {
            font-size: 22px;
            font-weight: 600;
            color: #333;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="logo">
        <div class="logo-icon">🚕</div>
        <div class="brand-name">Taxi Service</div>
    </div>
    <h2>Sign In</h2>
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="btn-submit">Log In</button>
    </form>

    <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="error-message"><%= error %></div>
    <% } %>
</div>
</body>
</html>