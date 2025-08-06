<%-- 
    Document   : viewApplication_Outcome
    Created on : 19 May 2025, 18:44:05
    Author     : sambo
--%>

<%@page import="java.util.Base64"%>
<%@page import="za.ac.tut.enetities.Application"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Application Page</title>
    </head>
    <body>
        <h1>View Application</h1>
        <%
            List<Application> appList = (List<Application>) request.getAttribute("appList");

            for (int i = 0; i < appList.size(); i++) {

                byte[] funding = appList.get(i).getProofOfFunding();
                String base64Image = "";

                if (funding != null && funding.length > 0) {
                    base64Image = Base64.getEncoder().encodeToString(funding);

                    byte[] reg = appList.get(i).getProofOfFunding();
                    String Regbase64Image = "";

                    if (reg != null && reg.length > 0) {
                        Regbase64Image = Base64.getEncoder().encodeToString(reg);

        %>
        <form action="ApplicationServlet.do" method="POST">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><%=appList.get(i).getStudent().getStudNum()%></td>
                    <td><input type="hidden" name="studNum" value="<%=appList.get(i).getStudent().getStudNum()%>" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><%=appList.get(i).getStudent().getName()%></td>
                </tr>
                <tr>
                    <td>Surname:</td>
                    <td><%=appList.get(i).getStudent().getSurname()%></td>
                </tr>
                <tr>
                    <td>Room type:</td>
                    <td><%=appList.get(i).getRoomType()%></td>
                </tr>
                <tr>
                    <td>Upload proof of Funding:</td>
                    <td><a href="data:application/pdf;base64,<%=base64Image%>" download="applicant_funding.pdf">Download Proof of Funding (PDF)</a></td>
                    <td><a href="mailto:<%=appList.get(i).getStudent().getEmail()%>">email</a></td>
                </tr>
                <tr>
                    <td>Upload proof of Registration:</td>
                    <td><a href="data:application/pdf;base64,<%=Regbase64Image%>" download="applicant_registration.pdf">Download Proof of Registration (PDF)</a></td>
                    <td><a href="mailto:<%=appList.get(i).getStudent().getEmail()%>">email</a></td>
                </tr>
                <tr>
                    <td>Start Date:</td>
                    <td><%=appList.get(i).getStartDate()%></td>
                </tr>
                <tr>
                    <td>End Date:</td>
                    <td><%=appList.get(i).getEndDate()%></td>
                </tr>
                <tr>
                    <td>Application Status:</td>
                    <td>
                        <select name="status">
                            <option value="pending">Pending</option>
                            <option value="approved">Approved</option>
                            <option value="decline">Decline</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="SUBMIT"></td>
                </tr>
                <tr></tr>
            </table>
        </form>
        <%
                    }
                }
            }
        %>
    </body>
</html>
