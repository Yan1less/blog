package yan1less.back.service;

import yan1less.back.dao.BlogListDao;
import yan1less.front.domain.Tag;
import yan1less.front.domain.Text;

import java.sql.SQLException;
import java.util.List;

public class BlogListService {
    public List<Text> SearchTextByTagid(String tagid) throws SQLException {
        BlogListDao dao = new BlogListDao();
        List<Text> texts= dao.SearchTextByTagid(tagid);
        for(Text text:texts)
        {
            TextContentReduce(text);
        }
        return texts;
    }

    public Tag SearchTagByTagid(String tagid) throws SQLException {
        BlogListDao dao = new BlogListDao();
        return dao.SearchTagByTagid(tagid);
    }
    public Text TextContentReduce(Text text){
        String content = text.getContent();
        if(content.length()>40){
            content = content.substring(0, 40);
            content+="  .........";
            text.setContent(content);
        }
        return text;
    }
}
