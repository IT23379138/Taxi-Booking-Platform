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
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .fadeIn {
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        .page-header {
            padding: 2rem 0;
            margin-bottom: 2rem;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            color: white;
            border-radius: 0 0 1rem 1rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .feedback-card {
            border-radius: 1rem;
            border: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
            margin-bottom: 1.5rem;
            overflow: hidden;
        }
        .feedback-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            padding: 1rem 1.5rem;
        }
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        .status-pending {
            background-color: rgba(255, 193, 7, 0.2);
            color: #ff9800;
        }
        .status-resolved {
            background-color: rgba(76, 175, 80, 0.2);
            color: #4caf50;
        }
        .status-rejected {
            background-color: rgba(244, 67, 54, 0.2);
            color: #f44336;
        }
        .rating-stars {
            color: #ffc107;
        }
        .feedback-form {
            background-color: #ffffff;
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }
        .no-feedback {
            text-align: center;
            padding: 3rem;
            background-color: white;
            border-radius: 1rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        .btn-action {
            border-radius: 50px;
            padding: 0.5rem 1.5rem;
            font-weight: 500;
            margin-right: 0.5rem;
        }
        .info-label {
            font-size: 0.8rem;
            color: #6c757d;
            margin-bottom: 0.25rem;
            font-weight: 600;
        }
        .info-value {
            margin-bottom: 1rem;
        }
        .card-content {
            padding: 1.5rem;
        }
        .action-row {
            background-color: #f8f9fa;
            padding: 1rem 1.5rem;
            border-top: 1px solid rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body class="fadeIn">
<%@ include file="navbar.jsp" %>

<div class="page-header">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1><i class="fas fa-comments me-2"></i>Feedback List</h1>
            <div class="text-white">
                <span class="fs-5">Total Feedback</span>
                <h2 class="mb-0">${feedbacks != null ? feedbacks.size() : 0}</h2>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <c:if test="${not empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty feedbacks}">
            <div class="row">
                <c:forEach var="feedback" items="${feedbacks}">
                    <div class="col-lg-6 col-xl-4">
                        <div class="feedback-card card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <div>
                                    <h5 class="mb-0">Feedback #${feedback[0]}</h5>
                                    <small class="text-muted">From: ${feedback[1]}</small>
                                </div>
                                <div>
                                    <span class="status-badge ${feedback[9] == 'Pending' ? 'status-pending' : (feedback[9] == 'Resolved' ? 'status-resolved' : 'status-rejected')}">
                                        ${feedback[9]}
                                    </span>
                                </div>
                            </div>
                            <div class="card-content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="info-label">Email</div>
                                        <div class="info-value">${feedback[2]}</div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="info-label">Category</div>
                                        <div class="info-value">${feedback[7]}</div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="info-label">Service Rating</div>
                                        <div class="info-value rating-stars">
                                            <c:forEach begin="1" end="5" var="star">
                                                <i class="fas fa-star ${star <= feedback[4] ? '' : 'text-muted'}"></i>
                                            </c:forEach>
                                            <span class="ms-2">(${feedback[4]}/5)</span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="info-label">Driver</div>
                                        <div class="info-value">${feedback[5]}</div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="info-label">Driver Rating</div>
                                        <div class="info-value rating-stars">
                                            <c:forEach begin="1" end="5" var="star">
                                                <i class="fas fa-star ${star <= feedback[6] ? '' : 'text-muted'}"></i>
                                            </c:forEach>
                                            <span class="ms-2">(${feedback[6]}/5)</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-3">
                                    <div class="info-label">Feedback Message</div>
                                    <div class="info-value">
                                        <div class="p-3 bg-light rounded">${feedback[3]}</div>
                                    </div>
                                </div>

                                <c:if test="${not empty feedback[8]}">
                                    <div class="mt-2">
                                        <div class="info-label">Response</div>
                                        <div class="info-value">
                                            <div class="p-3 bg-light rounded">${feedback[8]}</div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <c:if test="${isAdmin || sessionScope.username == feedback[1]}">
                                <div class="action-row">
                                    <c:if test="${isAdmin}">
                                        <form action="feedback" method="post" class="mb-2">
                                            <input type="hidden" name="action" value="updateResponse">
                                            <input type="hidden" name="feedbackId" value="${feedback[0]}">
                                            <div class="row g-2">
                                                <div class="col-12">
                                                    <input type="text" class="form-control" name="response" placeholder="Response" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <select class="form-select" name="status">
                                                        <option value="Pending">Pending</option>
                                                        <option value="Resolved">Resolved</option>
                                                        <option value="Rejected">Rejected</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <button type="submit" class="btn btn-success w-100">
                                                        <i class="fas fa-check me-1"></i> Update Response
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </c:if>
                                    
                                    <c:if test="${sessionScope.username == feedback[1]}">
                                        <button type="button" class="btn btn-primary w-100 mb-2" onclick="openEditModal('${feedback[0]}', '${feedback[3]}', '${feedback[4]}')">
                                            <i class="fas fa-edit me-1"></i> Edit Feedback
                                        </button>
                                    </c:if>

                                    <form action="feedback" method="post">
                                        <input type="hidden" name="action" value="deleteFeedback">
                                        <input type="hidden" name="feedbackId" value="${feedback[0]}">
                                        <button type="submit" class="btn btn-danger w-100" onclick="return confirm('Are you sure you want to delete this feedback?')">
                                            <i class="fas fa-trash me-1"></i> Delete
                                        </button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-feedback">
                <i class="fas fa-comments fa-4x mb-4 text-muted"></i>
                <h3>No Feedback Available</h3>
                <p class="text-muted">There is no feedback data to display at this time.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<!-- Single Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Feedback</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="feedback" method="post">
                <div class="modal-body">
                    <input type="hidden" name="action" value="editFeedback">
                    <input type="hidden" name="feedbackId" id="editFeedbackId">
                    
                    <div class="mb-3">
                        <label for="editMessage" class="form-label">Feedback Message</label>
                        <textarea class="form-control" id="editMessage" name="message" rows="4" required></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label for="editRating" class="form-label">Rating</label>
                        <select class="form-select" id="editRating" name="rating" required>
                            <option value="1">1 Star</option>
                            <option value="2">2 Stars</option>
                            <option value="3">3 Stars</option>
                            <option value="4">4 Stars</option>
                            <option value="5">5 Stars</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<footer class="py-4 bg-light mt-5">
    <div class="container text-center">
        <p class="mb-0 text-muted">© 2025 CityCabs. All rights reserved.</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Initialize all modals
    document.addEventListener('DOMContentLoaded', function() {
        var modals = document.querySelectorAll('.modal');
        modals.forEach(function(modal) {
            new bootstrap.Modal(modal);
        });
    });

    function openEditModal(feedbackId, message, rating) {
        document.getElementById('editFeedbackId').value = feedbackId;
        document.getElementById('editMessage').value = message;
        document.getElementById('editRating').value = rating;
        
        var modal = new bootstrap.Modal(document.getElementById('editModal'));
        modal.show();
    }
</script>
</body>
</html>