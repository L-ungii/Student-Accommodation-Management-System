package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.io.Serializable;
import java.util.List;

@Entity
public class Reservation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String roomType;
    private Integer reservation_year;
    private List<Residence> residence;
    private List<Student> student;

    public Reservation() {
    }

    public Reservation(String roomType, Integer reservation_year, List<Residence> residence, List<Student> student) {
        this.roomType = roomType;
        this.reservation_year = reservation_year;
        this.residence = residence;
        this.student = student;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getReservation_year() {
        return reservation_year;
    }

    public void setReservation_year(Integer reservation_year) {
        this.reservation_year = reservation_year;
    }

    public List<Residence> getResidence() {
        return residence;
    }

    public void setResidence(List<Residence> residence) {
        this.residence = residence;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
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
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservation)) {
            return false;
        }
        Reservation other = (Reservation) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Reservation[ id=" + id + " ]";
    }
    
}
