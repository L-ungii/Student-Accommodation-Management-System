<%-- 
    Document   : studentsPerResidence
    Created on : 19 May 2025, 11:11:12
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Reservation"%>
<%@page import="za.ac.tut.enetities.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Page</title>
    </head>
    <body>
        <h1>List of Students Reserved</h1>
        <%

            List<Reservation> registerd = (List<Reservation>) request.getAttribute("registerd");

            if (registerd != null && !registerd.isEmpty()) {
                for (Reservation app : registerd) {
                
                    List<Student> student = app.getStudent();
                    for (Student elem : student) {
        %>
        <p>
            Student Number: <%=elem.getStudNum()%><br>
            Name: <%= elem.getName()%> <%= elem.getSurname()%><br>
            Year: <%=app.getReservation_year()%><br>
            Room Type: <%=app.getRoomType()%><br>
        </p>
        <hr>
        <%  }
        %>

        <%
            }
        } else {
        %>
        <p>No students have reserved this residence yet.</p>

        <%}%>  
        <ul>
            <li>Click <a href="adminMenu.html">here</a> to return to the main menu</li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
    </body>
</html>
