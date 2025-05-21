package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import java.io.Serializable;

@Entity
public class Administrator implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private Integer adminNum;
    private String name;
    private String surname;
    private String email;
    private String password;

    public Administrator() {
    }

    public Integer getAdminNum() {
        return adminNum;
    }

    public void setAdminNum(Integer adminNum) {
        this.adminNum = adminNum;
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

    public Administrator(Integer adminNum, String name, String surname, String email, String password) {
        this.adminNum = adminNum;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminNum != null ? adminNum.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Administrator)) {
            return false;
        }
        Administrator other = (Administrator) object;
        if ((this.adminNum == null && other.adminNum != null) || (this.adminNum != null && !this.adminNum.equals(other.adminNum))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Administrator[ id=" + adminNum + " ]";
    }
    
}
