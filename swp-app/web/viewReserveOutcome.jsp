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
            List<Reservation> resList = (List<Reservation>) request.getAttribute("resveredList");
        %>
        <table>
            <tr>
                <td>q</td>
                <td></td>
            </tr>
        </table>
    </body>
</html>
