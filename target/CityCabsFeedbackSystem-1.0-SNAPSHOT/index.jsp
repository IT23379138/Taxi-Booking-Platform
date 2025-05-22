<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CityCabs | Taxi Booking & Car Rental</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>
<section class="d-flex align-items-center" style="min-height: 100vh; padding-top: 80px;">
    <div class="container glass">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h1 class="display-4 fw-bold mb-4 animate__animated animate__fadeInLeft">Your Journey, <br><span class="text-glow-animate">Our Priority</span></h1>
                <p class="lead mb-4 animate__animated animate__fadeInLeft delay-100">Book a taxi or rent a car with just a few clicks. Travel with comfort, safety, and affordability.</p>
                <div class="d-flex flex-wrap gap-2 mb-5 animate__animated animate__fadeInLeft delay-200">
                    <a href="feedback?action=form" class="btn btn-primary btn-lg scale"><i class="fas fa-car me-2"></i>Book a Taxi</a>
                    <a href="#" class="btn btn-primary btn-lg scale"><i class="fas fa-car-side me-2"></i>Rent a Car</a>
                </div>
                <div class="row g-4 text-center animate__animated animate__zoomIn delay-300">
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body">
                                <i class="fas fa-shield-alt dashboard-card-icon"></i>
                                <h5 class="dashboard-card-title">Safety First</h5>
                                <p class="small mb-0">Vetted drivers</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body">
                                <i class="fas fa-sack-dollar dashboard-card-icon"></i>
                                <h5 class="dashboard-card-title">Best Rates</h5>
                                <p class="small mb-0">Competitive pricing</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card glass">
                            <div class="card-body">
                                <i class="fas fa-headset dashboard-card-icon"></i>
                                <h5 class="dashboard-card-title">24/7 Support</h5>
                                <p class="small mb-0">Always there for you</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 d-none d-lg-block">
                <div class="card glass shadow-lg animate__animated animate__bounceIn">
                    <div class="card-body">
                        <h2 class="mb-4 text-center"><i class="fas fa-user-circle me-2"></i>Welcome to CityCabs</h2>
                        <% if (request.getAttribute("error") != null) { %>
                        <div class="custom-alert custom-alert-danger fadeIn"><i class="fas fa-exclamation-circle"></i><%= request.getAttribute("error") %></div>
                        <% } %>
                        <ul class="nav nav-tabs mb-4" id="authTabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab">
                                    <i class="fas fa-sign-in-alt me-2"></i>Login
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="signup-tab" data-bs-toggle="tab" data-bs-target="#signup" type="button" role="tab">
                                    <i class="fas fa-user-plus me-2"></i>Sign Up
                                </button>
                            </li>
                        </ul>
                        <div class="tab-content" id="authTabContent">
                            <div class="tab-pane fade show active" id="login" role="tabpanel">
                                <form action="feedback" method="post">
                                    <input type="hidden" name="action" value="login">
                                    <div class="mb-3">
                                        <label for="loginUsername" class="form-label" style="color: var(--text-color);">Username</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-user" style="color: var(--text-color);"></i></span>
                                            <input type="text" class="form-control" id="loginUsername" name="username" placeholder="Enter your username" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="loginPassword" class="form-label" style="color: var(--text-color);">Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-lock" style="color: var(--text-color);"></i></span>
                                            <input type="password" class="form-control" id="loginPassword" name="password" placeholder="Enter your password" required>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="rememberMe" style="color: var(--text-color);">
                                                <label class="form-check-label small" for="rememberMe" style="color: var(--text-color);">Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-6 text-end">
                                            <a href="#" class="small text-decoration-none" style="color: var(--text-color);">Forgot password?</a>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100 scale py-3 animate__animated animate__pulse" style="color: white;">
                                        <i class="fas fa-sign-in-alt me-2"></i>Login
                                    </button>
                                    <div class="divider mt-4">or continue with</div>
                                    <div class="d-flex">
                                        <a href="#" class="contact-btn scale w-50 me-1" style="color: var(--text-color);"><i class="fab fa-google"></i> Google</a>
                                        <a href="#" class="contact-btn scale w-50 ms-1" style="color: var(--text-color);"><i class="fab fa-facebook-f"></i> Facebook</a>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="signup" role="tabpanel">
                                <form action="feedback" method="post">
                                    <input type="hidden" name="action" value="signup">
                                    <div class="mb-3">
                                        <label for="signupUsername" class="form-label" style="color: var(--text-color);">Username</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-user" style="color: var(--text-color);"></i></span>
                                            <input type="text" class="form-control" id="signupUsername" name="username" placeholder="Choose a username" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="signupEmail" class="form-label" style="color: var(--text-color);">Email</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-envelope" style="color: var(--text-color);"></i></span>
                                            <input type="email" class="form-control" id="signupEmail" name="email" placeholder="Enter your email" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="signupPassword" class="form-label" style="color: var(--text-color);">Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-lock" style="color: var(--text-color);"></i></span>
                                            <input type="password" class="form-control" id="signupPassword" name="password" placeholder="Create a strong password" required>
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <label for="confirmPassword" class="form-label" style="color: var(--text-color);">Confirm Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-lock" style="color: var(--text-color);"></i></span>
                                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                                        </div>
                                    </div>
                                    <div class="form-check mb-4">
                                        <input class="form-check-input" type="checkbox" id="termsCheck" required>
                                        <label class="form-check-label small" for="termsCheck" style="color: var(--text-color);">
                                            I agree to the <a href="#" class="text-decoration-none" style="color: var(--accent);">Terms of Service</a> and <a href="#" class="text-decoration-none" style="color: var(--accent);">Privacy Policy</a>
                                        </label>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100 scale py-3 animate__animated animate__pulse" style="color: white;">
                                        <i class="fas fa-user-plus me-2"></i>Create Account
                                    </button>
                                    <div class="divider mt-4">or sign up with</div>
                                    <div class="d-flex">
                                        <a href="#" class="contact-btn scale w-50 me-1" style="color: var(--text-color);"><i class="fab fa-google"></i> Google</a>
                                        <a href="#" class="contact-btn scale w-50 ms-1" style="color: var(--text-color);"><i class="fab fa-facebook-f"></i> Facebook</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal fade" id="authModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content glass">
            <div class="modal-body p-0">
                <button type="button" class="btn-close position-absolute top-0 end-0 m-3" data-bs-dismiss="modal" aria-label="Close"></button>
                <div class="card glass border-0">
                    <div class="card-body">
                        <h2 class="mb-4 text-center"><i class="fas fa-user-circle me-2"></i>Welcome to CityCabs</h2>
                        <ul class="nav nav-tabs mb-4" id="mobileAuthTabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="mobile-login-tab" data-bs-toggle="tab" data-bs-target="#mobileLogin" type="button" role="tab">
                                    <i class="fas fa-sign-in-alt me-2"></i>Login
                                </button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="mobile-signup-tab" data-bs-toggle="tab" data-bs-target="#mobileSignup" type="button" role="tab">
                                    <i class="fas fa-user-plus me-2"></i>Sign Up
                                </button>
                            </li>
                        </ul>
                        <div class="tab-content" id="mobileAuthTabContent">
                            <div class="tab-pane fade show active" id="mobileLogin" role="tabpanel">
                                <form action="feedback" method="post">
                                    <input type="hidden" name="action" value="login">
                                    <div class="mb-3">
                                        <label for="mobileLoginUsername" class="form-label" style="color: var(--text-color);">Username</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-user" style="color: var(--text-color);"></i></span>
                                            <input type="text" class="form-control" id="mobileLoginUsername" name="username" placeholder="Enter your username" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="mobileLoginPassword" class="form-label" style="color: var(--text-color);">Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-lock" style="color: var(--text-color);"></i></span>
                                            <input type="password" class="form-control" id="mobileLoginPassword" name="password" placeholder="Enter your password" required>
                                        </div>
                                    </div>
                                    <div class="row mb-4">
                                        <div class="col-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="mobileRememberMe" style="color: var(--text-color);">
                                                <label class="form-check-label small" for="mobileRememberMe" style="color: var(--text-color);">Remember me</label>
                                            </div>
                                        </div>
                                        <div class="col-6 text-end">
                                            <a href="#" class="small text-decoration-none" style="color: var(--text-color);">Forgot password?</a>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100 scale py-3 animate__animated animate__pulse" style="color: white;">
                                        <i class="fas fa-sign-in-alt me-2"></i>Login
                                    </button>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="mobileSignup" role="tabpanel">
                                <form action="feedback" method="post">
                                    <input type="hidden" name="action" value="signup">
                                    <div class="mb-3">
                                        <label for="mobileSignupUsername" class="form-label" style="color: var(--text-color);">Username</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-user" style="color: var(--text-color);"></i></span>
                                            <input type="text" class="form-control" id="mobileSignupUsername" name="username" placeholder="Choose a username" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="mobileSignupEmail" class="form-label" style="color: var(--text-color);">Email</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-envelope" style="color: var(--text-color);"></i></span>
                                            <input type="email" class="form-control" id="mobileSignupEmail" name="email" placeholder="Enter your email" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="mobileSignupPassword" class="form-label" style="color: var(--text-color);">Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text glass"><i class="fas fa-lock" style="color: var(--text-color);"></i></span>
                                            <input type="password" class="form-control" id="mobileSignupPassword" name="password" placeholder="Create a strong password" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100 scale py-3 animate__animated animate__pulse" style="color: white;">
                                        <i class="fas fa-user-plus me-2"></i>Create Account
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>