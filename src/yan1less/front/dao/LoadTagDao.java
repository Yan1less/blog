package yan1less.front.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import yan1less.front.domain.Tag;
import yan1less.front.domain.Text;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class LoadTagDao {
    public List<Tag> LoadTag() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from blogtag";
        List<Tag> tags = qr.query(sql, new BeanListHandler<Tag>(Tag.class));
        return tags;
    }
    public List<Text> LoadText() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from blogtext";
        List<Text> texts = qr.query(sql, new BeanListHandler<Text>(Text.class));
        return texts;
    }

    public List<Text> LoadTextTitle(String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * from blogtext where textid=any(\n" +
                "SELECT text_id from tag_text where tag_id=?)";
        return qr.query(sql,new BeanListHandler<Text>(Text.class),tag);
    }

    public Text LoadTextById(String textid) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from blogtext where textid = ?";
        return qr.query(sql,new BeanHandler<Text>(Text.class),textid);
    }
}
