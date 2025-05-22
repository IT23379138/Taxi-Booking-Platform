<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--ghfghf--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You - CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: var(--accent);
            opacity: 0;
        }
        .success-icon {
            font-size: 4rem;
            color: var(--success);
            margin-bottom: 1.5rem;
            animation: bounce 1s ease infinite;
        }
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-15px); }
        }
    </style>
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card glass text-center py-5 px-4 position-relative overflow-hidden">
                <!-- Confetti elements -->
                <div class="confetti" style="top: 10%; left: 20%;"></div>
                <div class="confetti" style="top: 20%; left: 50%;"></div>
                <div class="confetti" style="top: 15%; left: 80%;"></div>

                <div class="card-body">
                    <div class="success-icon">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h2 class="mb-3">Thank You!</h2>
                    <p class="lead mb-4">Your feedback has been submitted successfully.</p>
                    <p class="text-muted mb-4">
                        We appreciate you taking the time to help us improve our services.
                    </p>
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                        <a href="feedback?action=form" class="btn btn-primary px-4">
                            <i class="fas fa-comment-dots me-2"></i>Submit Another
                        </a>
                        <a href="index.jsp" class="btn btn-outline-primary px-4">
                            <i class="fas fa-home me-2"></i>Return Home
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Simple confetti animation
    document.addEventListener('DOMContentLoaded', () => {
        const confettiElements = document.querySelectorAll('.confetti');

        confettiElements.forEach((el, index) => {
            setTimeout(() => {
                el.style.opacity = '1';
                el.style.transform = `translateY(${Math.random() * 300 + 100}px) rotate(${Math.random() * 360}deg)`;
                el.style.transition = `all ${Math.random() * 2 + 1}s ease-out`;
            }, index * 300);
        });
    });
</script>
</body>
</html>