package org.pg113.citycabsfeedbacksystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/userAndDriver")
public class UserAndDriverServlet extends HttpServlet {
    private UserAndDriver userAndDriver;
    private static final Logger LOGGER = Logger.getLogger(UserAndDriverServlet.class.getName());

    @Override
    public void init() throws ServletException {
        userAndDriver = UserAndDriver.getInstance();
        LOGGER.info("UserAndDriverServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if (action == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "signup":
                handleSignup(request, response);
                break;
            case "logout":
                if (session != null) {
                    session.invalidate();
                }
                request.getRequestDispatcher("/logout.jsp").forward(request, response);
                break;
            case "addDriver":
                if (session != null && "admin".equals(session.getAttribute("userRole"))) {
                    String driverId = sanitizeInput(request.getParameter("driverId"));
                    String driverName = sanitizeInput(request.getParameter("driverName"));
                    if (!driverId.isEmpty() && !driverName.isEmpty() && !userAndDriver.getAllDrivers().containsKey(driverId)) {
                        userAndDriver.addDriver(driverId, driverName);
                        response.sendRedirect("feedback?action=adminDriverRatings");
                    } else {
                        request.setAttribute("error", "Invalid driver ID or name, or driver already exists");
                        request.getRequestDispatcher("/admin_welcome.jsp").forward(request, response);
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
                break;
            default:
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = sanitizeInput(request.getParameter("username"));
        String password = sanitizeInput(request.getParameter("password"));
        
        if (userAndDriver.validateUser(username, password)) {
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);
            session.setAttribute("userEmail", userAndDriver.getUserEmail(username));
            session.setAttribute("userRole", userAndDriver.getUserRole(username));
            response.sendRedirect("feedback?action=dashboard");
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = sanitizeInput(request.getParameter("username"));
        String password = sanitizeInput(request.getParameter("password"));
        String email = sanitizeInput(request.getParameter("email"));
        
        if (!userAndDriver.userExists(username)) {
            userAndDriver.addUser(username, password, email, "user");
            request.getRequestDispatcher("/signup_success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Username already exists");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private String sanitizeInput(String input) {
        if (input == null) return "";
        String sanitized = input;
        sanitized = sanitized.replace("&", "&");
        sanitized = sanitized.replace("<", "<");
        sanitized = sanitized.replace(">", ">");
        sanitized = sanitized.replace("\"", "\"");
        sanitized = sanitized.replace("'", "'");
        return sanitized;
    }
} 