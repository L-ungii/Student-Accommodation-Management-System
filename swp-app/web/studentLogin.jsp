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
        <form action = "LoginServlet.do" method="POST">
            <%
                String incorrectPassword = (String) request.getAttribute("incorrectPassword");
                String incorrectId = (String) request.getAttribute("incorrectId");
            %>
            <table>
                <%
                    if (incorrectId != null){
                %>
                <b><%=incorrectId%></b>
                <%
                    }
                %>
                
                <tr>
                    <td>Student Number:</td>
                    <td><input type="number" name="studNum" required=""/></td>
                </tr>
                <%
                    if (incorrectPassword != null) {
                %>
                <b><%=incorrectPassword%></b>
                <%
                    }
                %>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="LOGIN"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="StudentSignUp.jsp">Sign_Up</a></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="forgotPassword.jsp">forgot password</a>
        </p>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
