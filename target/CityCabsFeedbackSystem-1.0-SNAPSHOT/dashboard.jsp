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
    <link href="css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-5">
        <h2 class="mb-0">
            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
        </h2>
        <div class="text-muted">
            <i class="fas fa-calendar-alt me-1"></i>
            <span id="currentDate"></span>
        </div>
    </div>

    <div class="row g-4 mb-5">
        <!-- Stats Cards -->
        <div class="col-md-4">
            <div class="dashboard-card glass">
                <div class="card-body text-center">
                    <div class="dashboard-card-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h5 class="dashboard-card-title">Average Rating</h5>
                    <div class="d-flex align-items-center justify-content-center">
                        <p class="dashboard-card-value mb-0"><c:out value="${averageRating}"/></p>
                        <span class="text-muted ms-1">/ 5</span>
                    </div>
                    <div class="mt-2">
                        <span class="badge bg-success">
                            <i class="fas fa-arrow-up me-1"></i>
                            <c:out value="${ratingChange}"/>% from last month
                        </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="dashboard-card glass">
                <div class="card-body text-center">
                    <div class="dashboard-card-icon">
                        <i class="fas fa-comments"></i>
                    </div>
                    <h5 class="dashboard-card-title">Total Feedback</h5>
                    <p class="dashboard-card-value"><c:out value="${totalFeedback}"/></p>
                    <div class="progress mt-2" style="height: 6px;">
                        <div class="progress-bar bg-accent" style="width: ${feedbackProgress}%"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="dashboard-card glass">
                <div class="card-body text-center">
                    <div class="dashboard-card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h5 class="dashboard-card-title">Active Drivers</h5>
                    <p class="dashboard-card-value"><c:out value="${activeDrivers}"/></p>
                    <div class="mt-2">
                        <span class="badge bg-primary">
                            <i class="fas fa-user-plus me-1"></i>
                            <c:out value="${newDrivers}"/> new this month
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts Row -->
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="card glass h-100">
                <div class="card-body">
                    <h5 class="card-title d-flex justify-content-between align-items-center">
                        <span><i class="fas fa-chart-pie me-2"></i>Feedback Categories</span>
                        <small class="text-muted">Last 30 days</small>
                    </h5>
                    <div class="chart-container mt-3">
                        <canvas id="categoryChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card glass h-100">
                <div class="card-body">
                    <h5 class="card-title d-flex justify-content-between align-items-center">
                        <span><i class="fas fa-star-half-alt me-2"></i>Driver Ratings</span>
                        <small class="text-muted">Top Performers</small>
                    </h5>
                    <div class="chart-container mt-3">
                        <canvas id="driverRatingsChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Set current date
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-US', options);

    // Category Chart (Doughnut)
    const categoryCtx = document.getElementById('categoryChart').getContext('2d');
    const categoryChart = new Chart(categoryCtx, {
        type: 'doughnut',
        data: {
            labels: [<c:forEach var="entry" items="${categoryDistribution}" varStatus="loop">'${entry.key}'<c:if test="${!loop.last}">,</c:if></c:forEach>],
            datasets: [{
                data: [<c:forEach var="entry" items="${categoryDistribution}" varStatus="loop">${entry.value}<c:if test="${!loop.last}">,</c:if></c:forEach>],
                backgroundColor: [
                    'rgba(102, 126, 234, 0.8)',
                    'rgba(118, 75, 162, 0.8)',
                    'rgba(237, 137, 54, 0.8)',
                    'rgba(72, 187, 120, 0.8)',
                    'rgba(245, 101, 101, 0.8)'
                ],
                borderColor: 'rgba(255, 255, 255, 0.2)',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'right',
                    labels: {
                        color: 'var(--text-color)'
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    titleFont: { size: 14 },
                    bodyFont: { size: 12 }
                }
            },
            cutout: '65%'
        }
    });

    // Driver Ratings Chart (Horizontal Bar)
    const driverCtx = document.getElementById('driverRatingsChart').getContext('2d');
    const driverChart = new Chart(driverCtx, {
        type: 'bar',
        data: {
            labels: [<c:forEach var="entry" items="${driverRatings}" varStatus="loop">'${entry.key.split(":")[1]}'<c:if test="${!loop.last}">,</c:if></c:forEach>],
            datasets: [{
                label: 'Average Rating',
                data: [<c:forEach var="entry" items="${driverRatings}" varStatus="loop">${entry.value}<c:if test="${!loop.last}">,</c:if></c:forEach>],
                backgroundColor: 'rgba(102, 126, 234, 0.6)',
                borderColor: 'rgba(102, 126, 234, 1)',
                borderWidth: 1,
                borderRadius: 6
            }]
        },
        options: {
            indexAxis: 'y',
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                x: {
                    beginAtZero: true,
                    max: 5,
                    grid: {
                        color: 'rgba(255, 255, 255, 0.1)'
                    },
                    ticks: {
                        color: 'var(--text-light)'
                    }
                },
                y: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        color: 'var(--text-color)'
                    }
                }
            },
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    titleFont: { size: 14 },
                    bodyFont: { size: 12 }
                }
            }
        }
    });
</script>
</body>
</html>