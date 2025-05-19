package org.example.servlet;

import org.example.util.DriverFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/delete-driver")
public class DeleteDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        DriverFileUtil.deleteDriver(id);
        response.sendRedirect("viewDrivers.jsp");
    }
}
