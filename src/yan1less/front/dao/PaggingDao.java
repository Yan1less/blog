package yan1less.front.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import yan1less.front.domain.Text;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class PaggingDao {

    public int getTotalCount() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from blogtext";
        Long query = (Long) qr.query(sql, new ScalarHandler());
        return query.intValue();
    }

    public List<Text> findTextListByPageBean(int index, int currentCount) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from blogtext limit ?,?";

        List<Text> query = qr.query(sql, new BeanListHandler<Text>(Text.class), index, currentCount);
        return query;
    }

    public List<Text> findTextListByPageBeanAndTag(int index, int currentCount, String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * from blogtext where textid=any(\n" +
                "SELECT text_id from tag_text where tag_id=?) limit ?,?";
        List<Text> query = qr.query(sql, new BeanListHandler<Text>(Text.class), tag, index, currentCount);
        return query;
    }
    public int getTotalCountByTag(String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT count(*) from blogtext where textid=any(\n" +
                " SELECT text_id from tag_text where tag_id=?)";
        Long query = (Long) qr.query(sql, new ScalarHandler(),tag);
        return query.intValue();
    }
}
