<%-- 
    Document   : studentLogin
    Created on : 28 Apr 2025, 11:57:30
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login Page</title>
    </head>
    <body>
        <h1>Student Login</h1>
        <p>
            Enter the details below to login
        </p>
        <form>
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="text" name="studNum" required=""/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required=""/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
