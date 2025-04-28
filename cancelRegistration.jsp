<%-- 
    Document   : cancelRegistration
    Created on : 27 Apr 2025, 19:56:59
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
        <p>
            Please enter your student number to cancel your registration
        </p>
        <form action="" method="POST">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="text" name="studNum"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" type="SUBMIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
