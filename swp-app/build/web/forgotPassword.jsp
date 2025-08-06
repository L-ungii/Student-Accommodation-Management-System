<%-- 
    Document   : forgotPassword
    Created on : 28 Apr 2025, 13:32:16
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Page</title>
    </head>
    <body>
        <h1>Forgot Password</h1>
        <p>
            Enter the details below to update your password
        </p>
        <form action = "UpdateServlet.do" method="POST">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="number" name="studNum" required=""/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="UPDATE"/></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
