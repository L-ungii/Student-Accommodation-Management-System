<%-- 
    Document   : checkSpaceAmin
    Created on : 20 May 2025, 20:18:15
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Space Page</title>
    </head>
    <body>
        <h1>Check Space</h1>
            <%
                String resName = (String) request.getAttribute("resName");
                Integer capacity = (Integer) request.getAttribute("capacity");
            %>
            
                <b><%=resName%></b> has <b><%=capacity%></b> rooms available
            <ul>
                <li><a href="adminMenu.html">Return to Main Menu</a></li>
                <li><a href="LogoutServlet.do">Logout</a></li>
            </ul>
    </body>
</html>
