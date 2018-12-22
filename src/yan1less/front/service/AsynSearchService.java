package yan1less.front.service;

import yan1less.front.dao.AsynSearchDao;
import yan1less.front.domain.Text;
import yan1less.front.domain.reduceText;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AsynSearchService {
    public List<reduceText> AsynSearchByKeyword(String keyboard) throws SQLException {
        AsynSearchDao dao = new AsynSearchDao();
        List<Text> texts= dao.AsynSearchByKeyword(keyboard);
        //因为查询的是所有，而这里只需要textid和ttile，所以想在这里优化一下

        List<reduceText> rtlist = new ArrayList<reduceText>();
        for(Text text:texts){
            reduceText rt = new reduceText();
            rt.setTextid(text.getTextid());
            rt.setTitle(text.getTitle());
            rtlist.add(rt);

        }


        return rtlist;
    }
}
