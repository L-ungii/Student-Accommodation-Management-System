package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import java.io.Serializable;

@Entity
public class Administrator implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String surname;
    private String id_no;
    private String email;
    private byte[] id_copy;
    private byte[] lic_copy;
    private byte[] busniess_lic;
    private String status;
    private String username;
    private String password;

    public Administrator() {
    }

    public Administrator(String name, String surname, String id_no, String email, byte[] id_copy, byte[] lic_copy, byte[] busniess_lic, String username, String password) {
        this.name = name;
        this.surname = surname;
        this.id_no = id_no;
        this.email = email;
        this.id_copy = id_copy;
        this.lic_copy = lic_copy;
        this.busniess_lic = busniess_lic;
        this.username = username;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getId() {
        return id;
    }

    public String getId_no() {
        return id_no;
    }

    public void setId_no(String id_no) {
        this.id_no = id_no;
    }

    public byte[] getId_copy() {
        return id_copy;
    }

    public void setId_copy(byte[] id_copy) {
        this.id_copy = id_copy;
    }

    public byte[] getLic_copy() {
        return lic_copy;
    }

    public void setLic_copy(byte[] lic_copy) {
        this.lic_copy = lic_copy;
    }

    public byte[] getBusniess_lic() {
        return busniess_lic;
    }

    public void setBusniess_lic(byte[] busniess_lic) {
        this.busniess_lic = busniess_lic;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
        if (!(object instanceof Administrator)) {
            return false;
        }
        Administrator other = (Administrator) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Administrator[ id=" + id + " ]";
    }
    
}
