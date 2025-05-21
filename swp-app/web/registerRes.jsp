<%-- 
    Document   : registerRes
    Created on : 28 Apr 2025, 21:01:13
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Residence Page</title>
    </head>
    <body>
        <h1>Register Residence</h1>
        <p>
            Enter the details below to register for a residence:
        </p>
        <form action="RegisterResidenceServlet.do" method="POST" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Name of Residence:</td>
                    <td><input type="text" name ="resName" required=""/></td>
                </tr>
                <tr>
                    <td>Location:</td>
                    <td><input type="text" name ="location" required=""/></td>
                </tr>
                <tr>
                    <td>Capacity:</td>
                    <td><input type="text" name ="capacity" required=""/></td>
                </tr>
                <tr>
                    <td>Upload Residence Picture:</td>
                    <td><input type="file" name ="resPic" required=""/></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="Register Residence"/></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
