<%-- 
    Document   : viewApplicationStud_outcome
    Created on : 20 May 2025, 21:59:37
    Author     : sambo
--%>

<%@page import="java.util.Base64"%>
<%@page import="za.ac.tut.enetities.Application"%>
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
            Application app = (Application) request.getAttribute("app");

            byte[] funding = app.getProofOfFunding();
            String base64Image = "";

            if (funding != null && funding.length > 0) {
                base64Image = Base64.getEncoder().encodeToString(funding);

                byte[] reg = app.getProofOfFunding();
                String Regbase64Image = "";

                if (reg != null && reg.length > 0) {
                    Regbase64Image = Base64.getEncoder().encodeToString(reg);

        %>
        <table>
            <tr>
                <td>Student Number:</td>
                <td><%=app.getStudent().getStudNum()%></td>
                <td><input type="hidden" name="studNum" value="<%=app.getStudent().getStudNum()%>" /></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><%=app.getStudent().getName()%></td>
            </tr>
            <tr>
                <td>Surname:</td>
                <td><%=app.getStudent().getSurname()%></td>
            </tr>
            <tr>
                <td>Room type:</td>
                <td><%=app.getRoomType()%></td>
            </tr>
            <tr>
                <td>Upload proof of Funding:</td>
                <td><a href="data:application/pdf;base64,<%=base64Image%>" download="applicant_funding.pdf">Download Proof of Funding (PDF)</a></td>
            </tr>
            <tr>
                <td>Upload proof of Registration:</td>
                <td><a href="data:application/pdf;base64,<%=Regbase64Image%>" download="applicant_registration.pdf">Download Proof of Registration (PDF)</a></td>
            </tr>
            <tr>
                <td>Start Date:</td>
                <td><%=app.getStartDate()%></td>
            </tr>
            <tr>
                <td>End Date:</td>
                <td><%=app.getEndDate()%></td>
            </tr>
            <tr>
                <td>Application Status:</td>
                <td><%=app.getStatus()%></td>
            </tr>
        </table>
        <ul>
            <li>Click <a href="studentMenu.html">here</a> to return to the main menu</li>
            <li><a href="LogoutServlet.do">Logout</a></li>
        </ul>
        <%
                }
            }
        %>
    </body>
</html>
