package yan1less.front.dao;

import org.apache.commons.dbutils.QueryRunner;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import yan1less.front.domain.Text;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class AsynSearchDao {
    public List<Text> AsynSearchByKeyword(String keyboard) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from blogtext where title like ? limit 0,3";
        List<Text> query = qr.query(sql, new BeanListHandler<Text>(Text.class), "%" + keyboard + "%");

        return query;
    }
}
