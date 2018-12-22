package yan1less.back.service;

import yan1less.back.dao.EditDao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class EditService {
    public Boolean SaveText(String title, String[] tag, String content) throws SQLException {
        EditDao dao = new EditDao();
        String textid = UUID.randomUUID().toString();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = dateFormat.format(new Date());
        int isTextSucceed=dao.SaveText(textid,title,content,date);
        //存储分类信息
        int isClassSucceed =dao.SaveClassificationByTextid(textid,tag);
        if(isClassSucceed==1&&isTextSucceed==1)
            return true;
        else
            return false;

    }
}
