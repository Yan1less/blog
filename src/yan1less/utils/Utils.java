package yan1less.utils;

import javax.servlet.http.HttpServletRequest;

public class Utils {
    public static String getPath(HttpServletRequest request){
        return request.getContextPath();
    }
}
