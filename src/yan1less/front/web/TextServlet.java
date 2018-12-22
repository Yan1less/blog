package yan1less.front.web;

import yan1less.front.domain.Text;
import yan1less.front.service.LoadTagService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "TextServlet",urlPatterns = "/text")
public class TextServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String textid = request.getParameter("Textid");

        LoadTagService service = new LoadTagService();
        Text text=null;
        try {
            text = service.LoadTextById(textid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("currentText",text);
        request.getRequestDispatcher("/front/w1.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request,response);

    }
}
