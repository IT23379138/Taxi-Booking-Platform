<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --success-color: #2ecc71;
            --info-color: #3498db;
            --warning-color: #f39c12;
            --danger-color: #e74c3c;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --gray-color: #6c757d;
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding-bottom: 40px;
        }

        .dashboard-header {
            padding: 30px 0;
            position: relative;
            overflow: hidden;
        }

        .dashboard-title {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 0;
            position: relative;
            z-index: 2;
        }

        .dashboard-subtitle {
            color: var(--gray-color);
            font-weight: 400;
            margin-bottom: 0;
            position: relative;
            z-index: 2;
        }

        .dashboard-header::before {
            content: "";
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 200%;
            background: radial-gradient(circle, rgba(67, 97, 238, 0.1) 0%, rgba(255, 255, 255, 0) 70%);
            z-index: 1;
        }

        .stat-card {
            border-radius: 16px;
            transition: var(--transition);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: none;
            position: relative;
            overflow: hidden;
            height: 100%;
        }

        .stat-card::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.2) 0%, rgba(255, 255, 255, 0) 100%);
            z-index: 1;
        }

        .stat-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .stat-card .card-body {
            position: relative;
            z-index: 2;
            padding: 25px;
        }

        .stat-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            display: inline-block;
            padding: 15px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .stat-value {
            font-size: 2.8rem;
            font-weight: 700;
            line-height: 1;
            margin-bottom: 10px;
            background: linear-gradient(45deg, #ffffff, #e6e6e6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .stat-label {
            font-size: 1.2rem;
            font-weight: 500;
            opacity: 0.9;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .content-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            transition: var(--transition);
            height: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
        }

        .content-card:hover {
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            transform: translateY(-5px);
        }

        .card-header {
            background-color: transparent;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding: 20px 25px;
        }

        .card-header h5 {
            font-weight: 600;
            margin: 0;
            color: var(--dark-color);
        }

        .card-body {
            padding: 25px;
        }

        .progress {
            height: 10px;
            border-radius: 5px;
            background-color: rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .progress-bar {
            transition: width 1.5s ease-in-out;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            border-radius: 5px;
        }

        .category-item {
            margin-bottom: 20px;
            opacity: 0;
            transform: translateX(-20px);
            transition: all 0.5s ease;
        }

        .driver-item {
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 15px;
            transition: var(--transition);
            opacity: 0;
            transform: translateY(20px);
            background-color: rgba(255, 255, 255, 0.7);
        }

        .driver-item:hover {
            background-color: rgba(255, 255, 255, 1);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .driver-name {
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 5px;
            color: var(--dark-color);
        }

        .driver-rating {
            font-size: 0.9rem;
            color: var(--gray-color);
        }

        .star-rating {
            color: var(--warning-color);
            font-size: 1.1rem;
        }

        .star-rating .fa-star {
            transition: transform 0.3s ease;
        }

        .star-rating:hover .fa-star {
            transform: scale(1.2);
        }

        .card-icon {
            font-size: 1.8rem;
            margin-right: 15px;
            color: var(--primary-color);
        }

        .category-name {
            font-weight: 500;
            color: var(--dark-color);
        }

        .category-percent {
            font-weight: 600;
            color: var(--primary-color);
        }

        .visible {
            opacity: 1;
            transform: translate(0);
        }

        .counter {
            display: inline-block;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        .chart-container {
            position: relative;
            height: 200px;
            width: 100%;
        }

        /* Background designs */
        .shape {
            position: absolute;
            opacity: 0.1;
            z-index: 0;
        }

        .shape-1 {
            top: 10%;
            left: 5%;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: linear-gradient(45deg, var(--primary-color), var(--info-color));
            animation: float 8s ease-in-out infinite;
        }

        .shape-2 {
            bottom: 10%;
            right: 5%;
            width: 200px;
            height: 200px;
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            background: linear-gradient(45deg, var(--success-color), var(--info-color));
            animation: float 10s ease-in-out infinite;
            animation-delay: 1s;
        }

        @keyframes float {
            0% { transform: translate(0, 0) rotate(0deg); }
            50% { transform: translate(20px, 20px) rotate(10deg); }
            100% { transform: translate(0, 0) rotate(0deg); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .stat-value {
                font-size: 2rem;
            }

            .stat-icon {
                font-size: 2rem;
                padding: 10px;
            }

            .stat-label {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="shape shape-1"></div>
<div class="shape shape-2"></div>

<div class="container">
    <div class="dashboard-header animate__animated animate__fadeIn">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h2 class="dashboard-title">
                    <i class="fas fa-tachometer-alt me-2"></i>Dashboard Overview
                </h2>
                <p class="dashboard-subtitle">Monitor your business performance and feedback metrics</p>
            </div>
            <div class="col-md-4 text-md-end">
                <div class="btn-group">
                    <button type="button" class="btn btn-outline-primary">
                        <i class="fas fa-download me-1"></i>Export
                    </button>
                    <button type="button" class="btn btn-primary">
                        <i class="fas fa-sync-alt me-1"></i>Refresh
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mb-4">
        <div class="col-md-4 animate__animated animate__fadeInUp" style="animation-delay: 0.1s;">
            <div class="stat-card bg-primary text-white h-100">
                <div class="card-body text-center">
                    <span class="stat-icon">
                        <i class="fas fa-comments"></i>
                    </span>
                    <div class="stat-value counter">${feedbacks != null ? feedbacks.size() : 0}</div>
                    <div class="stat-label">Total Feedbacks</div>
                </div>
            </div>
        </div>

        <div class="col-md-4 animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
            <div class="stat-card bg-success text-white h-100">
                <div class="card-body text-center">
                    <span class="stat-icon">
                        <i class="fas fa-star"></i>
                    </span>
                    <div class="stat-value counter">${averageRating != null ? String.format("%.1f", averageRating) : "0.0"}</div>
                    <div class="stat-label">Average Rating</div>
                </div>
            </div>
        </div>

        <div class="col-md-4 animate__animated animate__fadeInUp" style="animation-delay: 0.3s;">
            <div class="stat-card bg-info text-white h-100">
                <div class="card-body text-center">
                    <span class="stat-icon">
                        <i class="fas fa-users"></i>
                    </span>
                    <div class="stat-value counter">${driverRatings != null ? driverRatings.size() : 0}</div>
                    <div class="stat-label">Total Drivers</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-lg-6 animate__animated animate__fadeInLeft" style="animation-delay: 0.4s;">
            <div class="content-card h-100">
                <div class="card-header d-flex align-items-center">
                    <i class="fas fa-chart-pie card-icon"></i>
                    <h5>Category Distribution</h5>
                </div>
                <div class="card-body">
                    <c:forEach var="entry" items="${categoryDistribution}" varStatus="status">
                        <div class="category-item" style="animation-delay: ${0.2 * status.index}s">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="category-name">${entry.key}</span>
                                <span class="category-percent">${entry.value}%</span>
                            </div>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar"
                                     aria-valuenow="${entry.value}" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-lg-6 animate__animated animate__fadeInRight" style="animation-delay: 0.5s;">
            <div class="content-card h-100">
                <div class="card-header d-flex align-items-center">
                    <i class="fas fa-medal card-icon"></i>
                    <h5>Top Rated Drivers</h5>
                </div>
                <div class="card-body">
                    <c:forEach var="entry" items="${driverRatings}" varStatus="status">
                        <c:if test="${status.index < 5}">
                            <div class="driver-item" style="animation-delay: ${0.2 * status.index}s">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="driver-name">
                                            <i class="fas fa-user-tie me-2"></i>${entry.key}
                                        </div>
                                        <div class="driver-rating">
                                            <span class="badge bg-light text-dark me-2">Rating: ${entry.value}</span>
                                            <c:if test="${entry.value >= 4.5}">
                                                <span class="badge bg-success">Excellent</span>
                                            </c:if>
                                            <c:if test="${entry.value < 4.5 && entry.value >= 4.0}">
                                                <span class="badge bg-primary">Great</span>
                                            </c:if>
                                            <c:if test="${entry.value < 4.0 && entry.value >= 3.5}">
                                                <span class="badge bg-info">Good</span>
                                            </c:if>
                                            <c:if test="${entry.value < 3.5}">
                                                <span class="badge bg-warning">Average</span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="star-rating">
                                        <c:forEach begin="1" end="5" var="star">
                                            <i class="fas fa-star ${star <= entry.value ? '' : 'text-muted'}"></i>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mt-4">
        <div class="col-12 animate__animated animate__fadeIn" style="animation-delay: 0.6s;">
            <div class="content-card">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-info-circle card-icon"></i>
                        <h5>System Information</h5>
                    </div>
                    <span class="badge bg-success">Online</span>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 mb-3 mb-md-0">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-server me-3 text-primary" style="font-size: 2rem;"></i>
                                <div>
                                    <h6 class="mb-0">Server Status</h6>
                                    <p class="mb-0 text-success">Operational</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3 mb-md-0">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-database me-3 text-info" style="font-size: 2rem;"></i>
                                <div>
                                    <h6 class="mb-0">Database</h6>
                                    <p class="mb-0 text-success">Connected</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 mb-3 mb-md-0">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-clock me-3 text-warning" style="font-size: 2rem;"></i>
                                <div>
                                    <h6 class="mb-0">Last Update</h6>
                                    <p class="mb-0">Just now</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-user-shield me-3 text-danger" style="font-size: 2rem;"></i>
                                <div>
                                    <h6 class="mb-0">Security</h6>
                                    <p class="mb-0 text-success">Protected</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/countup.js/2.0.8/countUp.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize animations for category items
        const categoryItems = document.querySelectorAll('.category-item');
        const driverItems = document.querySelectorAll('.driver-item');
        const progressBars = document.querySelectorAll('.progress-bar');

        // Set up progress bars with initial width 0
        progressBars.forEach(bar => {
            const width = bar.getAttribute('aria-valuenow') + '%';
            bar.style.width = '0%';
            // Using setTimeout to ensure the transition works
            setTimeout(() => {
                bar.style.width = width;
            }, 300);
        });

        // Animate elements when they're in viewport
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.2 });

        categoryItems.forEach(item => observer.observe(item));
        driverItems.forEach(item => observer.observe(item));

        // Counter animation for stat values
        const counterElements = document.querySelectorAll('.counter');
        counterElements.forEach(counter => {
            const value = parseFloat(counter.innerText);
            const isDecimal = counter.innerText.includes('.');

            const options = {
                startVal: 0,
                decimalPlaces: isDecimal ? 1 : 0,
                duration: 2.5,
                useEasing: true
            };

            const countUp = new CountUp(counter, value, options);
            if (!countUp.error) {
                countUp.start();
            }
        });

        // Add hover effects to cards
        const cards = document.querySelectorAll('.stat-card, .content-card');
        cards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-10px)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = '';
            });
        });

        // Pulse animation for stat icons
        const statIcons = document.querySelectorAll('.stat-icon');
        statIcons.forEach(icon => {
            icon.classList.add('pulse');
        });

        // Set up star rating hover animations
        const starRatings = document.querySelectorAll('.star-rating');
        starRatings.forEach(rating => {
            const stars = rating.querySelectorAll('.fa-star');

            stars.forEach((star, index) => {
                star.addEventListener('mouseenter', () => {
                    for (let i = 0; i <= index; i++) {
                        stars[i].classList.add('animate__animated', 'animate__heartBeat');
                    }
                });

                star.addEventListener('mouseleave', () => {
                    stars.forEach(s => {
                        s.classList.remove('animate__animated', 'animate__heartBeat');
                    });
                });
            });
        });

        // Refresh button functionality
        document.querySelector('.btn-primary').addEventListener('click', function() {
            const icon = this.querySelector('i');
            icon.classList.add('fa-spin');

            // Simulate refresh
            setTimeout(() => {
                // Reset animations
                categoryItems.forEach(item => {
                    item.classList.remove('visible');
                    setTimeout(() => {
                        item.classList.add('visible');
                    }, 300);
                });

                driverItems.forEach(item => {
                    item.classList.remove('visible');
                    setTimeout(() => {
                        item.classList.add('visible');
                    }, 300);
                });

                // Reset progress bars
                progressBars.forEach(bar => {
                    const width = bar.getAttribute('aria-valuenow') + '%';
                    bar.style.width = '0%';
                    setTimeout(() => {
                        bar.style.width = width;
                    }, 300);
                });

                // Reset counters
                counterElements.forEach(counter => {
                    const value = parseFloat(counter.innerText);
                    const isDecimal = counter.innerText.includes('.');

                    const options = {
                        startVal: 0,
                        decimalPlaces: isDecimal ? 1 : 0,
                        duration: 2.5,
                        useEasing: true
                    };

                    const countUp = new CountUp(counter, value, options);
                    if (!countUp.error) {
                        countUp.start();
                    }
                });

                icon.classList.remove('fa-spin');
            }, 1000);
        });
    });
</script>
</body>
</html>