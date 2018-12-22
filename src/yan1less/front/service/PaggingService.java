package yan1less.front.service;

import yan1less.front.dao.PaggingDao;
import yan1less.front.domain.PageBean;
import yan1less.front.domain.Text;

import java.sql.SQLException;
import java.util.List;

public class PaggingService {
    public PageBean<Text> findPageBean(int currentPage,int currentCount) throws SQLException {
        PaggingDao dao = new PaggingDao();
        PageBean pageBean = new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalcount = dao.getTotalCount();
        pageBean.setTotalCount(totalcount);
        int totalpage = (int)Math.ceil(1.0*totalcount/currentCount);
        pageBean.setTotalPage(totalpage);
        int index = (currentPage-1)*currentCount;
        List<Text> textList = dao.findTextListByPageBean(index,currentCount);
        pageBean.setTextList(textList);
        for(Text text:textList){
            TextContentReduce(text);
        }
        return pageBean;
    }
    public PageBean<Text> findPageBeanByTag(int currentPage,int currentCount,String tag) throws SQLException {
        PaggingDao dao = new PaggingDao();
        PageBean pageBean = new PageBean();
        pageBean.setCurrentPage(currentPage);
        pageBean.setCurrentCount(currentCount);
        int totalcount = dao.getTotalCountByTag(tag);
        pageBean.setTotalCount(totalcount);
        int totalpage = (int)Math.ceil(1.0*totalcount/currentCount);
        pageBean.setTotalPage(totalpage);
        int index = (currentPage-1)*currentCount;
        List<Text> textList = dao.findTextListByPageBeanAndTag(index,currentCount,tag);
        pageBean.setTextList(textList);
        for(Text text:textList){
            TextContentReduce(text);
        }
        return pageBean;
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
