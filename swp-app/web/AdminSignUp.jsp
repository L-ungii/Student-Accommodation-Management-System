<%-- 
    Document   : AdminSignUp
    Created on : 28 Apr 2025, 20:27:35
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Sign_Up Page</title>
    </head>
    <body>
        <h1>Administrator Sign_Up</h1>
        <p>
            Enter the details below to sign up
        </p>
        <form action="AdminSignUpServlet.do" method="POST">
            <table>
                <tr>
                    <td>Administrator Number:</td>
                    <td><input type="number" name ="adminNum" required=""/></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name ="name" required=""/></td>
                </tr>
                <tr>
                    <td>Surname:</td>
                    <td><input type="text" name ="surname" required=""/></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name ="email" required=""/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name ="password" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Sign Up"/></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="LogoutServlet.do">logout</a>
        </p>
    </body>
</html>
