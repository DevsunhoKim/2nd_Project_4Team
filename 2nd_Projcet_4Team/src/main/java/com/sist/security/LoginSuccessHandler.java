package com.sist.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

public class LoginSuccessHandler implements AuthenticationSuccessHandler{
	private RequestCache requestCache=new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy=new DefaultRedirectStrategy();
	
    private String defaultUrl;
    
    // 이 클래스가 먼저 메모리 할당되기 때문에 MemberService는 메모리 할당 안됨 
    // => session에 값 넣을 수 없다
    // ==> 1. 세션값이 필요한 메소드마다 SessionInfo 값 채워서 사용..
    // ==> 2. userdetailClass 활용
    
    //@Autowired
    //private MemberService mService;
    
	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//HttpSession session=request.getSession();
		
		//mService.lastLoginUpdate(authentication.getName());
		
		/*MemberVO vo=mService.memberSessionData(authentication.getName());
		SessionInfo info=new SessionInfo();
		info.setUserId(vo.getUserId());
		info.setUserName(vo.getUserName());
		info.setEmail(vo.getEmail());
		info.setPhone(vo.getPhone());
		info.setAddress(vo.getAddr1()+" "+vo.getAddr2());
		info.setSex(vo.getSex());
		session.setAttribute("member", info);*/
		resultRedirectStrategy(request, response, authentication);
		
		// response.sendRedirect("../main/main.do")
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