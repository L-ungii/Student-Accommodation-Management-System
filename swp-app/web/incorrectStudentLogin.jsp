<%-- 
    Document   : incorrectStudentLogin.jsp
    Created on : 28 Apr 2025, 12:46:13
    Author     : sambo
--%>

<%@page isErrorPage="true" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>incorrect_Student_Login Page</title>
    </head>
    <body>
        <h1>Incorrect Student Login Info</h1>
        <p>
            Please enter the correct student number and password
        </p>
        <p>
            Click <a href="studentLogin.jsp">here</a> to go back.
        </p>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
