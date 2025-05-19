<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.model.Driver" %>
<%@ page import="org.example.util.DriverFileUtil" %>
<%@ page import="java.util.List" %>
<%
    if (session == null || session.getAttribute("role") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Driver> drivers = DriverFileUtil.getAllDriversSortedByRating();
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Drivers</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            color: #4361ee;
            border-bottom: 2px solid #ddd;
            padding-bottom: 15px;
        }

        .logo-icon {
            font-size: 28px;
            color: #4361ee;
            margin-right: 15px;
        }

        h2 {
            color: #4361ee;
            margin: 0;
            font-size: 26px;
        }

        /* Table Styles */
        .table-container {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow-x: auto;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background-color: #e9ecef;
            color: #333;
            text-align: left;
            padding: 14px 16px;
            font-weight: 600;
            border-bottom: 2px solid #ddd;
        }

        td {
            padding: 14px 16px;
            border-bottom: 1px solid #eee;
        }

        tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        tr:hover {
            background-color: #f0f0f5;
        }

        /* Rating Cell Styling */
        .rating-cell {
            position: relative;
        }

        .rating-value {
            display: flex;
            align-items: center;
            color: #ffc107;
            font-weight: 500;
        }

        .rating-stars {
            display: inline-block;
            margin-left: 8px;
            color: #ffc107;
            font-size: 16px;
        }

        /* Back Link */
        .back-link {
            display: inline-flex;
            align-items: center;
            color: #6c757d;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
            margin-top: 20px;
        }

        .back-link:before {
            content: "←";
            margin-right: 8px;
            font-size: 18px;
        }

        .back-link:hover {
            color: #4361ee;
        }

        /* Info Bar */
        .info-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            color: #6c757d;
            font-size: 14px;
        }

        .driver-count {
            background-color: #f0f0f5;
            padding: 8px 15px;
            border-radius: 20px;
        }

        .driver-count strong {
            color: #4361ee;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            th, td {
                padding: 10px;
                font-size: 14px;
            }

            .info-bar {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo-icon">🚕</div>
        <h2>Driver List</h2>
    </div>

    <div class="info-bar">
        <div class="driver-count">
            <strong><%= drivers.size() %></strong> drivers
        </div>
        <div>Sorted by highest rating</div>
    </div>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>License</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Rating</th>
            </tr>
            </thead>
            <tbody>
            <% for (Driver driver : drivers) {
                String stars = "";
                double rating = driver.getRating();
                int fullStars = (int)rating;
                boolean hasHalfStar = (rating - fullStars) >= 0.5;

                for (int i = 0; i < fullStars; i++) {
                    stars += "★";
                }

                if (hasHalfStar) {
                    stars += "½";
                }

                while (stars.length() < 5) {
                    stars += "☆";
                }
            %>
            <tr>
                <td><%= driver.getId() %></td>
                <td><%= driver.getName() %></td>
                <td><%= driver.getLicenseNumber() %></td>
                <td><%= driver.getPhone() %></td>
                <td><%= driver.getEmail() %></td>
                <td class="rating-cell">
                    <div class="rating-value">
                        <%= String.format("%.1f", driver.getRating()) %>
                        <span class="rating-stars"><%= stars %></span>
                    </div>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>

    <a href="admin_dashboard.jsp" class="back-link">Back to Dashboard</a>
</div>
</body>
</html>