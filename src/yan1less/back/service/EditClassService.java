package yan1less.back.service;

import yan1less.back.dao.EditClassDao;

import java.sql.SQLException;

public class EditClassService {
    public boolean SaveNewTag(String tag) throws SQLException {
        EditClassDao dao = new EditClassDao();
        int i = dao.SaveNewTag(tag);
        if(i==1)
            return true;
        else
            return false;
    }

    public Boolean ChangeTag(String newtag,int tagid) throws SQLException {
        EditClassDao dao = new EditClassDao();
        int i =dao.ChangeTag(newtag,tagid);
        if(i==1)
            return true;
        else
            return false;
    }

    public Boolean DeleteTagByTagid(String tagidstr) throws SQLException {
        EditClassDao dao = new EditClassDao();
        int tagid = Integer.parseInt(tagidstr);
        int i =dao.DeleteTagByTagid(tagid);
        if(i!=0)
            return true;
        else
            return false;
    }
}
