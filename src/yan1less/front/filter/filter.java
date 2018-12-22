package yan1less.front.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class filter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request =(HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;

        Object logpass=   request.getSession().getAttribute("logpass");
        if(logpass!=null) {
            if (logpass != "1")
                filterChain.doFilter(request, response);
        }
        else
            response.sendRedirect("/main");

    }

    @Override
    public void destroy() {

    }
}
