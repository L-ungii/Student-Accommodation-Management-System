/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.entities.Residence;

/**
 *
 * @author sambo
 */
@Local
public interface ResidenceFacadeLocal {

    void create(Residence residence);

    void edit(Residence residence);

    void remove(Residence residence);

    Residence find(Object id);

    List<Residence> findAll();

    List<Residence> findRange(int[] range);

    int count();
    
}
