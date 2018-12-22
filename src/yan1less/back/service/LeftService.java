package yan1less.back.service;

import yan1less.back.dao.LeftDao;
import yan1less.front.domain.Tag;

import java.sql.SQLException;
import java.util.List;

public class LeftService {
    public List<Tag> searchTag() throws SQLException {
        LeftDao dao = new LeftDao();
        return dao.searchTag();
    }
}
