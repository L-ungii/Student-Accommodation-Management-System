package za.ac.tut.enetities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Application implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    
    private String status;
    private String roomType;
    
    @Temporal(TemporalType.DATE)
        private Date startDate;
    @Temporal(TemporalType.DATE)
        private Date endDate;
    
    private byte[] proofOfFunding;
    private byte[] proofOfReg;
    private Student student;
    private Residence residence;

    public Application() {
    }

    public Application(String status, String roomType, Date startDate, Date endDate, byte[] proofOfFunding, byte[] proofOfReg, Student student, Residence residence) {
        this.status = status;
        this.roomType = roomType;
        this.startDate = startDate;
        this.endDate = endDate;
        this.proofOfFunding = proofOfFunding;
        this.proofOfReg = proofOfReg;
        this.student = student;
        this.residence = residence;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public byte[] getProofOfFunding() {
        return proofOfFunding;
    }

    public void setProofOfFunding(byte[] proofOfFunding) {
        this.proofOfFunding = proofOfFunding;
    }

    public byte[] getProofOfReg() {
        return proofOfReg;
    }

    public void setProofOfReg(byte[] proofOfReg) {
        this.proofOfReg = proofOfReg;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Residence getResidence() {
        return residence;
    }

    public void setResidence(Residence residence) {
        this.residence = residence;
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
        if (!(object instanceof Application)) {
            return false;
        }
        Application other = (Application) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.enetities.Application[ id=" + id + " ]";
    }
    
}
