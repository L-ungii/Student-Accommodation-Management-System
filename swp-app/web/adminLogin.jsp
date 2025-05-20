<%-- 
    Document   : adminLogin
    Created on : 28 Apr 2025, 19:53:46
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
    </head>
    <body>
        <h1>Admin Login</h1>
         <p>
            Enter the details below to login
        </p>
        <%
            List<Residence> res = (List<Residence>)request.getAttribute("res");
        %>
        <form action = "AdminLoginServlet.do" method="POST">
            <table>
                <tr>
                    <td>Administrator Number:</td>
                    <td><input type="text" name="adminNum" required=""/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="password" name="password" required=""/></td>
                </tr>
                <tr>
                    <td>Residence Name:</td>
                    
                    <td>
                        <select name ="resName">
                    <%
                        for (Residence r : res) {
                            String resName = r.getResName();
                    %>
                            <option value="<%=resName%>"><%=resName%></option>
                    <%
                        }
                    %>
                        </select>
                    </td>
                   
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="LOGIN"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><a href="AdminSignUp.jsp">Sign_Up</a></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="forgotPasswordAdmin.jsp">forgot password</a>
        </p>
        <p>
            <a href="LogoutServlet.do">Logout</a>
        </p>
    </body>
</html>
