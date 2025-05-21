<%-- 
    Document   : cancelRegistrationOutcome
    Created on : 01 May 2025, 20:51:22
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <h2><%= message%></h2>
        <%
        } else {
        %>
        <h2>No message to display.</h2>
        <%
            }
        %>

        <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
