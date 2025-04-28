<%-- 
    Document   : reserveRoom
    Created on : 27 Apr 2025, 19:46:53
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
        <h1>Reserve Room</h1>
        
        <p>
            Enter the details below to reserve a room:
        </p>
        
        <form action="" method="POST">
            <table>
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
                    <td>Location:</td>
                    <td>
                        <select name="location">
                            <option>choose option</option>
                            <option value="KSL Student Accommodation">KSL Student Accommodation</option>
                            <option value="Kilimanjaro">Kilimanjaro</option>
                            <option value="The landing">The landing</option>
                            <option value="ZanderQ Heights">ZanderQ Heights</option>
                            <option value="laJazz">laJazz</option>
                            <option value="Miami">Miami</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Year:</td>
                    <td><input type="text" name="reservation_year"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" type="SUBMIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
