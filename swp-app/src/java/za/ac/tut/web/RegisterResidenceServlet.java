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
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Residence;

@MultipartConfig
public class RegisterResidenceServlet extends HttpServlet {

    @EJB
    private ResidenceFacadeLocal rfl;
    @EJB
    private AdministratorFacadeLocal afl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String resName = request.getParameter("resName");
        String location = request.getParameter("location");
        Integer capacity = Integer.parseInt(request.getParameter("capacity"));

        Part picPart = request.getPart("resPic");
        InputStream inputStream = picPart.getInputStream();
        byte[] image = convertToBytes(inputStream);

        Administrator adminID = (Administrator)session.getAttribute("admin");
        Integer id = adminID.getAdminNum();
        Administrator admin = afl.find(id);

        Residence res = new Residence(resName, location, capacity, image, admin);
        
        rfl.create(res);

        RequestDispatcher disp = request.getRequestDispatcher("studentMenu.html");
        disp.forward(request, response);
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
