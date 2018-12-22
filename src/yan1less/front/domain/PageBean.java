package yan1less.front.domain;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
    private int currentPage;
    private int currentCount;
    private int totalPage;
    private int totalCount;
    private List<T> textList = new ArrayList<T>();

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public List<T> getTextList() {
        return textList;
    }

    public void setTextList(List<T> textList) {
        this.textList = textList;
    }
}
