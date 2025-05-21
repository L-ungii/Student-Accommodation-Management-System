<%-- 
    Document   : cancelRegistration
    Created on : 20 May 2025, 20:48:09
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Registration Page</title>
    </head>
    <body>
        <h1>Cancel Registration</h1>
            <p>Please enter your student number to cancel your registration</p>

            <form action="CancelRegitrationAdmin.do" method="POST">
                <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="number" name="studNum" required=""/></td>
                </tr>
                <tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="TERMINATE"/></td>
                </tr>
            </table>
            </form>

            <a href="LogoutServlet.do">Logout</a>
    </body>
</html>
