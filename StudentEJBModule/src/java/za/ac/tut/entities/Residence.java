package za.ac.tut.entities;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name="Residence_TBL")
public class Residence implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
        private String res_id;
    
    private String location;
    private Integer capacity;
    
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="admin_ID", nullable = false)
        private List<Administrator> admin;
    
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="studID", nullable = false)
        private List<Student> student;

    public Residence() {
    }

    public Residence(String location, Integer capacity, List<Administrator> admin, List<Student> student) {
        this.location = location;
        this.capacity = capacity;
        this.admin = admin;
        this.student = student;
    }
    
    public String getRes_id() {
        return res_id;
    }

    public void setRes_id(String res_id) {
        this.res_id = res_id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public List<Administrator> getAdmin() {
        return admin;
    }

    public void setAdmin(List<Administrator> admin) {
        this.admin = admin;
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
        hash += (res_id != null ? res_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Residence)) {
            return false;
        }
        Residence other = (Residence) object;
        if ((this.res_id == null && other.res_id != null) || (this.res_id != null && !this.res_id.equals(other.res_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Residence[ id=" + res_id + " ]";
    }
    
}
