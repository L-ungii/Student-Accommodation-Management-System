<%-- 
    Document   : viewResOutcome
    Created on : 01 May 2025, 20:12:00
    Author     : sambo
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.enetities.Residence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Res Page</title>
    </head>
    <body>
        <h1>View Residence</h1>
        <p>
            Here is the list of residence
        </p>
        <%
            List<Residence> resList = (List<Residence>) request.getAttribute("resList");
        %>

        <table>
            <tr>
                <%
                    for (int i = 0; i < resList.size(); i++) {

                        byte[] photo = resList.get(i).getResidence_Picture();
                        String base64Image = "";

                        if (photo != null && photo.length > 0) {
                            base64Image = Base64.getEncoder().encodeToString(photo);
                        }

                        if (!base64Image.isEmpty()) {
                %>
                <td><img src="data:image/jpeg;base64,<%= base64Image%>" alt="residence Photo" width="150" height="150"/></td>
                    <%
                    } else {
                    %>
            <em>No photo available</em><br>
            <%
                }
            %>
            <td><%=resList.get(i).getResName()%><br/><%=resList.get(i).getLocation()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <ul>
        <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
        <li><a href="LogoutServlet.do">Logout</a></li>
    </ul>
</body>
</html>
