package yan1less.back.web;

import yan1less.back.service.LeftService;
import yan1less.front.domain.Tag;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "LeftServlet",urlPatterns = "/back")
public class LeftServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        LeftService service = new LeftService();
        List<Tag> tags=null;
        try {
            tags= service.searchTag();
            System.out.println(tags.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //System.out.println(tags.get(0).getTag());
       //request域小了，因为index需要连接其他页面，域中数据会消失，所以用最大的域
        //读取速度有问题
        //System.out.println(tags);
        request.getSession().getServletContext().setAttribute("Sertvlettags",tags);

        request.getRequestDispatcher("/back/index.html").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
