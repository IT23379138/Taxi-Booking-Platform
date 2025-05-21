<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
            --welcome-bg: #eef2ff; /* Not directly used in login, but good for consistency */
        }

        .dark-mode {
            --bg-color: #1a202c;
            --card-bg: #2d3748;
            --text-color: #f7fafc;
            --primary: #5f6fdb;
            --secondary: #4a5568;
            --welcome-bg: #2d3748; /* Not directly used in login, but good for consistency */
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            transition: all 0.3s ease;
        }

        .login-wrapper {
            position: relative; /* For positioning the theme toggle */
            width: 380px;
            max-width: 90%;
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
            text-align: center;
            transition: all 0.3s ease;
        }

        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
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

        .logo {
            margin-bottom: 30px;
        }

        .logo-icon {
            font-size: 3.5rem; /* Adjusted size */
            color: var(--primary);
            margin-bottom: 10px;
        }

        .brand-name {
            font-size: 1.8rem; /* Adjusted size */
            font-weight: 600;
            color: var(--text-color);
        }

        h2 {
            color: var(--primary);
            text-align: center;
            font-size: 2rem; /* Adjusted size */
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 25px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-color);
            font-weight: 500;
            font-size: 1rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px;
            border: 1px solid var(--secondary); /* Using secondary for subtle border */
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1rem;
            color: var(--text-color);
            background-color: var(--bg-color); /* Input background matching overall background */
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2); /* Softer focus glow */
        }

        .btn-submit {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 15px;
            width: 100%;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: 600;
            transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #3a56d4;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .error-message {
            color: #ff3d00;
            background-color: #ffebee;
            padding: 15px;
            border-radius: 8px;
            margin-top: 25px;
            font-size: 0.95rem;
            text-align: center;
            border: 1px solid #ff7961;
        }

        .dark-mode .error-message {
            background-color: #4a1c1c;
            color: #ffcccc;
            border-color: #8b0000;
        }

        @media (max-width: 480px) {
            .login-wrapper {
                padding: 30px 20px;
            }
            .theme-toggle {
                top: 15px;
                right: 15px;
                font-size: 1rem;
            }
            h2 {
                font-size: 1.8rem;
            }
            .logo-icon {
                font-size: 3rem;
            }
            .brand-name {
                font-size: 1.5rem;
            }
            .btn-submit {
                font-size: 1rem;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
<div class="login-wrapper">
    <button class="theme-toggle" id="themeToggle">
        <i class="fas fa-moon"></i>
    </button>
    <div class="logo">
        <div class="logo-icon">
            <i class="fas fa-taxi"></i> </div>
        <div class="brand-name">Driver Portal</div> </div>
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