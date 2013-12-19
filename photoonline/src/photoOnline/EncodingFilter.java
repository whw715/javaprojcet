package photoOnline;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter{
    String encoding=null;
    FilterConfig filterConfig=null;
    //销毁方法
	public void destroy() {
		this.encoding=null;
		this.filterConfig=null;
	}
    //过滤出来方法
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		if(encoding!=null){
			//进行编码设置
			req.setCharacterEncoding(encoding);
		}
		//将处理权交给下一个处理器
		chain.doFilter(req, resp);
	}
    //初始化方法
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
		this.encoding=filterConfig.getInitParameter("encoding");
		
	}

}
