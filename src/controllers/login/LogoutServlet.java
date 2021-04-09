package controllers.login;
//実装済み
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Student;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //追加部分
        HttpSession session = ((HttpServletRequest)request).getSession();

        // セッションスコープに保存された従業員（ログインユーザ）情報を取得
        Student p = (Student)session.getAttribute("login_student");
        if(p.getDelete_flag() == 1) {
            request.getSession().removeAttribute("login_student");
            response.sendRedirect(request.getContextPath() + "/login");
        }else{

        request.getSession().setAttribute("flush", "ログアウトしました。");
        request.getSession().removeAttribute("login_student");
        response.sendRedirect(request.getContextPath() + "/login");
        }
    }

}
