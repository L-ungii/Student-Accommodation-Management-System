<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <script src="https://unpkg.com/@tailwindcss/browser@latest"></script>
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }

            .container {
                max-width: 500px;
                width: 90%;
                padding: 3rem;
                background-color: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(12px);
                border-radius: 1.5rem;
                box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.3);
            }

            .heading {
                font-size: 2.5rem;
                font-weight: 700;
                color: #4f46e5;
                margin-bottom: 1.5rem;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
            }

            .description {
                font-size: 1.125rem;
                color: #6b7280;
                margin-bottom: 2rem;
                line-height: 1.75rem;
            }

            .form-group {
                margin-bottom: 1.5rem;
                text-align: left;
            }

            .form-group label {
                display: block;
                font-weight: 600;
                color: #4a5568;
                margin-bottom: 0.75rem;
                font-size: 0.95rem;
            }

            .text-input {
                width: 100%;
                padding: 0.75rem 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.5rem;
                background-color: #ffffff;
                font-size: 1rem;
                color: #374151;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
                box-sizing: border-box;
            }

            .text-input:focus {
                border-color: #6366f1;
                outline: none;
                box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25);
            }

            .submit-btn {
                display: block;
                width: 100%;
                padding: 1rem 2rem;
                background-color: #4f46e5;
                color: white;
                font-size: 1.125rem;
                font-weight: 600;
                border: none;
                border-radius: 0.75rem;
                cursor: pointer;
                transition: background-color 0.2s ease, transform 0.1s ease;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                margin-top: 2rem;
            }

            .submit-btn:hover {
                background-color: #4338ca;
                transform: translateY(-2px);
            }

            .submit-btn:active {
                transform: translateY(0);
            }

            .error-message {
                color: #ef4444; 
                font-size: 0.875rem;
                margin-top: 0.5rem;
                margin-bottom: 1rem;
                text-align: center;
                font-weight: 500;
            }

             .logout-link {
                display: inline-block;
                color: #ef4444;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
                margin-top: 1rem;
            }
            .logout-link:hover {
                color: #dc2626;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 2rem;
                    margin: 2rem auto;
                }
                .heading {
                    font-size: 2rem;
                }
                .description {
                    font-size: 1rem;
                }
                .form-group {
                    text-align: left;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1 class="heading">Forgot Password</h1>

            <p class="description">
                Set a new password
            </p>

            <form action="UpdateServlet.do" method="POST">
                <%
                    String incorrectId = (String) request.getAttribute("incorrectId");
                    String passwordMismatchError = (String) request.getAttribute("passwordMismatchError");
                %>

                
                <% if (incorrectId != null) { %>
                    <p class="error-message"><%= incorrectId %></p>
                <% } %>
                <% if (passwordMismatchError != null) { %>
                    <p class="error-message"><%= passwordMismatchError %></p>
                <% } %>

                <div class="form-group">
                    <label for="studNum">Student Number:</label>
                    <input type="number" id="studNum" name="studNum" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="password">New Password:</label>
                    <input type="password" id="password" name="password" required class="text-input"/>
                </div>
                <div class="form-group">
                    <label for="password2">Confirm New Password:</label>
                    <input type="password" id="password2" name="password2" required class="text-input"/>
                </div>

                <input type="submit" value="UPDATE" class="submit-btn"/>
            </form>

            <a href="LogoutServlet.do" class="logout-link">Logout</a>
        </div>
    </body>
</html>
