package yan1less.back.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import yan1less.front.domain.Tag;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class LeftDao {
    public List<Tag> searchTag() throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="select * from blogtag";
        return qr.query(sql,new BeanListHandler<Tag>(Tag.class));
    }
}
