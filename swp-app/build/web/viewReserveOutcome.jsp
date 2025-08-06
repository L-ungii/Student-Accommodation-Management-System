<%-- 
    Document   : viewReserveOutcome
    Created on : 02 May 2025, 00:33:37
    Author     : sambo
--%>

<%@page import="java.util.List"%>
<%@page import="za.ac.tut.enetities.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View_Reserve_Outcome Page</title>
    </head>
    <body>
        <h1>View Reserve Outcome</h1>
        <p>
            Here is the list of residence you reserved to:
        </p>
        <%
            List<Reservation> reservations = (List<Reservation>) request.getAttribute("resveredList");
        if (reservations == null || reservations.isEmpty()) {
    %>
            <p>You have no reservations.</p>
    <%
        } else {
            for (Reservation res : reservations) {
    %>
                <div>
                    <p><strong>Room Type:</strong> <%= res.getRoomType() %></p>
                    <p><strong>Residence name:</strong> <%= res.getResidence().get(0).getResName()%></p>
                    <p><strong>Location:</strong> <%= res.getResidence().get(0).getLocation()%></p>
                    <p><strong>Year:</strong> <%= res.getReservation_year() %></p>
                </div>
                <hr/>
    <%
            }
        }
    %>
    <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
