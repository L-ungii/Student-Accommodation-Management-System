package za.ac.tut.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="Room_TBL")
public class Room implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
        private String room_id;
    
    private String status;
    private String roomType;
    private String room_Num;
    
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinColumn(name="res_id", nullable = false)
        private Residence res_id;

    public Room() {
        
    }

    public Room(String status, String roomType, String room_Num, Residence res_id) {
        this.status = status;
        this.roomType = roomType;
        this.room_Num = room_Num;
        this.res_id = res_id;
    }
    
    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Residence getRes_id() {
        return res_id;
    }

    public void setRes_id(Residence res_id) {
        this.res_id = res_id;
    }
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (room_id != null ? room_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Room)) {
            return false;
        }
        Room other = (Room) object;
        if ((this.room_id == null && other.room_id != null) || (this.room_id != null && !this.room_id.equals(other.room_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Room[ id=" + room_id + " ]";
    }
    
}
