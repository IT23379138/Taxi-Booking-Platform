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
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <h2 class="text-center mb-4">
        <i class="fas fa-comment-dots me-2"></i>Share Your Feedback
    </h2>

    <div class="card glass">
        <div class="card-body">
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <form action="feedback" method="post" id="feedbackForm">
                <input type="hidden" name="action" value="submitFeedback">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="${sessionScope.username}" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.userEmail}" required>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Feedback Message</label>
                    <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="category" class="form-label">Feedback Category</label>
                    <select class="form-select" id="category" name="category" required>
                        <option value="" disabled selected>Select category</option>
                        <option value="Service">Service</option>
                        <option value="Driver">Driver</option>
                        <option value="Vehicle">Vehicle</option>
                        <option value="App">App</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">Overall Rating</label>
                    <div class="star-rating" id="ratingStars">
                        <i class="fas fa-star" data-value="1"></i>
                        <i class="fas fa-star" data-value="2"></i>
                        <i class="fas fa-star" data-value="3"></i>
                        <i class="fas fa-star" data-value="4"></i>
                        <i class="fas fa-star" data-value="5"></i>
                    </div>
                    <input type="hidden" id="rating" name="rating" required>
                </div>
                <div class="mb-3">
                    <label for="driverId" class="form-label">Select Driver</label>
                    <select class="form-select" id="driverId" name="driverId" required>
                        <option value="" disabled selected>Select driver</option>
                        <c:forEach var="driver" items="${drivers}">
                            <option value="${driver.key}">${driver.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="driverRating" class="form-label">Driver Rating</label>
                    <div class="star-rating" id="driverRatingStars">
                        <i class="fas fa-star" data-value="1"></i>
                        <i class="fas fa-star" data-value="2"></i>
                        <i class="fas fa-star" data-value="3"></i>
                        <i class="fas fa-star" data-value="4"></i>
                        <i class="fas fa-star" data-value="5"></i>
                    </div>
                    <input type="hidden" id="driverRating" name="driverRating" required>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane me-1"></i>Submit Feedback
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.querySelectorAll('.star-rating i').forEach(star => {
        star.addEventListener('click', function() {
            const rating = this.dataset.value;
            const parent = this.parentElement;
            const input = parent.nextElementSibling;
            parent.querySelectorAll('i').forEach(s => {
                s.classList.toggle('checked', s.dataset.value <= rating);
            });
            input.value = rating;
        });
    });
</script>
</body>
</html>