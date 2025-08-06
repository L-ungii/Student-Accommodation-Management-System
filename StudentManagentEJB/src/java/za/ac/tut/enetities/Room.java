package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import java.io.Serializable;

@Entity
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String status;
    private String roomType;
    private String room_Num;
    @ManyToOne
    @JoinColumn(name = "stud_num")
    private Student stud_Num;
    private Residence res_id;

    public Room() {
    }

    public Room(String status, String roomType, String room_Num, Student studNum, Residence res_id) {
        this.status = status;
        this.roomType = roomType;
        this.room_Num = room_Num;
        this.stud_Num = studNum;
        this.res_id = res_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public String getRoom_Num() {
        return room_Num;
    }

    public void setRoom_Num(String room_Num) {
        this.room_Num = room_Num;
    }

    public Residence getRes_id() {
        return res_id;
    }

    public void setRes_id(Residence res_id) {
        this.res_id = res_id;
    }

    public Student getStudNum() {
        return stud_Num;
    }

    public void setStudNum(Student studNum) {
        this.stud_Num = studNum;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Room)) {
            return false;
        }
        Room other = (Room) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Room[ id=" + id + " ]";
    }

}
