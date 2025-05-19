<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
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

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #4361ee;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .login-button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #4361ee;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #3a56d4;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome!</h1>
    <a href="login.jsp" class="login-button">Login</a>
</div>
</body>
</html>