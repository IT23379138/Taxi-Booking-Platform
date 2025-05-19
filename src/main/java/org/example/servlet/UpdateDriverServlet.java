package org.example.servlet;

import org.example.model.Driver;
import org.example.util.DriverFileUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/update-driver")
public class UpdateDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String license = request.getParameter("licenseNumber");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        double rating = Double.parseDouble(request.getParameter("rating"));

        Driver updatedDriver = new Driver(id, name, license, phone, email, rating);
        DriverFileUtil.updateDriver(updatedDriver);

        response.sendRedirect("viewDrivers.jsp");
    }
}
