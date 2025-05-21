<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Portal</title>
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header-controls {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        h1 {
            color: var(--primary);
            font-weight: 600;
            margin: 0;
            font-size: 2rem;
        }

        .theme-toggle, .login-btn {
            background: none;
            border: none;
            color: var(--text-color);
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s;
            padding: 8px 15px;
            border-radius: 6px;
        }

        .theme-toggle {
            font-size: 1.2rem;
            padding: 8px;
        }

        .login-btn {
            background-color: var(--primary);
            color: white;
            font-weight: 500;
        }

        .login-btn:hover {
            background-color: #3a56d4;
            transform: translateY(-2px);
        }

        .theme-toggle:hover {
            transform: rotate(25deg);
        }

        .welcome-section {
            background-color: var(--welcome-bg);
            border-radius: 12px;
            padding: 30px;
            margin-bottom: 40px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }

        .welcome-title {
            font-size: 1.8rem;
            margin-bottom: 15px;
            color: var(--primary);
        }

        .welcome-text {
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
            line-height: 1.6;
            color: var(--text-color);
        }

        .drivers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            margin-bottom: 50px;
        }

        .driver-card {
            background: var(--card-bg);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            text-align: center;
        }

        .driver-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .driver-icon {
            font-size: 3rem;
            margin-bottom: 20px;
            display: inline-block;
            animation: float 3s ease-in-out infinite;
            color: #4361ee;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .driver-name {
            font-weight: 600;
            margin: 10px 0 5px;
            font-size: 1.3rem;
        }

        .driver-position {
            color: #6b7280;
            font-size: 0.9rem;
            margin-bottom: 15px;
        }

        .driver-rating {
            color: #fbbf24;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        .driver-details {
            font-size: 0.9rem;
            color: var(--text-color);
            line-height: 1.5;
            margin-top: 15px;
        }

        @media (max-width: 768px) {
            .drivers-grid {
                grid-template-columns: 1fr;
            }

            .welcome-section {
                padding: 20px;
            }

            .header-controls {
                gap: 10px;
            }

            .login-btn {
                padding: 6px 12px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>Driver Portal</h1>
        <div class="header-controls">
            <button class="login-btn" id="loginButton">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
            <button class="theme-toggle" id="themeToggle">
                <i class="fas fa-moon"></i>
            </button>
        </div>
    </header>

    <div class="welcome-section">
        <h2 class="welcome-title">Welcome to Our Driver Management System</h2>
        <p class="welcome-text">
            Manage your fleet efficiently with our comprehensive driver portal.
            View driver profiles, track performance, and access important tools
            to streamline your operations.
        </p>
    </div>

    <div class="drivers-grid">
        <!-- Driver 1 -->
        <div class="driver-card">
            <div class="driver-icon" style="animation-delay: 0.1s;">
                <i class="fas fa-user-tie"></i>
            </div>
            <h3 class="driver-name">John Doe</h3>
            <div class="driver-position">Senior Driver</div>
            <div class="driver-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span style="color: var(--text-color); margin-left: 5px;">4.7</span>
            </div>
            <div class="driver-details">
                5 years experience<br>
                98% safety record<br>
                Specializes in long-haul
            </div>
        </div>

        <!-- Driver 2 -->
        <div class="driver-card">
            <div class="driver-icon" style="animation-delay: 0.2s;">
                <i class="fas fa-user-tie"></i>
            </div>
            <h3 class="driver-name">Alice Smith</h3>
            <div class="driver-position">Route Specialist</div>
            <div class="driver-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <span style="color: var(--text-color); margin-left: 5px;">4.2</span>
            </div>
            <div class="driver-details">
                3 years experience<br>
                95% on-time rate<br>
                Urban routes expert
            </div>
        </div>

        <!-- Driver 3 -->
        <div class="driver-card">
            <div class="driver-icon" style="animation-delay: 0.3s;">
                <i class="fas fa-user-tie"></i>
            </div>
            <h3 class="driver-name">Bob Brown</h3>
            <div class="driver-position">Safety Trainer</div>
            <div class="driver-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <span style="color: var(--text-color); margin-left: 5px;">5.0</span>
            </div>
            <div class="driver-details">
                8 years experience<br>
                100% safety record<br>
                Certified instructor
            </div>
        </div>

        <!-- Driver 4 -->
        <div class="driver-card">
            <div class="driver-icon" style="animation-delay: 0.4s;">
                <i class="fas fa-user-tie"></i>
            </div>
            <h3 class="driver-name">Karen White</h3>
            <div class="driver-position">Junior Driver</div>
            <div class="driver-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="far fa-star"></i>
                <i class="far fa-star"></i>
                <span style="color: var(--text-color); margin-left: 5px;">3.1</span>
            </div>
            <div class="driver-details">
                1 year experience<br>
                89% on-time rate<br>
                Rapidly improving
            </div>
        </div>

        <!-- Driver 5 -->
        <div class="driver-card">
            <div class="driver-icon" style="animation-delay: 0.5s;">
                <i class="fas fa-user-tie"></i>
            </div>
            <h3 class="driver-name">James Green</h3>
            <div class="driver-position">Fleet Manager</div>
            <div class="driver-rating">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <span style="color: var(--text-color); margin-left: 5px;">5.0</span>
            </div>
            <div class="driver-details">
                10+ years experience<br>
                Manages 25+ drivers<br>
                Logistics specialist
            </div>
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

    // Login button functionality
    document.getElementById('loginButton').addEventListener('click', () => {
        window.location.href = 'login.jsp';
    });
</script>
</body>
</html>