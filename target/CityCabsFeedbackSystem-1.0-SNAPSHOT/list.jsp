<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback List - CityCabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="container">
    <h2 class="text-center mb-4">
        <i class="fas fa-list me-2"></i>Feedback List
    </h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="card glass">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Rating</th>
                        <th>Driver</th>
                        <th>Driver Rating</th>
                        <th>Category</th>
                        <th>Response</th>
                        <th>Status</th>
                        <c:if test="${isAdmin}">
                            <th>Actions</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty feedbacks and not empty feedbacks}">
                            <c:forEach var="feedback" items="${feedbacks}">
                                <tr>
                                    <td>${feedback[0]}</td>
                                    <td>${feedback[1]}</td>
                                    <td>${feedback[2]}</td>
                                    <td>${feedback[3]}</td>
                                    <td>${feedback[4]}</td>
                                    <td>${feedback[5]}</td>
                                    <td>${feedback[6]}</td>
                                    <td>${feedback[7]}</td>
                                    <td>${feedback[8]}</td>
                                    <td>${feedback[9]}</td>
                                    <c:if test="${isAdmin}">
                                        <td>
                                            <form action="feedback" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="updateResponse">
                                                <input type="hidden" name="feedbackId" value="${feedback[0]}">
                                                <div class="input-group mb-2">
                                                    <input type="text" class="form-control" name="response" placeholder="Response" required>
                                                    <select class="form-select" name="status">
                                                        <option value="Pending">Pending</option>
                                                        <option value="Resolved">Resolved</option>
                                                    </select>
                                                    <button type="submit" class="btn btn-outline-success">Update</button>
                                                </div>
                                            </form>
                                            <form action="feedback" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="deleteFeedback">
                                                <input type="hidden" name="feedbackId" value="${feedback[0]}">
                                                <button type="submit" class="btn btn-outline-danger" onclick="return confirm('Are you sure?')">Delete</button>
                                            </form>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="10" class="text-center">No feedback available.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="text-muted mt-4">
        Showing ${feedbacks != null ? feedbacks.size() : 0} feedback entries
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>