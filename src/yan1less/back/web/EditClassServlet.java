package yan1less.back.web;

import yan1less.back.service.EditClassService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddClassServlet",urlPatterns = "/editclass")
public class EditClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //添加内容
        String tag = request.getParameter("newtag");
        EditClassService service = new EditClassService();
        boolean issucceed = false;
        try {
            issucceed= service.SaveNewTag(tag);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(issucceed) {
            request.setAttribute("error","添加成功");
            try {
                Thread.sleep(500);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            //跳到后台主页面
            request.getRequestDispatcher("/back").forward(request, response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
