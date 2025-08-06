package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.io.Serializable;

@Entity
public class Residence implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
     private String resName;
    private String location;
    private Integer capacity;
    private byte [] residence_Picture;
    private String insta;
    private String tiktok;
    private Administrator admin;

    public Residence() {
    }

    public Residence(String resName, String location, Integer capacity, byte[] residence_Picture, String insta, String tiktok, Administrator admin) {
        this.resName = resName;
        this.location = location;
        this.capacity = capacity;
        this.residence_Picture = residence_Picture;
        this.insta = insta;
        this.tiktok = tiktok;
        this.admin = admin;
    }

    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName;
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
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInsta() {
        return insta;
    }

    public void setInsta(String insta) {
        this.insta = insta;
    }

    public String getTiktok() {
        return tiktok;
    }

    public void setTiktok(String tiktok) {
        this.tiktok = tiktok;
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
        if (!(object instanceof Residence)) {
            return false;
        }
        Residence other = (Residence) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Residence[ id=" + id + " ]";
    }
    
}
