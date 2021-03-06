package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Student;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor.
     */
    public LoginFilter() {
    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String context_path = ((HttpServletRequest)request).getContextPath();
        String servlet_path = ((HttpServletRequest)request).getServletPath();

        // CSSフォルダ内と基本情報登録は認証処理から除外する
        if(!servlet_path.matches("/css.*") && !servlet_path.matches("/students.new") && !servlet_path.matches("/students.teacher") && !servlet_path.matches("/students.new2")) {

            if(!servlet_path.matches("/students.create") && !servlet_path.matches("/students.create2")){



                    HttpSession session = ((HttpServletRequest)request).getSession();

                    // セッションスコープに保存された従業員（ログインユーザ）情報を取得
                    Student e = (Student)session.getAttribute("login_student");

                    if(!servlet_path.equals("/login")) {        // ログイン画面以外について
                        // ログアウトしている状態であれば
                        // ログイン画面にリダイレクト
                        if(e == null) {
                            ((HttpServletResponse)response).sendRedirect(context_path + "/login");
                            return;
                            }

                        // すべての人が入れるようにする。
                        if(servlet_path.matches("/students.*") && e.getAdmin_flag() == 2) {
                            ((HttpServletResponse)response).sendRedirect(context_path + "/");
                            return;
                            }
                      }else {                                    // ログイン画面について
                         // ログインしているのにログイン画面を表示させようとした場合は
                         // システムのトップページにリダイレクト
                         if(e != null) {
                             ((HttpServletResponse)response).sendRedirect(context_path + "/");
                             return;
                            }
                       }

            }
        }

        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
    }

}