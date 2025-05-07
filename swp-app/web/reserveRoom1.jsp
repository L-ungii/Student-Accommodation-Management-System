<%-- 
    Document   : reserveRoom1
    Created on : 01 May 2025, 21:07:03
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reserve Room Page</title>
    </head>
    <body>
        <h1>Reserve Room</h1> <p>
            Click the button below to reserve a room
        </p>

        <form action="ReserveRoomServlet.do" method="GET">
            <table>
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
