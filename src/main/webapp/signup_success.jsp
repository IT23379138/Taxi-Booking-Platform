<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .welcome-card {
            border: none;
            border-radius: 16px;
            overflow: hidden;
            position: relative;
        }
        .welcome-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 8px;
            background: linear-gradient(90deg, var(--accent), var(--accent-light));
        }
        .welcome-icon {
            font-size: 5rem;
            color: var(--success);
            margin-bottom: 1.5rem;
            animation: pulse 1.5s ease infinite;
        }
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }
        .next-steps {
            text-align: left;
            margin-top: 2rem;
        }
        .next-steps li {
            margin-bottom: 0.5rem;
        }
    </style>
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card glass welcome-card shadow-lg">
                <div class="card-body py-5 px-4 text-center">
                    <div class="welcome-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h1 class="mb-3" style="color: var(--text-color);">Welcome to CityCabs!</h1>
                    <p class="lead mb-4" style="color: var(--text-light);">Your account has been successfully created. We're excited to have you on board!</p>

                    <div class="d-flex justify-content-center gap-3 mb-4">
                        <div class="px-3 py-2 rounded bg-light">
                            <small class="text-muted d-block" style="color: var(--text-light);">Username</small>
                            <strong style="color: var(--text-color);">${sessionScope.username}</strong>
                        </div>
                        <div class="px-3 py-2 rounded bg-light">
                            <small class="text-muted d-block" style="color: var(--text-light);">Email</small>
                            <strong style="color: var(--text-color);">${sessionScope.userEmail}</strong>
                        </div>
                    </div>

                    <div class="next-steps bg-glass p-4 rounded">
                        <h5 class="mb-3" style="color: var(--text-color);"><i class="fas fa-road me-2"></i>What's Next?</h5>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check-circle text-success me-2"></i> Complete your profile</li>
                            <li><i class="fas fa-check-circle text-success me-2"></i> Verify your email address</li>
                            <li><i class="fas fa-car-alt me-2" style="color: var(--text-color);"></i> Book your first ride</li>
                            <li><i class="fas fa-star me-2" style="color: var(--text-color);"></i> Earn rewards with each trip</li>
                        </ul>
                    </div>

                    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mt-5">
                        <a href="index.jsp" class="btn btn-primary btn-lg px-4" style="color: white;">
                            <i class="fas fa-car-alt me-2"></i>Book Your First Ride
                        </a>
                        <a href="feedback?action=form" class="btn btn-outline-primary btn-lg px-4" style="color: var(--text-color);">
                            <i class="fas fa-comment-dots me-2"></i>Share Feedback
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>