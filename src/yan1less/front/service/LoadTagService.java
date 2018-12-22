package yan1less.front.service;


import yan1less.front.dao.LoadTagDao;
import yan1less.front.domain.Tag;
import yan1less.front.domain.Text;

import java.sql.SQLException;
import java.util.List;

public class LoadTagService {
    public List<Tag> LoadTag() throws SQLException {
        LoadTagDao dao = new LoadTagDao();
        List<Tag> tags = dao.LoadTag();
        return tags;
    }
    public List<Text> LoadText() throws SQLException {
        LoadTagDao dao = new LoadTagDao();
        List<Text> texts = dao.LoadText();
        for(Text text:texts){
            TextContentReduce(text);
        }

        return texts;
    }
    public List<Text> LoadTextByTag(String tag) throws SQLException{
        LoadTagDao dao = new LoadTagDao();
        return dao.LoadTextTitle(tag);
    }
    public Text LoadTextById(String textid) throws SQLException {
        LoadTagDao dao = new LoadTagDao();
        return dao.LoadTextById(textid);
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
