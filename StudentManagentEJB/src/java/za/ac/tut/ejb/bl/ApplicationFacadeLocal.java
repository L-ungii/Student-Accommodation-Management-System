/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

/**
 *
 * @author sambo
 */
@Local
public interface ApplicationFacadeLocal {

    void create(Application application);

    void edit(Application application);

    void remove(Application application);

    Application find(Object id);
    
    Application findWithStud(Student studNum);
    
    Residence findWithApp(Object id);
    
    List<Application> finAllStud(Student studNum);
    
    List<Student> findApproved();

    List<Application> findAll();
    
    List<Application> findWithResName(Residence res);

    List<Application> findRange(int[] range);

    int count();
    
}
