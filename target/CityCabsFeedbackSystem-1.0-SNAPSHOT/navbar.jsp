<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <i class="fas fa-car-alt"></i> CityCabs
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <i class="fas fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <% if (session.getAttribute("username") != null) { %>
                <% if (!"admin".equals(session.getAttribute("userRole"))) { %>
                <li class="nav-item">
                    <a class="nav-link" href="feedback?action=form">
                        <i class="fas fa-comment-dots"></i> Feedback
                    </a>
                </li>
                <% } %>

                <li class="nav-item">
                    <a class="nav-link" href="feedback?action=dashboard">
                        <i class="fas fa-chart-line"></i> Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="feedback?action=list">
                        <i class="fas fa-list-ul"></i> Feedback List
                    </a>
                </li>

                <% if ("admin".equals(session.getAttribute("userRole"))) { %>
                <li class="nav-item">
                    <a class="nav-link" href="feedback?action=adminDriverRatings">
                        <i class="fas fa-star-half-alt"></i> Driver Ratings
                    </a>
                </li>
                <% } %>

                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">
                        <div class="rounded-circle bg-accent d-flex align-items-center justify-content-center" style="width: 32px; height: 32px; margin-right: 8px;">
                            <i class="fas fa-user text-white" style="font-size: 0.8rem;"></i>
                        </div>
                        ${sessionScope.username}
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="feedback?action=logout">
                        <i class="fas fa-sign-out-alt me-1"></i>Logout
                    </a>
                </li>

                <li class="nav-item">
                    <button class="btn btn-sm btn-outline-light rounded-pill theme-toggle" onclick="toggleTheme()">
                        <i id="theme-icon" class="fas fa-moon"></i>
                    </button>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="btn btn-primary rounded-pill px-3" href="index.jsp">
                        <i class="fas fa-sign-in-alt me-1"></i> Login
                    </a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<script>
    function toggleTheme() {
        const body = document.body;
        const themeIcon = document.getElementById('theme-icon');
        if (body.getAttribute('data-theme') === 'dark') {
            body.removeAttribute('data-theme');
            themeIcon.classList.replace('fa-sun', 'fa-moon');
            localStorage.setItem('theme', 'light');
        } else {
            body.setAttribute('data-theme', 'dark');
            themeIcon.classList.replace('fa-moon', 'fa-sun');
            localStorage.setItem('theme', 'dark');
        }
    }

    // Initialize theme from localStorage
    document.addEventListener('DOMContentLoaded', () => {
        const savedTheme = localStorage.getItem('theme');
        const themeIcon = document.getElementById('theme-icon');
        if (savedTheme === 'dark') {
            document.body.setAttribute('data-theme', 'dark');
            themeIcon.classList.replace('fa-moon', 'fa-sun');
        } else {
            document.body.removeAttribute('data-theme');
            themeIcon.classList.replace('fa-sun', 'fa-moon');
        }

        // Initialize tooltips
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });
</script>