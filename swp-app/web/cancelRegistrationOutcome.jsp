<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Result Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
                padding: 1rem;
                box-sizing: border-box;
               
            }

            body::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('pic.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center center;
                filter: blur(5px);
                -webkit-filter: blur(5px);
                z-index: -1;
            }

            .theme-container {
                max-width: 500px;
                width: 90%;
                padding: 3rem;
                background-color: rgba(255, 255, 255, 0.5);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border-radius: 1.5rem;
                box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.3);
                z-index: 1;
            }

            .heading {
                font-size: 2.5rem;
                font-weight: 700;
                color: #4f46e5;
                margin-bottom: 1.5rem;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
            }

            .message {
                font-size: 1.125rem;
                color: #374151;
                margin-bottom: 2rem;
                line-height: 1.75rem;
            }

            .nav-links {
                list-style: none;
                padding: 0;
                margin-top: 2.5rem;
            }

            .nav-links li {
                margin-bottom: 1rem;
            }

            .nav-link {
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
            }

            .main-menu-link {
                color: #4f46e5;
            }

            .main-menu-link:hover {
                color: #4338ca;
            }

            .logout-link {
                color: #ef4444;
            }

            .logout-link:hover {
                color: #dc2626;
            }

            @media (max-width: 768px) {
                .theme-container {
                    padding: 2rem;
                    width: 90%;
                }
                .heading {
                    font-size: 2rem;
                }
                .message {
                    font-size: 1rem;
                }
                .nav-link {
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="theme-container">
            <h1 class="heading">Cancellation Result</h1>

            <%
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
            <p class="message"><%= message%></p>
            <%
            } else {
            %>
            <p class="message">No message to display.</p>
            <%
                }
            %>

            <ul class="nav-links">
                <li><a href="studentMenu.html" class="nav-link main-menu-link">Main Menu</a></li>
                <li><a href="LogoutServlet.do" class="nav-link logout-link">Logout</a></li>
            </ul>
        </div>
    </body>
</html>
