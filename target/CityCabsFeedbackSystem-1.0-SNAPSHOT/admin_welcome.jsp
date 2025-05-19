<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Ratings - CityCabs Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <style>
        .driver-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--accent-light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            margin-right: 10px;
        }
        .rating-badge {
            display: inline-flex;
            align-items: center;
            background-color: rgba(255, 215, 0, 0.1);
            color: #ffd700;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-weight: 500;
        }
        .rating-badge i {
            margin-right: 5px;
        }
        .table-hover tbody tr:hover {
            transform: translateX(5px);
            transition: transform 0.3s ease;
        }
    </style>
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">
            <i class="fas fa-star-half-alt me-2"></i>Driver Performance
        </h2>
        <div class="text-muted">
            <i class="fas fa-sort me-1"></i>
            Sorted by Highest Rating
        </div>
    </div>

    <div class="card glass">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                    <tr>
                        <th style="width: 40px;">#</th>
                        <th>Driver</th>
                        <th>Rating</th>
                        <th>Feedback Count</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="entry" items="${driverRatings}" varStatus="loop">
                        <tr>
                            <td class="fw-bold">${loop.index + 1}</td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="driver-avatar">
                                            ${entry.key.split(':')[1].charAt(0)}
                                    </div>
                                    <div>
                                        <div class="fw-semibold">${entry.key.split(':')[1]}</div>
                                        <small class="text-muted">Driver ID: ${entry.key.split(':')[0]}</small>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="rating-badge">
                                    <i class="fas fa-star"></i>
                                    <span>${entry.value} / 5</span>
                                </div>
                            </td>
                            <td>
                                <span class="badge bg-glass rounded-pill">
                                    ${driverFeedbackCounts[entry.key.split(':')[0]]} reviews
                                </span>
                            </td>
                            <td>
                                <a href="feedback?action=driverDetails&driverId=${entry.key.split(':')[0]}" class="btn btn-sm btn-outline-primary">
                                    <i class="fas fa-eye me-1"></i>Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mt-4">
        <div class="text-muted">
            Showing ${driverRatings.size()} drivers
        </div>
        <div>
            <a href="feedback?action=exportDriverRatings" class="btn btn-outline-primary me-2">
                <i class="fas fa-download me-1"></i>Export
            </a>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDriverModal">
                <i class="fas fa-plus me-1"></i>Add Driver
            </button>
        </div>
    </div>
</div>

<!-- Add Driver Modal -->
<div class="modal fade" id="addDriverModal" tabindex="-1" aria-labelledby="addDriverModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content glass">
            <div class="modal-header">
                <h5 class="modal-title" id="addDriverModalLabel">Add New Driver</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="feedback" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="addDriver">
                    <div class="mb-3">
                        <label for="driverId" class="form-label">Driver ID</label>
                        <input type="text" class="form-control" id="driverId" name="driverId" required>
                    </div>
                    <div class="mb-3">
                        <label for="driverName" class="form-label">Driver Name</label>
                        <input type="text" class="form-control" id="driverName" name="driverName" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add Driver</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>