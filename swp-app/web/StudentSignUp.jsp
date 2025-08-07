<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Sign Up</title>
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
                max-width: 600px;
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
                margin-bottom: 0.5rem;
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

            .validation-message {
                font-size: 0.8rem;
                margin-top: 0.2rem;
                text-align: left;
                padding-left: 0.5rem;
            }

            .validation-message.valid {
                color: #22c55e;
            }

            .validation-message.invalid {
                color: #ef4444;
            }

            .logout-link {
                display: inline-block;
                color: #4f46e5;
                font-size: 0.95rem;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.2s ease, text-decoration 0.2s ease;
                padding: 0.25rem 0.5rem;
                border-radius: 0.25rem;
                margin-top: 2.5rem;
            }

            .logout-link:hover {
                color: #4338ca;
                text-decoration: underline;
                background-color: rgba(79, 70, 229, 0.05);
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
            <h1 class="heading">Student</h1>

            <p class="description">
                Enter your details below to create a new student account.
            </p>

            <form action="SignUpServlet.do" method="POST" class="form-container" onsubmit="return validateForm()">
                <%
                    String existingStudNumError = (String) request.getAttribute("existingStudNumError");
                    String passwordMismatchError = (String) request.getAttribute("passwordMismatchError");
                    String passwordRequirementsError = (String) request.getAttribute("passwordRequirementsError");
                %>

                <% if (existingStudNumError != null) { %>
                    <p class="error-message"><%= existingStudNumError %></p>
                <% } %>
                <% if (passwordMismatchError != null) { %>
                    <p class="error-message"><%= passwordMismatchError %></p>
                <% } %>
                <% if (passwordRequirementsError != null) { %>
                    <p class="error-message"><%= passwordRequirementsError %></p>
                <% } %>

                <div class="form-group">
                    <label for="studNum">Student Number:</label>
                    <input type="number" id="studNum" name="studNum" required class="text-input" value="<%= (request.getParameter("studNum") != null) ? request.getParameter("studNum") : "" %>"/>
                </div>

                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required class="text-input" value="<%= (request.getParameter("name") != null) ? request.getParameter("name") : "" %>"/>
                </div>

                <div class="form-group">
                    <label for="surname">Surname:</label>
                    <input type="text" id="surname" name="surname" required class="text-input" value="<%= (request.getParameter("surname") != null) ? request.getParameter("surname") : "" %>"/>
                </div>

                <div class="form-group">
                    <label for="studNum">Study Level:</label>
                    <input type="number" id="studyLevel" name="studyLevel" required class="text-input" value="<%= (request.getParameter("studyLevel") != null) ? request.getParameter("studyLevel") : "" %>"/>
                </div>
                
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required class="text-input" onkeyup="validateEmail()" value="<%= (request.getParameter("email") != null) ? request.getParameter("email") : "" %>"/>
                    <div id="email-feedback" class="validation-message"></div>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required class="text-input" onkeyup="validatePassword()"/>
                    <div id="password-feedback" class="validation-message"></div>
                    <ul class="validation-list text-left text-xs mt-1">
                        <li id="length" class="validation-message invalid">Minimum 8 characters</li>
                        <li id="uppercase" class="validation-message invalid">At least one uppercase letter</li>
                        <li id="lowercase" class="validation-message invalid">At least one lowercase letter</li>
                        <li id="number" class="validation-message invalid">At least one number</li>
                    </ul>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required class="text-input" onkeyup="validatePassword()"/>
                    <div id="confirm-password-feedback" class="validation-message"></div>
                </div>

                <input type="submit" value="Sign Up" class="submit-btn"/>
            </form>

            <a href="LogoutServlet.do" class="logout-link">Logout</a>
        </div>

        <script>
            function validateEmail() {
                const email = document.getElementById('email').value;
                const emailFeedback = document.getElementById('email-feedback');
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                let isValid = true;

                if (email.length === 0) {
                    emailFeedback.textContent = '';
                    emailFeedback.classList.remove('valid', 'invalid');
                    isValid = false;
                } else if (emailRegex.test(email)) {
                    emailFeedback.textContent = 'Valid email format.';
                    emailFeedback.classList.remove('invalid');
                    emailFeedback.classList.add('valid');
                } else {
                    emailFeedback.textContent = 'Invalid email format.';
                    emailFeedback.classList.remove('valid');
                    emailFeedback.classList.add('invalid');
                    isValid = false;
                }
                return isValid;
            }

            function validatePassword() {
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirmPassword').value;

                const length = document.getElementById('length');
                const uppercase = document.getElementById('uppercase');
                const lowercase = document.getElementById('lowercase');
                const number = document.getElementById('number');
                const confirmPasswordFeedback = document.getElementById('confirm-password-feedback');

                let isValid = true;

                if (password.length >= 8) {
                    length.classList.remove('invalid');
                    length.classList.add('valid');
                } else {
                    length.classList.remove('valid');
                    length.classList.add('invalid');
                    isValid = false;
                }

                if (/[A-Z]/.test(password)) {
                    uppercase.classList.remove('invalid');
                    uppercase.classList.add('valid');
                } else {
                    uppercase.classList.remove('valid');
                    uppercase.classList.add('invalid');
                    isValid = false;
                }

                if (/[a-z]/.test(password)) {
                    lowercase.classList.remove('invalid');
                    lowercase.classList.add('valid');
                } else {
                    lowercase.classList.remove('valid');
                    lowercase.classList.add('invalid');
                    isValid = false;
                }

                if (/[0-9]/.test(password)) {
                    number.classList.remove('invalid');
                    number.classList.add('valid');
                } else {
                    number.classList.remove('valid');
                    number.classList.add('invalid');
                    isValid = false;
                }

                if (confirmPassword.length > 0) {
                    if (password === confirmPassword) {
                        confirmPasswordFeedback.textContent = 'Passwords match!';
                        confirmPasswordFeedback.classList.remove('invalid');
                        confirmPasswordFeedback.classList.add('valid');
                    } else {
                        confirmPasswordFeedback.textContent = 'Passwords do not match.';
                        confirmPasswordFeedback.classList.remove('valid');
                        confirmPasswordFeedback.classList.add('invalid');
                        isValid = false;
                    }
                } else {
                    confirmPasswordFeedback.textContent = '';
                    confirmPasswordFeedback.classList.remove('valid', 'invalid');
                }

                return isValid;
            }

            function validateForm() {
                const isEmailValid = validateEmail();
                const isPasswordValid = validatePassword();
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirmPassword').value;

                if (!isEmailValid) {
                    return false;
                }

                if (!isPasswordValid) {
                    return false;
                }

                if (password !== confirmPassword) {
                    return false;
                }
                
                return true;
            }
        </script>
    </body>
</html>
