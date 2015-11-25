package br.com.gestoecon.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class AutorizaUsuario
 */
@WebFilter("/AutorizaUsuario")
public class AutorizaUsuario implements Filter {

    /**
     * Default constructor. 
     */
    public AutorizaUsuario() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		Object usuarioOK =  req.getSession().getAttribute(
				"usuarioOK");
		

		if (usuarioOK == null && !(req.getRequestURI().endsWith("/login.jsp") || (req.getRequestURI().endsWith("ManterUsuario")) || (req.getRequestURI().endsWith("usuarioInserir.jsp")) || req.getRequestURI().endsWith("AutenticaUsuario") || req.getRequestURI().contains("assets"))) {
			//req.getRequestDispatcher("login.jsp").forward(request, response);
			res.sendRedirect("/gestoecon/login.jsp");
		}
		else{
			chain.doFilter(request, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
