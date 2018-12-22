package yan1less.back.web;

import yan1less.back.service.EditClassService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ChangeTagNameServlet",urlPatterns = "/changetagname")
//点击编辑之后执行的操作
public class ChangeTagNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String newtag = request.getParameter("newtag");
        String tagidstr = request.getParameter("tagid");
        int tagid = Integer.parseInt(tagidstr);

        EditClassService service = new EditClassService();
        Boolean issucceed=false;
        try {
            issucceed =service.ChangeTag(newtag,tagid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(issucceed);
        //我搁这里写一个成功或者失败！
        if(issucceed)
        request.getRequestDispatcher("/back/editblog/succeed.jsp").forward(request, response);
        else
            request.getRequestDispatcher("/back/editblog/defeat.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
