package org.example.servlet;

import org.example.model.Driver;
import org.example.util.DriverFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/view-drivers")
public class ViewDriversServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            System.out.println("No valid session, redirecting to login.jsp");
            response.sendRedirect("login.jsp");
            return;
        }
        List<Driver> drivers = DriverFileUtil.getAllDriversSortedByRating();
        System.out.println("Retrieved " + drivers.size() + " drivers");
        request.setAttribute("drivers", drivers);
        request.getRequestDispatcher("viewDrivers.jsp").forward(request, response);
    }

}