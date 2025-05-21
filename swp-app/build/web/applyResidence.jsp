<%-- 
    Document   : applyResidence
    Created on : 19 May 2025, 16:38:08
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <body>
        <h1>Registration</h1>
        <p>
            Please fill in the form below to registration for a res
        </p>
        <%
            List<Residence> resList = (List<Residence>) request.getAttribute("resList");
        %>
        <form action="ApplyReidence2.do" method="POST" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><input type="number" name="studNum" required=""/></td>
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
                    <td>Upload proof of Funding:</td>
                    <td><input type="file" name="proofOfFunding" required=""/></td>
                </tr>
                <tr>
                    <td>Upload proof of Registration:</td>
                    <td><input type="file" name="proofOfReg" required=""/></td>
                </tr>
                <tr>
                    <td>Start Date:</td>
                    <td><input type="date" name="startDate" required=""/></td>
                </tr>
                <tr>
                    <td>End Date:</td>
                    <td><input type="date" name="endDate" required=""/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" type="SUBMIT"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
