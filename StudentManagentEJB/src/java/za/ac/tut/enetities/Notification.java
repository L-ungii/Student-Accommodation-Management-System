package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Notification implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String message;
    // --- IMPORTANT: ADD THESE ANNOTATIONS ---
    @ManyToOne // Defines a many-to-one relationship (many notifications to one student)
    @JoinColumn(name = "stud_id") // Specifies the actual foreign key column name in the NOTIFICATION table for Student
    private Student stud_id;

    @ManyToOne // Defines a many-to-one relationship (many notifications to one administrator)
    @JoinColumn(name = "admin_id") // Specifies the actual foreign key column name in the NOTIFICATION table for Administrator
    private Administrator admin_id;
    // --- END IMPORTANT ADDITIONS ---
    private String senderName;

    @Temporal(TemporalType.DATE)
    private Date creationDate;

    public Notification() {
    }

    public Notification(String message, Student stud_id, Administrator admin_id, Date creationDate) {
        this.message = message;
        this.stud_id = stud_id;
        this.admin_id = admin_id;
        this.creationDate = creationDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Student getStud_id() {
        return stud_id;
    }

    public void setStud_id(Student stud_id) {
        this.stud_id = stud_id;
    }

    public Administrator getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(Administrator admin_id) {
        this.admin_id = admin_id;
    }

    public String getSenderName() {
        return senderName;
    }

    public void setSenderName(String senderName) {
        this.senderName = senderName;
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
        if (!(object instanceof Notification)) {
            return false;
        }
        Notification other = (Notification) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Notification[ id=" + id + " ]";
    }
    
}
