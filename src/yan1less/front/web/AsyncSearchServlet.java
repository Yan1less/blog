package yan1less.front.web;

import com.google.gson.Gson;
import yan1less.front.domain.Text;
import yan1less.front.domain.reduceText;
import yan1less.front.service.AsynSearchService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AsyncSearchServlet",urlPatterns = "/asyncsearch")
//站内异步查找
public class AsyncSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyboard = request.getParameter("keyboard");
        //System.out.println(keyboard);
        AsynSearchService service = new AsynSearchService();
        List<reduceText> texts =null;

        try {
            texts  =service.AsynSearchByKeyword(keyboard);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        Gson gson = new Gson();
        String json = gson.toJson(texts);
        System.out.println(json);
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
