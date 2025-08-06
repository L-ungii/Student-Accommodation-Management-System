<%-- 
    Document   : StudentSignUp
    Created on : 28 Apr 2025, 13:02:57
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Sign_up Page</title>
    </head>
    <body>
        <h1>Student Sign_up</h1>
        <p>
            Enter the details below to sign up
        </p>
        <form action="SignUpServlet.do" method="POST">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="number" name ="studNum" required=""/></td>
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
                    <td>email:</td>
                    <td><input type="email" name ="email" required=""/></td>
                </tr>
                <tr>
                    <td>password:</td>
                    <td><input type="password" name ="password" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Sign Up"/></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
