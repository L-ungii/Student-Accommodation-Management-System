<%-- 
    Document   : viewRes
    Created on : 01 May 2025, 19:59:38
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Res Page</title>
    </head>
    <body>
        <h1>View Residence</h1>
        <p>
            Click the button below to view the res
        </p>

        <form action="ViewResServlet.do" method="GET">
            <table>
                <tr>
                    <td></td>
                    <td><input type="submit" value="VIEW RES"</td>
                </tr>
            </table>
        </form>
        <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="LogoutServlet.dol">Logout</a></li>
        </ul>
    </body>
</html>
