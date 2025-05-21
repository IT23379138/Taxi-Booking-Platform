package org.pg113.citycabsfeedbacksystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    private FeedbackService feedbackService;
    private UserAndDriver userAndDriver;
    private static final Logger LOGGER = Logger.getLogger(FeedbackServlet.class.getName());

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
        userAndDriver = UserAndDriver.getInstance();
        FeedbackService.FeedbackServletContextHolder.setServletContext(getServletContext());
        LOGGER.info("FeedbackServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        
        if (action == null) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            return;
        }

        switch (action) {
            case "dashboard":
                if (session != null && session.getAttribute("username") != null) {
                    List<String[]> feedbacks = feedbackService.getAllFeedbacks();
                    request.setAttribute("feedbacks", feedbacks);
                    request.setAttribute("averageRating", feedbackService.calculateAverageRating());
                    request.setAttribute("categoryDistribution", feedbackService.getCategoryDistribution());
                    request.setAttribute("driverRatings", feedbackService.calculateDriverRatings());
                    request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "list":
                if (session != null && session.getAttribute("username") != null) {
                    request.setAttribute("feedbacks", feedbackService.getAllFeedbacks());
                    request.setAttribute("drivers", userAndDriver.getAllDrivers());
                    request.setAttribute("isAdmin", "admin".equals(session.getAttribute("userRole")));
                    request.getRequestDispatcher("/list.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "adminDriverRatings":
                if (session != null && "admin".equals(session.getAttribute("userRole"))) {
                    request.setAttribute("driverRatings", feedbackService.calculateDriverRatings());
                    request.setAttribute("driverFeedbackCounts", feedbackService.getAllFeedbacks().stream()
                            .collect(java.util.stream.Collectors.groupingBy(f -> f[5], java.util.stream.Collectors.counting())));
                    request.getRequestDispatcher("/admin_welcome.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "driverDetails":
                if (session != null && "admin".equals(session.getAttribute("userRole"))) {
                    String driverId = request.getParameter("driverId");
                    request.setAttribute("driverFeedbacks", feedbackService.getAllFeedbacks().stream()
                            .filter(f -> f[5].equals(driverId))
                            .collect(java.util.stream.Collectors.toList()));
                    request.setAttribute("driverId", driverId);
                    request.setAttribute("driverName", userAndDriver.getAllDrivers().getOrDefault(driverId, "Unknown"));
                    request.getRequestDispatcher("/driver_details.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "exportDriverRatings":
                if (session != null && "admin".equals(session.getAttribute("userRole"))) {
                    response.setContentType("text/csv");
                    response.setHeader("Content-Disposition", "attachment; filename=driver_ratings.csv");
                    try (PrintWriter writer = response.getWriter()) {
                        writer.write("Driver ID,Driver Name,Average Rating,Feedback Count\n");
                        Map<String, Double> ratings = feedbackService.calculateDriverRatings();
                        Map<String, Long> counts = feedbackService.getAllFeedbacks().stream()
                                .collect(java.util.stream.Collectors.groupingBy(f -> f[5], java.util.stream.Collectors.counting()));
                        for (Map.Entry<String, Double> entry : ratings.entrySet()) {
                            String[] parts = entry.getKey().split(":");
                            String driverId = parts[0];
                            String driverName = parts[1];
                            writer.write(String.format("%s,%s,%.2f,%d\n", driverId, driverName, entry.getValue(), counts.getOrDefault(driverId, 0L)));
                        }
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "form":
                if (session != null && session.getAttribute("username") != null) {
                    request.setAttribute("drivers", userAndDriver.getAllDrivers());
                    if (session.getAttribute("userEmail") == null) {
                        session.setAttribute("userEmail", feedbackService.getUserEmail((String)session.getAttribute("username")));
                    }
                    request.getRequestDispatcher("/form.jsp").forward(request, response);
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "deleteFeedback":
                if (session != null && session.getAttribute("username") != null) {
                    String feedbackId = request.getParameter("feedbackId");
                    feedbackService.deleteFeedback(feedbackId);
                    response.sendRedirect("feedback?action=list");
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "editFeedback":
                if (session != null && session.getAttribute("username") != null) {
                    String feedbackId = request.getParameter("feedbackId");
                    String message = sanitizeInput(request.getParameter("message"));
                    String editRatingStr = request.getParameter("rating");
                    
                    try {
                        int rating = Integer.parseInt(editRatingStr);
                        if (rating < 1 || rating > 5) {
                            request.setAttribute("error", "Rating must be between 1 and 5");
                            response.sendRedirect("feedback?action=list");
                            return;
                        }
                        feedbackService.updateFeedback(feedbackId, message, rating);
                        response.sendRedirect("feedback?action=list");
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Invalid rating format");
                        response.sendRedirect("feedback?action=list");
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            default:
                request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
        
        if (action == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (action) {
            case "submitFeedback":
                String name = sanitizeInput(request.getParameter("name"));
                String email = sanitizeInput(request.getParameter("email"));
                String feedbackMessage = sanitizeInput(request.getParameter("message"));
                String ratingStr = request.getParameter("rating");
                String driverId = sanitizeInput(request.getParameter("driverId"));
                String driverRatingStr = request.getParameter("driverRating");
                String category = sanitizeInput(request.getParameter("category"));

                try {
                    int rating = ratingStr != null ? Integer.parseInt(ratingStr) : 0;
                    int driverRating = driverRatingStr != null ? Integer.parseInt(driverRatingStr) : 0;
                    if (rating < 1 || rating > 5 || driverRating < 1 || driverRating > 5) {
                        request.setAttribute("error", "Ratings must be between 1 and 5");
                        request.setAttribute("drivers", userAndDriver.getAllDrivers());
                        request.getRequestDispatcher("/form.jsp").forward(request, response);
                        return;
                    }
                    feedbackService.addFeedback(name, email, feedbackMessage, rating, driverId, driverRating, category);
                    request.getRequestDispatcher("/confirmation.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid rating format");
                    request.setAttribute("drivers", userAndDriver.getAllDrivers());
                    request.getRequestDispatcher("/form.jsp").forward(request, response);
                }
                break;
            case "updateResponse":
                if (session != null && "admin".equals(session.getAttribute("userRole"))) {
                    String feedbackId = request.getParameter("feedbackId");
                    String feedbackResponse = sanitizeInput(request.getParameter("response"));
                    String status = sanitizeInput(request.getParameter("status"));
                    feedbackService.updateFeedbackResponse(feedbackId, feedbackResponse, status);
                    response.sendRedirect("feedback?action=list");
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "deleteFeedback":
                if (session != null && session.getAttribute("username") != null) {
                    String feedbackId = request.getParameter("feedbackId");
                    feedbackService.deleteFeedback(feedbackId);
                    response.sendRedirect("feedback?action=list");
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            case "editFeedback":
                if (session != null && session.getAttribute("username") != null) {
                    String feedbackId = request.getParameter("feedbackId");
                    String message = sanitizeInput(request.getParameter("message"));
                    String editRatingStr = request.getParameter("rating");
                    
                    try {
                        int rating = Integer.parseInt(editRatingStr);
                        if (rating < 1 || rating > 5) {
                            request.setAttribute("error", "Rating must be between 1 and 5");
                            response.sendRedirect("feedback?action=list");
                            return;
                        }
                        feedbackService.updateFeedback(feedbackId, message, rating);
                        response.sendRedirect("feedback?action=list");
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Invalid rating format");
                        response.sendRedirect("feedback?action=list");
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    private String sanitizeInput(String input) {
        if (input == null) return "";
        String sanitized = input;
        sanitized = sanitized.replace("&", "&amp;");
        sanitized = sanitized.replace("<", "&lt;");
        sanitized = sanitized.replace(">", "&gt;");
        sanitized = sanitized.replace("\"", "&quot;");
        sanitized = sanitized.replace("'", "&#39;");
        return sanitized;
    }
}