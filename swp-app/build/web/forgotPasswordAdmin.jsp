<%-- 
    Document   : forgotPasswordAdmin
    Created on : 01 May 2025, 18:58:38
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
        <form action = "UpdateServletAdmin.do" method="POST">
            <table>
                <tr>
                    <td>Administrator Number:</td>
                    <td><input type="number" name="adminNum" required=""/></td>
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
    </body>
</html>
