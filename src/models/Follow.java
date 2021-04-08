package models;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "follows3")
@NamedQueries({
    @NamedQuery(
        name = "removeFollow",
        query = "SELECT f FROM Follow AS f WHERE f.teacher = :teacher AND f.etudiant = :etudiant"
    )


})
@Entity
public class Follow {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student teacher;

    @ManyToOne
    @JoinColumn(name = "student_id2", nullable = false)
    private Student etudiant;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Student getTeacher() {
        return teacher;
    }

    public void setTeacher(Student teacher) {
        this.teacher = teacher;
    }

    public Student getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Student etudiant) {
        this.etudiant = etudiant;
    }


}
