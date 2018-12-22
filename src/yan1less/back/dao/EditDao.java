package yan1less.back.dao;

import org.apache.commons.dbutils.QueryRunner;
import yan1less.front.utils.DataSourceUtils;

import java.sql.SQLException;

public class EditDao {
    public int SaveText(String textid,String title, String content,String date) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into blogtext values(?,?,?,?,'55','66')";

        return qr.update(sql,textid,title,content,date);
    }

    public int SaveClassificationByTextid(String textid,String[] tag) throws SQLException {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());

        for(int i=0;i<tag.length;i++) {
            String sql = "insert into tag_text values (null,?,?)";
            qr.update(sql, tag[i], textid);
        }
        //不想判断每一条是否成功了。。
        return 1;
    }
}
