package yan1less.back.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import yan1less.front.domain.Tag;
import yan1less.front.domain.Text;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class BlogListDao {
    public List<Text> SearchTextByTagid(String tagid) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * from blogtext where textid=any(\n" +
                "SELECT text_id from tag_text where tag_id=?)";
        return qr.query(sql,new BeanListHandler<Text>(Text.class),tagid);

    }

    public Tag SearchTagByTagid(String tagid) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from blogtag where tagid=?";
        return qr.query(sql,new BeanHandler<Tag>(Tag.class),tagid);
    }
}
