package yan1less.front.service;

import yan1less.front.dao.LoginDao;
import yan1less.front.domain.bloger;

import java.sql.SQLException;

public class LoginService {
    public Boolean Login(String logname, String logpass) throws SQLException {
        LoginDao dao = new LoginDao();
        Long i  = dao.Login(logname, logpass);

        if(i!=0L)
            return true;
        else
            return false;
    }
}
