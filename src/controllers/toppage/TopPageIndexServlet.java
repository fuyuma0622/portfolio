package controllers.toppage;
//実装済み
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Report;
import models.Student;
import utils.DBUtil;

/**
 * Servlet implementation class TopPageIndexServlet
 */
@WebServlet("/index.html")
public class TopPageIndexServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopPageIndexServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Student login_student = (Student)request.getSession().getAttribute("login_student");

        Student mynumber = em.find(Student.class,(login_student.getId()));

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }

        List<Report> reports = em.createNamedQuery("getMyAllReports", Report.class)
                                  .setParameter("student", login_student)
                                  .setFirstResult(15 * (page - 1))
                                  .setMaxResults(15)
                                  .getResultList();

        List<Report> follow_reports = em.createNamedQuery("getfavoriteReports", Report.class)
                                          .setParameter("teacher", mynumber)
                                          .setFirstResult(15 * (page - 1))
                                          .setMaxResults(15)
                                          .getResultList();


        long reports_count = (long)em.createNamedQuery("getMyReportsCount", Long.class)
                                     .setParameter("student", login_student)
                                     .getSingleResult();

        long follow_reports_count =(long)em.createNamedQuery("getfavoriteReportsCount", Long.class)
                                            .setParameter("teacher", mynumber)
                                            .getSingleResult();

        em.close();

        request.setAttribute("reports", reports);
        request.setAttribute("follow_reports", follow_reports);
        request.setAttribute("reports_count", reports_count);
        request.setAttribute("follow_reports_count",follow_reports_count);
        request.setAttribute("page", page);

        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/topPage/index.jsp");
        rd.forward(request, response);
    }

}
