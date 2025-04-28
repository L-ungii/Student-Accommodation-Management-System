package za.ac.tut.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name="Reservation_TBL")
public class Reservation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
        private String reservation_id;
    
    @Temporal(TemporalType.DATE)
        private Integer reservation_year;
    
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="res_ID", nullable = false)
        private List<Residence> residence;
    
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="room_ID", nullable = false)
        private List<Room> room;
    
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST)
    @JoinColumn(name="studID", nullable = false)
        private List<Student> student;

    public Reservation() {
    }

    public Reservation(Integer reservation_year, List<Residence> residence, List<Room> room, List<Student> student) {
        this.reservation_year = reservation_year;
        this.residence = residence;
        this.room = room;
        this.student = student;
    }
    
    public String getReservation_id() {
        return reservation_id;
    }

    public void setReservation_id(String reservation_id) {
        this.reservation_id = reservation_id;
    }

    public Integer getReservation_year() {
        return reservation_year;
    }

    public void setReservation_year(Integer reservation_year) {
        this.reservation_year = reservation_year;
    }

    public List<Room> getRoom() {
        return room;
    }

    public void setRoom(List<Room> room) {
        this.room = room;
    }

    public List<Residence> getResidence() {
        return residence;
    }

    public void setResidence(List<Residence> residence) {
        this.residence = residence;
    }

    public List<Student> getStudent() {
        return student;
    }

    public void setStudent(List<Student> student) {
        this.student = student;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reservation_id != null ? reservation_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservation)) {
            return false;
        }
        Reservation other = (Reservation) object;
        if ((this.reservation_id == null && other.reservation_id != null) || (this.reservation_id != null && !this.reservation_id.equals(other.reservation_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Reservation[ id=" + reservation_id + " ]";
    }
    
}
