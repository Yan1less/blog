package yan1less.front.web;

import yan1less.front.domain.PageBean;
import yan1less.front.domain.Tag;
import yan1less.front.domain.Text;

import yan1less.front.service.LoadTagService;
import yan1less.front.service.PaggingService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "TravellerServlet",urlPatterns = "/main")
public class TravellerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //返回导航栏里的东西
        request.setCharacterEncoding("UTF-8");
        LoadTagService service = new LoadTagService();

        List<Tag> tags=null;
       // List<Text> texts=null;

        try {
            tags  = service.LoadTag();
           // texts = service.LoadText();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("tags",tags);
        request.getSession().getServletContext().setAttribute("Sertvlettags",tags);
        //request.setAttribute("texts",texts);
       // System.out.println(texts.get(8).getContent());

        //分页操作
        PaggingService service1 = new PaggingService();
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr ==null) currentPageStr="1";
        int currentPage = Integer.parseInt(currentPageStr);
        int currentCount=6;
        PageBean<Text> pageBean=null;
        try {

            pageBean = service1.findPageBean(currentPage, currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }



        request.setAttribute("pageBean",pageBean);

        request.getRequestDispatcher("/front/index.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
