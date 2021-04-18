package controllers.student;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Student;
import utils.DBUtil;

/**
 * Servlet implementation class EmployeesEditServlet
 */
@WebServlet("/students/edit2")
public class StudentsEditServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentsEditServlet2() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Student e = em.find(Student.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("student", e);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("student_id", e.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/students/edit2.jsp");
        rd.forward(request, response);
    }

}
