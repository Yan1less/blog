package yan1less.back.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AuthenticateServlet",urlPatterns = "/yanzheng")
//防止随意删除，需要验证身份

public class AuthenticateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String info = request.getParameter("info");
        String tagid = request.getParameter("tagid");

        //验证info信息
        if("19980108".equals(info)){
            //拿到之后再放进去，方便下一个servlet使用
            request.setAttribute("tagidxx",tagid);
            //验证完之后执行或者不执行
            request.getRequestDispatcher("/deletetag").forward(request,response);
        }
        else {
            //跳转到信息验证失败的jsp
            request.getRequestDispatcher("/back/editblog/yanzhengDefeat.jsp").forward(request,response);
        }





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
