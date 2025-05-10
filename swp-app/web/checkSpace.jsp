<%-- 
    Document   : checkSpace
    Created on : 08 May 2025, 16:14:27
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>check_Space Page</title>
    </head>
    <body>
        <h1>Check Space</h1>
        <p>
            Enter a residence which you want to view the capacity:
        </p>
        <%
            List<Residence> resList = (List<Residence>) request.getAttribute("resList");
        %>

        <form action="CheckSpaceServlet2.do" method="POST">
            <table>
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
                    <td></td>
                    <td><input type="submit" type="SUBMIT"/></td>
                </tr>
            </table>
        </form>
        <p>
            <a href="index.html">logout</a>
        </p>
    </body>
</html>
