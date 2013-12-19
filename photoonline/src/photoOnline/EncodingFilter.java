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
    //���ٷ���
	public void destroy() {
		this.encoding=null;
		this.filterConfig=null;
	}
    //���˳�������
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		if(encoding!=null){
			//���б�������
			req.setCharacterEncoding(encoding);
		}
		//������Ȩ������һ��������
		chain.doFilter(req, resp);
	}
    //��ʼ������
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;
		this.encoding=filterConfig.getInitParameter("encoding");
		
	}

}
