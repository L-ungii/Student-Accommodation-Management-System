package za.ac.tut.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="Application_TBL")
public class Application implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
        private String application_id;
    
    private String status;
    private String roomType;
    
    @Temporal(TemporalType.DATE)
        private Date startDate;
    @Temporal(TemporalType.DATE)
        private Date endDate;
    
    private Byte[] proofOfFunding;
    private Byte[] proofOfReg;
    
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="student_fk", nullable = false)
        private Student student;
    
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name="residence_fk", nullable = false)
        private List<Residence> residence;

    public Application() {
    }

    public Application(String status, String roomType, Date startDate, Date endDate, Byte[] proofOfFunding, Byte[] proofOfReg, Student student, List<Residence> residence) {
        this.status = status;
        this.roomType = roomType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.proofOfFunding = proofOfFunding;
        this.proofOfReg = proofOfReg;
        this.student = student;
        this.residence = residence;
    }
    
    public String getApplication_id() {
        return application_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Byte[] getProofOfFunding() {
        return proofOfFunding;
    }

    public void setProofOfFunding(Byte[] proofOfFunding) {
        this.proofOfFunding = proofOfFunding;
    }

    public Byte[] getProofOfReg() {
        return proofOfReg;
    }

    public void setProofOfReg(Byte[] proofOfReg) {
        this.proofOfReg = proofOfReg;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<Residence> getResidence() {
        return residence;
    }

    public void setResidence(List<Residence> residence) {
        this.residence = residence;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (application_id != null ? application_id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Application)) {
            return false;
        }
        Application other = (Application) object;
        if ((this.application_id == null && other.application_id != null) || (this.application_id != null && !this.application_id.equals(other.application_id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Application[ id=" + application_id + " ]";
    }
    
}
