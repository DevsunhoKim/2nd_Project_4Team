package com.sist.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

public class AutoLoginIntercepter extends HandlerInterceptorAdapter{
    @Autowired
    private MemberService mService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] cookies=request.getCookies();
		HttpSession session=request.getSession();
		if(cookies!=null)
		{
			for(int i=0;i<cookies.length;i++)
			{
			    String key=cookies[i].getName();
			    if(key.equals("userId"))
			    {
			    	String id=cookies[i].getValue();
			    	MemberVO vo=mService.getMemberByID(id);
			    	session.setAttribute("userId", vo.getUserId());
					session.setAttribute("enabled", vo.getEnabled());
					session.setAttribute("authority", vo.getAuthority());
					session.setAttribute("userName", vo.getUserName());
			    	break;
			    }
			}
		}
		
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
    
}