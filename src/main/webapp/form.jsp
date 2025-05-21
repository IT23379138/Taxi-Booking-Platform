<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Feedback - CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 40px 0;
        }
        
        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: var(--transition);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            border-bottom: none;
            padding: 20px;
            text-align: center;
        }
        
        .card-body {
            padding: 30px;
        }
        
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px;
            border: 1px solid #e1e5eb;
            transition: var(--transition);
            background-color: rgba(255, 255, 255, 0.8);
        }
        
        .form-control:focus, .form-select:focus {
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.3);
            border-color: var(--primary-color);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: 10px;
            padding: 12px 20px;
            font-weight: 500;
            letter-spacing: 0.5px;
            transition: var(--transition);
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
        }
        
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-start;
            margin: 10px 0;
        }
        
        .rating input {
            display: none;
        }
        
        .rating label {
            cursor: pointer;
            font-size: 2em;
            color: #ddd;
            padding: 0 0.1em;
            transition: var(--transition);
        }
        
        .rating input:checked ~ label,
        .rating label:hover,
        .rating label:hover ~ label {
            color: #ffbb00;
            transform: scale(1.1);
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--dark-color);
        }
        
        .form-section {
            margin-bottom: 25px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s ease forwards;
        }
        
        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .feedback-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .page-title {
            font-weight: 600;
            margin-bottom: 30px;
            color: var(--primary-color);
        }
        
        .alert {
            border-radius: 10px;
            animation: shake 0.5s ease;
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-5px); }
            40%, 80% { transform: translateX(5px); }
        }
        
        .input-group-text {
            background-color: var(--light-color);
            border-radius: 10px 0 0 10px;
            border: 1px solid #e1e5eb;
        }
        
        /* Animation delays for staggered effect */
        .form-section:nth-child(1) { animation-delay: 0.1s; }
        .form-section:nth-child(2) { animation-delay: 0.2s; }
        .form-section:nth-child(3) { animation-delay: 0.3s; }
        .form-section:nth-child(4) { animation-delay: 0.4s; }
        .form-section:nth-child(5) { animation-delay: 0.5s; }
        .form-section:nth-child(6) { animation-delay: 0.6s; }
        .form-section:nth-child(7) { animation-delay: 0.7s; }
        
        .btn-submit {
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .btn-submit:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.2);
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease;
            z-index: -1;
        }
        
        .btn-submit:hover:after {
            transform: scaleX(1);
            transform-origin: left;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container animate__animated animate__fadeIn">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="text-center mb-4">
                <i class="fas fa-comment-dots feedback-icon animate__animated animate__bounceIn"></i>
                <h2 class="page-title animate__animated animate__fadeInUp">Share Your Experience</h2>
                <p class="text-muted animate__animated animate__fadeInUp animate__delay-1s">We value your feedback to improve our services</p>
            </div>
            
            <div class="card">
                <div class="card-body p-md-5">
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>${error}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="feedback" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="action" value="submitFeedback">
                        
                        <div class="form-section">
                            <div class="mb-4">
                                <label for="name" class="form-label">
                                    <i class="fas fa-user me-2"></i>Your Name
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    <input type="text" class="form-control" id="name" name="name" value="${sessionScope.username}" placeholder="Enter your name" required>
                                </div>
                                <div class="invalid-feedback">Please enter your name.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="mb-4">
                                <label for="email" class="form-label">
                                    <i class="fas fa-envelope me-2"></i>Email Address
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                    <input type="email" class="form-control" id="email" name="email" value="${sessionScope.userEmail}" placeholder="Enter your email" required>
                                </div>
                                <div class="invalid-feedback">Please enter a valid email address.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="mb-4">
                                <label for="category" class="form-label">
                                    <i class="fas fa-tag me-2"></i>Feedback Category
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-tag"></i></span>
                                    <select class="form-select" id="category" name="category" required>
                                        <option value="">Select a category</option>
                                        <option value="Service">Service Quality</option>
                                        <option value="Driver">Driver Behavior</option>
                                        <option value="Vehicle">Vehicle Condition</option>
                                        <option value="App">Mobile Application</option>
                                        <option value="Pricing">Pricing & Payments</option>
                                        <option value="Other">Other Concerns</option>
                                    </select>
                                </div>
                                <div class="invalid-feedback">Please select a category.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="mb-4">
                                <label for="driverId" class="form-label">
                                    <i class="fas fa-id-card me-2"></i>Select Driver
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-id-card"></i></span>
                                    <select class="form-select" id="driverId" name="driverId" required>
                                        <option value="">Choose your driver</option>
                                        <c:forEach var="driver" items="${drivers}">
                                            <option value="${driver.key}">${driver.value}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="invalid-feedback">Please select a driver.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="mb-4">
                                <label class="form-label">
                                    <i class="fas fa-star me-2"></i>Rate Our Service
                                </label>
                                <div class="rating">
                                    <input type="radio" name="rating" value="5" id="5" required><label for="5">★</label>
                                    <input type="radio" name="rating" value="4" id="4"><label for="4">★</label>
                                    <input type="radio" name="rating" value="3" id="3"><label for="3">★</label>
                                    <input type="radio" name="rating" value="2" id="2"><label for="2">★</label>
                                    <input type="radio" name="rating" value="1" id="1"><label for="1">★</label>
                                </div>
                                <div class="invalid-feedback">Please select a rating.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="mb-4">
                                <label class="form-label">
                                    <i class="fas fa-user-tie me-2"></i>Rate Your Driver
                                </label>
                                <div class="rating">
                                    <input type="radio" name="driverRating" value="5" id="d5" required><label for="d5">★</label>
                                    <input type="radio" name="driverRating" value="4" id="d4"><label for="d4">★</label>
                                    <input type="radio" name="driverRating" value="3" id="d3"><label for="d3">★</label>
                                    <input type="radio" name="driverRating" value="2" id="d2"><label for="d2">★</label>
                                    <input type="radio" name="driverRating" value="1" id="d1"><label for="d1">★</label>
                                </div>
                                <div class="invalid-feedback">Please select a driver rating.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="mb-4">
                                <label for="message" class="form-label">
                                    <i class="fas fa-comment-alt me-2"></i>Your Feedback
                                </label>
                                <textarea class="form-control" id="message" name="message" rows="4" placeholder="Please share your experience, suggestions or concerns..." required></textarea>
                                <div class="invalid-feedback">Please enter your feedback message.</div>
                            </div>
                        </div>

                        <div class="form-section">
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-lg btn-submit animate__animated animate__pulse animate__infinite animate__slow">
                                    <i class="fas fa-paper-plane me-2"></i>Submit Feedback
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            
            <div class="text-center mt-4 text-muted animate__animated animate__fadeIn animate__delay-2s">
                <small>Thank you for helping us improve! Your feedback matters.</small>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
// Form validation
(function () {
    'use strict'
    var forms = document.querySelectorAll('.needs-validation')
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }
            form.classList.add('was-validated')
        }, false)
    })
})()

// Enhanced animations
document.addEventListener('DOMContentLoaded', function() {
    // Animate form sections on scroll
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animationPlayState = 'running';
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    document.querySelectorAll('.form-section').forEach(section => {
        observer.observe(section);
    });
    
    // Smooth star rating animation
    const ratingLabels = document.querySelectorAll('.rating label');
    ratingLabels.forEach(label => {
        label.addEventListener('mouseover', function() {
            this.classList.add('animate__animated', 'animate__heartBeat');
        });
        
        label.addEventListener('animationend', function() {
            this.classList.remove('animate__animated', 'animate__heartBeat');
        });
    });
    
    // Form submission animation
    const form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
        if (form.checkValidity()) {
            const button = document.querySelector('.btn-submit');
            button.classList.remove('animate__pulse', 'animate__infinite');
            button.classList.add('animate__animated', 'animate__bounceOut');
            
            // Add loading effect
            setTimeout(() => {
                button.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
                button.classList.remove('animate__bounceOut');
                button.classList.add('animate__bounceIn');
            }, 300);
        }
    });
});
</script>
</body>
</html>