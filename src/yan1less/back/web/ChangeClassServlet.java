package yan1less.back.web;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import yan1less.front.domain.Tag;
import yan1less.front.utils.DataSourceUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ChangeClassServlet",urlPatterns = "/change")
//点击编辑按钮时的servlet
public class ChangeClassServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String tagid = request.getParameter("tagid");
        //因为功能很小，我就写在这里了
        String  sql ="select * from blogtag where tagid = ?";
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        Tag tag=null;
        try {
            tag = qr.query(sql, new BeanHandler<Tag>(Tag.class), tagid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("tag",tag);
        request.getRequestDispatcher("/back/editblog/tagEdit.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
