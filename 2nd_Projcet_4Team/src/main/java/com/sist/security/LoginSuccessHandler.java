package com.sist.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.sist.service.MemberService;
import com.sist.vo.MemberVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private RequestCache requestCache=new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy=new DefaultRedirectStrategy();
    private String defaultUrl;
    private MemberService mService;
    
    @Autowired
	public LoginSuccessHandler(MemberService mService) {
		this.mService = mService;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		HttpSession session=request.getSession();
		mService.lastLoginUpdate(authentication.getName());
		MemberVO vo=mService.getMemberByID(authentication.getName());
		
		// ${sessionScope.member.변수명} 
		session.setAttribute("member", vo);
		resultRedirectStrategy(request, response, authentication);
	}
	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException 
	{
		SavedRequest savedRequest=requestCache.getRequest(request, response);
		if(savedRequest!=null)
		{
			String targetUrl=savedRequest.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		}
		else
		{
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
	}

}