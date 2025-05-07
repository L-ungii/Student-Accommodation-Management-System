package za.ac.tut.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="Administrator_TBL")
public class Administrator implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
        private String admin_id;
    
    private String name;
    private String surname;
    private String email;
    private String password;

    public Administrator() {
    }

    public Administrator(String admin_id, String name, String surname, String email, String password) {
        this.admin_id = admin_id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (admin_id != null ? admin_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrator)) {
            return false;
        }
        Administrator other = (Administrator) object;
        if ((this.admin_id == null && other.admin_id != null) || (this.admin_id != null && !this.admin_id.equals(other.admin_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Administrator[ id=" + admin_id + " ]";
    }
    
}
