package yan1less.back.web;

import yan1less.back.service.EditService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Map;

@WebServlet(name = "EditServlet",urlPatterns = "/edit")
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String[] tag = request.getParameterValues("tag");

        String content = request.getParameter("content");
        EditService service = new EditService();
        Boolean isSucceed=false;
        try {
            isSucceed= service.SaveText(title,tag,content);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if(isSucceed)
            request.getRequestDispatcher("/back/index.html").forward(request,response);
        else
            request.getRequestDispatcher("defeat").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
