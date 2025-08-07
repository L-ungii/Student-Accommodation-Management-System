<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Residence Manager Application</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 1rem;
            box-sizing: border-box;
            position: relative;
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
            max-width: 700px;
            width: 95%;
            padding: 3rem;
            background-color: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 1.5rem;
            box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.3);
            z-index: 1;
            max-height: 90vh;
            overflow-y: auto;
        }

        .heading {
            font-size: 2.5rem;
            font-weight: 700;
            color: #4f46e5;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1rem;
            color: #4b5563;
            background-color: #ffffff;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        .form-group input[type="file"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1rem;
            color: #4b5563;
            background-color: #ffffff;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
        }
        
        .form-group input[type="file"]::-webkit-file-upload-button {
            background-color: #4f46e5;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            border: none;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }
        .form-group input[type="file"]::-webkit-file-upload-button:hover {
            background-color: #6366f1;
        }


        .form-group input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.3);
        }

        .submit-button {
            display: inline-block;
            background-color: #4f46e5;
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
            border: none;
            margin-top: 1rem;
            text-decoration: none;
        }

        .submit-button:hover {
            background-color: #6366f1;
        }

        .login-link {
            display: inline-block;
            color: #ef4444;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s ease;
            margin-top: 1.5rem;
        }

        .login-link:hover {
            color: #dc2626;
            text-decoration: underline;
        }
        
        .validation-message {
            font-size: 0.875rem;
            margin-top: 0.25rem;
            text-align: left;
            min-height: 1.25rem;
        }

        .validation-message.valid,
        .validation-list li.valid {
            color: #10b981;
        }

        .validation-message.invalid,
        .validation-list li.invalid {
            color: #ef4444;
        }

        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
            text-align: left;
        }

        @media (max-width: 768px) {
            .theme-container {
                padding: 2rem;
                width: 90%;
            }
            .heading {
                font-size: 2rem;
            }
        }
    </style>
    <script>
        function setValidationStatus(element, isValid, message) {
            if (element) {
                element.textContent = message;
                if (isValid) {
                    element.classList.remove('invalid');
                    element.classList.add('valid');
                } else {
                    element.classList.remove('valid');
                    element.classList.add('invalid');
                }
            }
        }

        function updatePasswordCriterion(elementId, condition) {
            const element = document.getElementById(elementId);
            if (element) {
                if (condition) {
                    element.classList.remove('invalid');
                    element.classList.add('valid');
                } else {
                    element.classList.remove('valid');
                    element.classList.add('invalid');
                }
            }
            return condition;
        }

        function validateEmail() {
            const email = document.getElementById('email').value;
            const emailFeedback = document.getElementById('email-feedback');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            let isValid = true;

            if (email.length === 0) {
                setValidationStatus(emailFeedback, false, '');
                isValid = false;
            } else if (emailRegex.test(email)) {
                setValidationStatus(emailFeedback, true, 'Valid email format.');
            } else {
                setValidationStatus(emailFeedback, false, 'Invalid email format.');
                isValid = false;
            }
            return isValid;
        }

        function validatePasswordFields() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const confirmPasswordFeedback = document.getElementById('confirm-password-feedback');

            let isPasswordComplex = true;
            isPasswordComplex = updatePasswordCriterion('length', password.length >= 8) && isPasswordComplex;
            isPasswordComplex = updatePasswordCriterion('uppercase', /[A-Z]/.test(password)) && isPasswordComplex;
            isPasswordComplex = updatePasswordCriterion('lowercase', /[a-z]/.test(password)) && isPasswordComplex;
            isPasswordComplex = updatePasswordCriterion('number', /[0-9]/.test(password)) && isPasswordComplex;

            let passwordsMatch = false;
            if (confirmPassword.length > 0) {
                if (password === confirmPassword) {
                    setValidationStatus(confirmPasswordFeedback, true, 'Passwords match!');
                    passwordsMatch = true;
                } else {
                    setValidationStatus(confirmPasswordFeedback, false, 'Passwords do not match.');
                }
            } else {
                setValidationStatus(confirmPasswordFeedback, false, '');
            }

            return isPasswordComplex && passwordsMatch;
        }

        function validateForm() {
            const isEmailValid = validateEmail();
            const arePasswordsValid = validatePasswordFields();

            if (!isEmailValid) {
                alert("Please enter a valid email address.");
                return false;
            }
            
            if (!arePasswordsValid) {
                 alert("Please ensure your password meets all requirements and matches the confirmation.");
                return false;
            }

            var idNum = document.getElementById("idNum").value;
            var idRegex = /^[0-9]{13}$/;
            if (!idRegex.test(idNum)) {
                alert("Please enter a valid 13-digit ID number.");
                return false;
            }

            const fileInputs = document.querySelectorAll('input[type="file"][required]');
            for (let i = 0; i < fileInputs.length; i++) {
                if (fileInputs[i].files.length === 0) {
                    alert('Please upload all required documents.');
                    return false;
                }
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="theme-container">
        <h1 class="heading">Residence Manager Application</h1>
        <% String idNumError = (String) request.getAttribute("idNumError"); %>
        <% if (idNumError != null) { %>
            <p class="error-message"><%= idNumError %></p>
        <% } %>
        <% String usernameError = (String) request.getAttribute("usernameError"); %>
        <% if (usernameError != null) { %>
            <p class="error-message"><%= usernameError %></p>
        <% } %>

        <form action="AdminSignUpServlet.do" method="POST" enctype="multipart/form-data" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required value="<%= (request.getParameter("name") != null) ? request.getParameter("name") : "" %>">
            </div>
            <div class="form-group">
                <label for="surname">Surname:</label>
                <input type="text" id="surname" name="surname" required value="<%= (request.getParameter("surname") != null) ? request.getParameter("surname") : "" %>">
            </div>
            <div class="form-group">
                <label for="idNum">ID Number:</label>
                <input type="text" id="idNum" name="idNum" required pattern="[0-9]{13}" title="Please enter a valid 13-digit ID number." value="<%= (request.getParameter("idNum") != null) ? request.getParameter("idNum") : "" %>">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required onkeyup="validateEmail()" value="<%= (request.getParameter("email") != null) ? request.getParameter("email") : "" %>">
                <div id="email-feedback" class="validation-message"></div>
            </div>
            <div class="form-group">
                <label for="idCopy">Certified Copy of ID:</label>
                <input type="file" id="idCopy" name="idCopy" required>
            </div>
            <div class="form-group">
                <label for="leaseCopy">Copy of Lease Agreement:</label>
                <input type="file" id="leaseCopy" name="leaseCopy" required>
            </div>
            <div class="form-group">
                <label for="businessLicenseCopy">Business License:</label>
                <input type="file" id="businessLicenseCopy" name="businessLicenseCopy" required>
            </div>
            <div class="form-group">
                <label for="username">Preferred Username:</label>
                <input type="text" id="username" name="username" required value="<%= (request.getParameter("username") != null) ? request.getParameter("username") : "" %>">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required onkeyup="validatePasswordFields()" minlength="8" title="Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, and one number.">
                <ul class="validation-list text-left text-xs mt-1">
                    <li id="length" class="validation-message invalid">Minimum 8 characters</li>
                    <li id="uppercase" class="validation-message invalid">At least one uppercase letter</li>
                    <li id="lowercase" class="validation-message invalid">At least one lowercase letter</li>
                    <li id="number" class="validation-message invalid">At least one number</li>
                </ul>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required onkeyup="validatePasswordFields()">
                <div id="confirm-password-feedback" class="validation-message"></div>
            </div>
            <button type="submit" class="submit-button">Submit Application</button>
        </form>
        <a href="resManLogin.jsp" class="login-link">Login</a>
    </div>
</body>
</html>