package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.enetities.Administrator;

@MultipartConfig
public class AdminSignUpServlet extends HttpServlet {
    @EJB
        private AdministratorFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        try {
            HttpSession session = request.getSession();
            
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String idNum = request.getParameter("idNum");
            String email = request.getParameter("email");

            Part idCopyPath = request.getPart("idCopy");
            InputStream inputStream = idCopyPath.getInputStream();
            byte[] idCopy = convertToBytes(inputStream);

            Part leaseCopyPath = request.getPart("leaseCopy");
            InputStream inputStream2 = leaseCopyPath.getInputStream();
            byte[] leaseCopy = convertToBytes(inputStream2);

            Part businessLicenseCopyPath = request.getPart("businessLicenseCopy");
            InputStream inputStream3 = businessLicenseCopyPath.getInputStream();
            byte[] licenseCopy = convertToBytes(inputStream3);

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Administrator a = new Administrator(name, surname, idNum, email, idCopy, leaseCopy, licenseCopy, username, password);
            a.setStatus("pending");
            afl.create(a);
            
            session.setAttribute("admin", a);
            RequestDispatcher disp = request.getRequestDispatcher("registerRes.jsp");
            disp.forward(request, response);

        } catch (ServletException | IOException e) {
        }
    }
     private byte[] convertToBytes(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int bytesRead;
        byte[] data = new byte[1024];
        while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }
        return buffer.toByteArray();
     }
}
