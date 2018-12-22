package yan1less.front.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import yan1less.front.domain.bloger;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class LoginDao {
    public Long Login(String logname, String logpass) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT count(*) from bloger where username=? and password = ?";
        Long query = (Long)qr.query(sql, new ScalarHandler(), logname, logpass);
        return query;
    }
}
