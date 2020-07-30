package com.example.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter printwriter = response.getWriter();

		

	
		if(request.getSession().getAttribute("id")==null) {
			String path=request.getServletPath();
			String query=request.getQueryString();
			if(query !=null) {
				
				query= "?"+query;
			}else {
				query="";
			}
			
			request.getSession().setAttribute("dest", path + query);
			System.out.println(path+query);
printwriter.print("<script>alert('로그인을 해주십시오'); location.href='/login/login'</script>");
			
			printwriter.flush();
			
			printwriter.close();
			
		}
		return super.preHandle(request, response, handler);
		
	}
	
}
