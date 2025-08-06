/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Room;
import za.ac.tut.enetities.Student;

/**
 *
 * @author sambo
 */
@Local
public interface RoomFacadeLocal {

    void create(Room room);

    void edit(Room room);

    void remove(Room room);

    Room find(Object id);
    
    Room findByStudent(Student stud);

    List<Room> findAll();
    
    List<Room> findByResidence(Residence res);

    List<Room> findRange(int[] range);

    int count();
    
}
