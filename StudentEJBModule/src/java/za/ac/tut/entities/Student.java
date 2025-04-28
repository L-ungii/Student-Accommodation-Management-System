package za.ac.tut.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="Student_TBL")
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
	private String studId;
    
    private String name;
    private String surname;
    private String email;
    private String password;

    public Student() {
    }

    public Student(String studId, String name, String surname, String email, String password) {
        this.studId = studId;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }
	
    public String getStudId() {
        return studId;
    }

    public void setStudId(String studId) {
        this.studId = studId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studId != null ? studId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Student)) {
            return false;
        }
        Student other = (Student) object;
        if ((this.studId == null && other.studId != null) || (this.studId != null && !this.studId.equals(other.studId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Student[ id=" + studId + " ]";
    }
    
}
