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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-color: #f5f7fa;
            --card-bg: #ffffff;
            --text-color: #2d3748;
            --primary: #4361ee;
            --secondary: #f8f9fa;
            --welcome-bg: #eef2ff;
            --table-header-bg: #e9ecef;
            --table-row-even: #f8f9fa;
            --table-row-hover: #f0f0f5;
            --star-color: #ffc107;
            --info-bar-bg: #f0f0f5;
        }

        .dark-mode {
            --bg-color: #1a202c;
            --card-bg: #2d3748;
            --text-color: #f7fafc;
            --primary: #5f6fdb;
            --secondary: #4a5568;
            --welcome-bg: #2d3748;
            --table-header-bg: #4a5568;
            --table-row-even: #2d3748;
            --table-row-hover: #4a5568;
            --star-color: #fdd835; /* Brighter yellow for dark mode stars */
            --info-bar-bg: #4a5568;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            transition: all 0.3s ease;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: var(--card-bg);
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
            transition: all 0.3s ease;
        }

        .header {
            display: flex;
            justify-content: space-between; /* To push theme toggle to right */
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 1px solid var(--secondary);
            padding-bottom: 15px;
        }

        .header-left { /* Group logo and title */
            display: flex;
            align-items: center;
        }

        .logo-icon {
            font-size: 2rem;
            color: var(--primary);
            margin-right: 15px;
        }

        h2 {
            color: var(--primary);
            margin: 0;
            font-size: 1.8rem;
            font-weight: 600;
        }

        .theme-toggle {
            background: none;
            border: none;
            color: var(--text-color);
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s;
            padding: 8px;
            border-radius: 6px;
        }

        .theme-toggle:hover {
            transform: rotate(25deg);
        }

        /* Table Styles */
        .table-container {
            background-color: var(--card-bg);
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            overflow-x: auto;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th {
            background-color: var(--table-header-bg);
            color: var(--text-color);
            text-align: left;
            padding: 14px 16px;
            font-weight: 600;
            border-bottom: 2px solid var(--secondary);
        }

        td {
            padding: 14px 16px;
            border-bottom: 1px solid var(--secondary);
            color: var(--text-color);
        }

        tr:nth-child(even) {
            background-color: var(--table-row-even);
        }

        tr:hover {
            background-color: var(--table-row-hover);
        }

        /* Rating Cell Styling */
        .rating-cell {
            position: relative;
        }

        .rating-value {
            display: flex;
            align-items: center;
            color: var(--star-color); /* Uses star color for value */
            font-weight: 500;
        }

        .rating-stars {
            display: inline-block;
            margin-left: 8px;
            color: var(--star-color);
            font-size: 16px;
        }

        /* Back Link */
        .back-link {
            display: inline-flex;
            align-items: center;
            color: var(--text-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease, transform 0.2s ease;
            margin-top: 20px;
            font-size: 1rem;
        }

        .back-link:hover {
            color: var(--primary);
            transform: translateX(-5px);
        }

        .back-link i {
            margin-right: 8px;
            font-size: 1.1rem;
        }

        /* Info Bar */
        .info-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            color: var(--text-color);
            font-size: 14px;
            background-color: var(--info-bar-bg); /* Use info bar background */
            padding: 12px 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .driver-count {
            background-color: transparent; /* No specific background, relies on info-bar-bg */
            padding: 0;
            border-radius: 0;
        }

        .driver-count strong {
            color: var(--primary);
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
                padding: 10px 15px;
            }
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }
            .back-link {
                width: 100%;
                text-align: center;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="header-left">
            <div class="logo-icon">
                <i class="fas fa-users"></i>
            </div>
            <h2>Driver List</h2>
        </div>
        <button class="theme-toggle" id="themeToggle">
            <i class="fas fa-moon"></i>
        </button>
    </div>

    <div class="info-bar">
        <div class="driver-count">
            <strong><%= drivers.size() %></strong> drivers listed
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

                // Fill remaining with empty stars up to 5
                while (stars.length() < 5) {
                    // Check if current stars count (considering half star as 1 char) is less than 5 full stars
                    // A full star is 1 char, a half star is 1 char
                    // We need to account for unicode characters occupying visual space
                    // This logic assumes '★' and '½' each take 1 char space in the string.
                    int currentVisualStars = fullStars + (hasHalfStar ? 1 : 0);
                    if (currentVisualStars + (5 - fullStars) > 5 && hasHalfStar) {
                        // If we have a half star and adding full empty stars would exceed 5 visual stars,
                        // it means we effectively have 4.5 stars and need one more empty star.
                        if (stars.length() < 5) { // Ensure we don't add more than 5 total star characters
                            stars += "☆";
                        } else {
                            break; // Stop if we've reached 5 visual stars
                        }
                    } else {
                        stars += "☆";
                    }

                    // A more robust way might be to just iterate 5 times and pick char based on rating
                    // For simplicity, sticking to the original logic structure but refined.
                    if (stars.length() >= 5) break; // Ensure we don't go beyond 5 characters for stars.
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
    <a href="admin_dashboard.jsp" class="back-link">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>

</div>

<script>
    // Theme toggle functionality
    const themeToggle = document.getElementById('themeToggle');
    const icon = themeToggle.querySelector('i');

    // Check for saved theme preference
    if (localStorage.getItem('theme') === 'dark') {
        document.body.classList.add('dark-mode');
        icon.classList.replace('fa-moon', 'fa-sun');
    }

    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('dark-mode');

        if (document.body.classList.contains('dark-mode')) {
            icon.classList.replace('fa-moon', 'fa-sun');
            localStorage.setItem('theme', 'dark');
        } else {
            icon.classList.replace('fa-sun', 'fa-moon');
            localStorage.setItem('theme', 'light');
        }
    });
</script>
</body>
</html>