<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logged Out - CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .logout-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            position: relative;
        }
        .logout-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 8px;
            background: linear-gradient(90deg, var(--accent), var(--accent-light));
        }
        .logout-icon {
            font-size: 5rem;
            color: var(--accent);
            margin-bottom: 1.5rem;
            animation: fadeIn 1s ease;
        }
        .countdown {
            font-size: 1.2rem;
            margin-top: 1rem;
        }
    </style>
</head>
<body class="fadeIn">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card glass logout-card shadow-lg">
                <div class="card-body py-5 px-4 text-center">
                    <div class="logout-icon">
                        <i class="fas fa-sign-out-alt"></i>
                    </div>
                    <h1 class="mb-3">You're Logged Out</h1>
                    <p class="lead mb-4">
                        You have been successfully signed out of your CityCabs account.
                    </p>
                    <p class="text-muted mb-4">
                        Thank you for using our service. We hope to see you again soon!
                    </p>

                    <div class="countdown text-muted mb-4">
                        Redirecting to home page in <span id="countdown">5</span> seconds...
                    </div>

                    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                        <a href="index.jsp" class="btn btn-primary px-4">
                            <i class="fas fa-sign-in-alt me-2"></i>Login Again
                        </a>
                        <a href="contact.jsp" class="btn btn-outline-primary px-4">
                            <i class="fas fa-headset me-2"></i>Contact Support
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Countdown timer for redirect
    let seconds = 5;
    const countdownElement = document.getElementById('countdown');
    const countdownInterval = setInterval(() => {
        seconds--;
        countdownElement.textContent = seconds;

        if (seconds <= 0) {
            clearInterval(countdownInterval);
            window.location.href = 'index.jsp';
        }
    }, 1000);
</script>
</body>
</html>