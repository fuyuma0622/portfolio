package controllers.student;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.Student;
import utils.DBUtil;
/**
 * Servlet implementation class StudentFollowServlet
 */
@WebServlet("/students/follow")
public class StudentFollowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentFollowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DBUtil.createEntityManager();

        Student e = (Student)request.getSession().getAttribute("login_student");

        String code = e.getCode();

        Follow g = new Follow();

        Student teacher = em.find(Student.class,Integer.parseInt(code));
        g.setTeacher(teacher);

        Student student = em.find(Student.class,Integer.parseInt(request.getParameter("id")));
        g.setEtudiant(student);

        em.getTransaction().begin();
        em.persist(g);
        em.getTransaction().commit();
        request.getSession().setAttribute("flush", "フォローしました。");
        em.close();

        response.sendRedirect(request.getContextPath() + "/students/index");
    }

}
