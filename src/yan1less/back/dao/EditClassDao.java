package yan1less.back.dao;

import org.apache.commons.dbutils.QueryRunner;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;

public class EditClassDao {
    public int SaveNewTag(String tag) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql="insert into blogtag values(null,?,null)";
        return qr.update(sql,tag);
    }

    public int ChangeTag(String newtag,int tagid) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update blogtag set tag=? where tagid = ?";
        return  qr.update(sql,newtag,tagid);
    }

    public int DeleteTagByTagid(int tagid) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from blogtag where tagid = ?";
        return qr.update(sql,tagid);
    }
}
