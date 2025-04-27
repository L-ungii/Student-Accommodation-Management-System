<%-- 
    Document   : sedibengSpace
    Created on : 27 Apr 2025, 18:13:22
    Author     : maton
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sedibeng Space Check Page</title>
    </head>
    <body>
        <h1>Sedibeng Space Check</h1>
        <p>Click the button below to check space at Sedibeng</p>
        <form action="SedibengSpaceServlet.do" method="GET">
            <table>
                <tr>
                    <td></td>
                    <td><input type="submit" value="CHECK SPACE"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
