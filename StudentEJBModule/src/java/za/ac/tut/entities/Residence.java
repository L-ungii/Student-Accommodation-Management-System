package za.ac.tut.entities;

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
@Table(name="Residence_TBL")
public class Residence implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
        private Integer res_id;
    
    private String resName;
    private String location;
    private Integer capacity;
    private byte [] residence_Picture;
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="admin_fk", nullable = true)
        private Administrator admin;

    public Residence() {
    }

    public Residence(String resName, String location, Integer capacity, byte[] residence_Picture, Administrator admin) {
        this.resName = resName;
        this.location = location;
        this.capacity = capacity;
        this.residence_Picture = residence_Picture;
        this.admin = admin;
    }

    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName;
    }
    
    public Integer getRes_id() {
        return res_id;
    }

    public void setRes_id(Integer res_id) {
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

    public byte[] getResidence_Picture() {
        return residence_Picture;
    }

    public void setResidence_Picture(byte[] residence_Picture) {
        this.residence_Picture = residence_Picture;
    }

    public Administrator getAdmin() {
        return admin;
    }

    public void setAdmin(Administrator admin) {
        this.admin = admin;
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
