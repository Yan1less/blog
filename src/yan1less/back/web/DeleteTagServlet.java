package yan1less.back.web;

import yan1less.back.service.EditClassService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DeleteTagServlet",urlPatterns = "/deletetag")
public class DeleteTagServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String tagid = (String) request.getAttribute("tagidxx");
        EditClassService service = new EditClassService();
        Boolean issucceed=false;
        try {
            issucceed  = service.DeleteTagByTagid(tagid);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(issucceed)
            request.getRequestDispatcher("/back/editblog/succeed.jsp").forward(request, response);
        else
            request.getRequestDispatcher("/back/editblog/defeat.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
