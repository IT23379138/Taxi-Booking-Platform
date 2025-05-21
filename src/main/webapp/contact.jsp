<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .contact-card {
            transition: transform 0.3s ease;
            cursor: pointer;
        }
        .contact-card:hover {
            transform: translateY(-5px);
        }
        .contact-icon {
            font-size: 2rem;
            margin-bottom: 1rem;
        }
        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            margin: 2rem 0;
        }
        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #dee2e6;
        }
        .divider span {
            padding: 0 1rem;
            color: #6c757d;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container py-5">
    <h2 class="text-center mb-5">Contact Us</h2>
    
    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <div class="card contact-card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-envelope contact-icon text-primary"></i>
                    <h5 class="card-title">Email Support</h5>
                    <p class="card-text">Get in touch with our support team via email</p>
                    <button class="btn btn-primary" onclick="window.location.href='mailto:support@citycabs.com'">
                        <i class="fas fa-paper-plane me-2"></i>Send Email
                    </button>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card contact-card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-phone contact-icon text-success"></i>
                    <h5 class="card-title">Call Us</h5>
                    <p class="card-text">Speak directly with our customer service</p>
                    <button class="btn btn-success" onclick="window.location.href='tel:+1234567890'">
                        <i class="fas fa-phone me-2"></i>Call Now
                    </button>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card contact-card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-comments contact-icon text-info"></i>
                    <h5 class="card-title">Live Chat</h5>
                    <p class="card-text">Chat with our support team in real-time</p>
                    <button class="btn btn-info text-white" onclick="alert('Live chat is currently offline. Please try email or phone support.')">
                        <i class="fas fa-comments me-2"></i>Start Chat
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="divider">
        <span>OR</span>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title text-center mb-4">Send us a Message</h4>
                    <form id="contactForm" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" class="form-control" id="name" required>
                            <div class="invalid-feedback">Please enter your name.</div>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" required>
                            <div class="invalid-feedback">Please enter a valid email address.</div>
                        </div>
                        <div class="mb-3">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subject" required>
                            <div class="invalid-feedback">Please enter a subject.</div>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <textarea class="form-control" id="message" rows="4" required></textarea>
                            <div class="invalid-feedback">Please enter your message.</div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane me-2"></i>Send Message
                            </button>
                        </div>
                    </form>
                </div>
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
</script>
</body>
</html>