<%-- 
    Document   : reserveRoom
    Created on : 27 Apr 2025, 19:46:53
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve Room Page</title>
    </head>
    <body>
        <h1>Reserve Room</h1>

        <p>
            Enter the details below to reserve a room:
        </p>
        <%
            List<Residence> resList = (List<Residence>) request.getAttribute("resList");
        %>

        <form action="ReseveRoomServlet2.do" method="POST">
            <table>
                <tr>
                    <td>Student Number: </td>
                    <td><input type="number" name="studNum"></td>
                </tr>
                <tr>
                    <td>Room type:</td>
                    <td>
                        <select name="roomType">
                            <option value="Single">Single</option>
                            <option value="Double">Double</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Residence Name:</td>
                    <td>
                        <select name="resName">
                            <option>choose option</option>
                            <%
                                for (int i = 0; i < resList.size(); i++) {
                            %>  

                            <option value="<%=resList.get(i).getResName()%>"><%=resList.get(i).getResName()%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Reservation Year:</td>
                    <td><input type="text" name="reservation_year"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" type="SUBMIT"/></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
