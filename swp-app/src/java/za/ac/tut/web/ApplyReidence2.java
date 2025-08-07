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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

@MultipartConfig
public class ApplyReidence2 extends HttpServlet {
    @EJB 
        private ApplicationFacadeLocal afl;
    @EJB
        private StudentFacadeLocal sfl;
    @EJB 
        private ResidenceFacadeLocal resfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Student stud = (Student)session.getAttribute("stud");
            
            String roomType = request.getParameter("roomType");
            String resName = request.getParameter("resName");
            
            Residence res = resfl.findWithName(resName);
            
            String strStartDate = request.getParameter("startDate");
            String strEndDate = request.getParameter("endDate");
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
            Date startDate = sdf.parse(strStartDate);
            
            Date endDate = sdf.parse(strEndDate);
            
            Part fundingFile = request.getPart("proofOfFunding");
            InputStream inputStream = fundingFile.getInputStream();
            byte[] proofOfFunding = convertToBytes(inputStream);
            
            Part RegistationFile = request.getPart("proofOfReg");
            inputStream = RegistationFile.getInputStream();
            byte[] proofOfReg = convertToBytes(inputStream);
        
        Application app = new Application("pending",roomType, startDate, endDate, proofOfFunding, proofOfReg, stud, res);
        
        afl.create(app);
        
        
        RequestDispatcher disp = request.getRequestDispatcher("applyRes_outcome.jsp");
        disp.forward(request, response);

            
        } catch (ParseException ex) {
            Logger.getLogger(ApplyReidence2.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     private byte[] convertToBytes( InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int bytesRead;
        byte[] data = new byte[1024];
        while ((bytesRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, bytesRead);
        }
        return buffer.toByteArray();
     }

}
