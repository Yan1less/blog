package yan1less.back.web;

import yan1less.back.service.BlogListService;
import yan1less.front.domain.Text;
import yan1less.front.domain.Tag;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BlogListServlet",urlPatterns = "/bloglist")
public class BlogListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String tagid = request.getParameter("tagid");
        Tag tag=null;
        List<Text> texts = null;
        BlogListService service = new BlogListService();
        try {
            texts = service.SearchTextByTagid(tagid);
            tag=service.SearchTagByTagid(tagid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //在给域中放入tag的信息
        request.setAttribute("tag",tag);
        request.setAttribute("texts",texts);

        request.getRequestDispatcher("/back/bloglist/bloglist.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
