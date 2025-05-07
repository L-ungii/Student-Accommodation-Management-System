<%-- 
    Document   : viewReservation1
    Created on : 01 May 2025, 22:49:20
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve List Page</title>
    </head>
    <body>
        <h1>Reserved List</h1> <p>
            Click the button below to view the residence you reserved to
        </p>

        <form action="ViewReserveServlet.do" method="GET">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="submit" name="studNum" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="RESERVE ROOM"/></td>
                </tr>
            </table>
        </form>
        <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="index.html">logout</a></li>
        </ul>
    </body>
</html>
