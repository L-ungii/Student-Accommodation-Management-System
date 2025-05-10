<%-- 
    Document   : checkSpace2
    Created on : 08 May 2025, 20:56:07
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>check_Space Page</title>
    </head>
    <body>
        <h1>Check Space</h1>
        <%
            String resName = (String)request.getAttribute("resName");
            Integer capacity = (Integer)request.getAttribute("capacity");
        %>
        <p>
            <b><%=resName%></b> has <b><%=capacity%></b> rooms available
        </p>
        <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="index.html">logout</a></li>
        </ul>
    </body>
</html>
