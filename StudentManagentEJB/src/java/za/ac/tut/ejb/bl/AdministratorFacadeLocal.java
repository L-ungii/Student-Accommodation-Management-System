/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.enetities.Administrator;

/**
 *
 * @author sambo
 */
@Local
public interface AdministratorFacadeLocal {

    void create(Administrator administrator);

    void edit(Administrator administrator);

    void remove(Administrator administrator);

    Administrator find(Object id);
    
    Administrator findUsername(String username);

    Administrator findWithAdminNum(String adminNum);
    
    List<Administrator> findAll();

    List<Administrator> findRange(int[] range);

    int count();
    
}
