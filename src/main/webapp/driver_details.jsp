<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Feedback Details - CityCabs Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">
            <i class="fas fa-user me-2"></i>Feedback for ${driverName} (ID: ${driverId})
        </h2>
        <a href="feedback?action=adminDriverRatings" class="btn btn-outline-primary">
            <i class="fas fa-arrow-left me-1"></i>Back to Driver Ratings
        </a>
    </div>

    <div class="card glass">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                    <tr>
                        <th style="width: 40px;">#</th>
                        <th>Submitter</th>
                        <th>Rating</th>
                        <th>Driver Rating</th>
                        <th>Category</th>
                        <th>Message</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="feedback" items="${driverFeedbacks}" varStatus="loop">
                        <tr>
                            <td class="fw-bold">${loop.index + 1}</td>
                            <td>
                                <div class="fw-semibold">${feedback[1]}</div>
                                <small class="text-muted">${feedback[2]}</small>
                            </td>
                            <td>
                                <div class="rating-badge">
                                    <i class="fas fa-star"></i>
                                    <span>${feedback[4]} / 5</span>
                                </div>
                            </td>
                            <td>
                                <div class="rating-badge">
                                    <i class="fas fa-star"></i>
                                    <span>${feedback[6]} / 5</span>
                                </div>
                            </td>
                            <td>${feedback[7]}</td>
                            <td>${feedback[3]}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="text-muted mt-4">
        Showing ${driverFeedbacks.size()} feedback entries
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>