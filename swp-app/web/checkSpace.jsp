<%-- 
    Document   : checkSpace
    Created on : 08 May 2025, 16:14:27
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>check_Space Page</title>
    </head>
    <body>
        <h1>Check Space</h1>
        <p>
            Enter a residence which you want to view the capacity:
        </p>
        <%
            List<Residence> resList = (List<Residence>) request.getAttribute("resList");
        %>

            <%
                for (int i = 0; i < resList.size(); i++) {
            %>  

            <table>
                <tr>
                    <td>Residence Name:</td>
                    <td><%=resList.get(i).getResName()%></td>
                </tr>
                <tr>
                    <td>Capacity</td>
                    <td><%=resList.get(i).getCapacity()%></td>
                </tr>
            </table>
            <%
                }
            %>
        <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
