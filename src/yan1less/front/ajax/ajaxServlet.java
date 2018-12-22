package yan1less.front.ajax;

import com.google.gson.Gson;
import yan1less.front.domain.PageBean;
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

@WebServlet("/ajaxServlet")
public class ajaxServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoadTagService service = new LoadTagService();
        //点击右侧导航栏使左侧数据变化
        //拿到需要搜索的数据
        String TagId = request.getParameter("TagId");

//        List<Text> textList=null;
//        try {
//            textList  = service.LoadTextByTag(TagId);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        //用json发到前台
//        Gson gson = new Gson();
//        String json = gson.toJson(textList);
//        response.setContentType("text/html;charset=UTF-8");
//
//       response.getWriter().write(json);


       //使用pagebean
        PageBean<Text> pageBean=null;
        PaggingService service1 = new PaggingService();
        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr ==null) currentPageStr="1";
        int currentPage = Integer.parseInt(currentPageStr);
        int currentCount=100;
        try {
            pageBean=service1.findPageBeanByTag(currentPage,currentCount,TagId);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Gson gson1 = new Gson();
        String json1 = gson1.toJson(pageBean);
        //System.out.println(json1);
        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().write(json1);
    }
}
