package yan1less.front.web;

import yan1less.front.service.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet",urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String logname = request.getParameter("logname");
        String logpass = request.getParameter("logpass");

        LoginService service = new LoginService();
        Boolean issucceed=false;
        try {
            issucceed =service.Login(logname,logpass);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(issucceed){
            request.getSession().setAttribute("logpass",logpass);

            response.setContentType("test/html;charset=UTF-8");
            response.sendRedirect(request.getContextPath()+"/back/index.jsp");

        }

        else
        {
            response.setContentType("test/html;charset=UTF-8");
            response.sendRedirect(request.getContextPath()+"/main");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
