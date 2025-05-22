<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            border-radius: 16px;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        .contact-card:hover {
            transform: translateY(-5px);
        }
        .contact-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--accent);
        }
        .contact-method {
            padding: 2rem;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .contact-divider {
            display: flex;
            align-items: center;
            margin: 2rem 0;
            color: var(--text-light);
        }
        .contact-divider::before,
        .contact-divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid var(--glass-border);
        }
        .contact-divider::before {
            margin-right: 1rem;
        }
        .contact-divider::after {
            margin-left: 1rem;
        }
    </style>
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="text-center mb-5">
        <h2 class="mb-3">
            <i class="fas fa-headset me-2"></i>We're Here to Help
        </h2>
        <p class="lead text-muted">
            Have questions or need assistance? Reach out to our support team.
        </p>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-4">
            <div class="card glass contact-card h-100">
                <div class="contact-method">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h5 class="mb-3">Email Support</h5>
                    <p class="text-muted mb-4">
                        Send us an email and we'll get back to you within 24 hours.
                    </p>
                    <button class="btn btn-primary" onclick="sendEmail()">
                        <i class="fas fa-paper-plane me-2"></i>Email Us
                    </button>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card glass contact-card h-100">
                <div class="contact-method">
                    <div class="contact-icon">
                        <i class="fas fa-phone-alt"></i>
                    </div>
                    <h5 class="mb-3">Call Us</h5>
                    <p class="text-muted mb-4">
                        Speak directly with our support team during business hours.
                    </p>
                    <button class="btn btn-primary" onclick="callPhone()">
                        <i class="fas fa-phone me-2"></i>+1-800-555-1234
                    </button>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card glass contact-card h-100">
                <div class="contact-method">
                    <div class="contact-icon">
                        <i class="fas fa-comment-dots"></i>
                    </div>
                    <h5 class="mb-3">Live Chat</h5>
                    <p class="text-muted mb-4">
                        Chat with us in real-time for immediate assistance.
                    </p>
                    <button class="btn btn-primary" onclick="startChat()">
                        <i class="fas fa-comment me-2"></i>Start Chat
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="contact-divider">
        <span>OR</span>
    </div>

    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card glass">
                <div class="card-body p-4">
                    <h5 class="mb-4 text-center">
                        <i class="fas fa-paper-plane me-2"></i>Send Us a Message
                    </h5>
                    <form>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="name" class="form-label">Your Name</label>
                                <input type="text" class="form-control" id="name" required>
                            </div>
                            <div class="col-md-6">
                                <label for="email" class="form-label">Email Address</label>
                                <input type="email" class="form-control" id="email" required>
                            </div>
                            <div class="col-12">
                                <label for="subject" class="form-label">Subject</label>
                                <input type="text" class="form-control" id="subject" required>
                            </div>
                            <div class="col-12">
                                <label for="message" class="form-label">Message</label>
                                <textarea class="form-control" id="message" rows="4" required></textarea>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-paper-plane me-2"></i>Send Message
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function sendEmail() {
        window.location.href = 'mailto:support@citycabs.com?subject=CityCabs Support Request';
    }

    function callPhone() {
        const phoneNumber = '+18005551234';
        if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
            window.location.href = `tel:${phoneNumber}`;
        } else {
            navigator.clipboard.writeText(phoneNumber).then(() => {
                alert('Phone number copied to clipboard: ' + phoneNumber);
            });
        }
    }

    function startChat() {
        alert('Our live chat service is currently offline. Please email or call us for assistance.');
    }
</script>
</body>
</html>