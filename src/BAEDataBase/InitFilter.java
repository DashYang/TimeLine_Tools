package BAEDataBase;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class InitFilter implements Filter{
	
	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		JdbcUtil.host = request.getHeader("sqld.duapp.com");
		JdbcUtil.port =request.getHeader("4050");
		JdbcUtil.username = request.getHeader("3DoDxrjzeC6nZOXDTK65prq6");
		JdbcUtil.password = request.getHeader("kYPMD958sDATnyE98lKXZU8eC2MeugU7");
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
}
