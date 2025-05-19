package org.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        if (username.equals("admin") && password.equals("admin123")) {
            session.setAttribute("role", "admin");
            response.sendRedirect("admin_dashboard.jsp"); // Redirect to admin dashboard
        } else if (username.equals("user") && password.equals("user123")) {
            session.setAttribute("role", "user");
            response.sendRedirect("view-drivers"); // Redirect user to view the driver list
        } else {
            request.setAttribute("error", "Invalid credentials");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}