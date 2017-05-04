package  bug.incepetor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import bug.frontstage.login.model.Buser;



public class CommonInterceptor implements HandlerInterceptor {

	public String[] allowUrls;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		HttpSession session = req.getSession(true);
	
		String requestUrl = req.getRequestURI().replace(req.getContextPath(), "");
	
        if (null != allowUrls && allowUrls.length >= 1)
        {
            for (String url : allowUrls)
            {
                if (requestUrl.contains(url))
                {
                    return true;
                }
            }
        }

       Buser buser= (Buser)session.getAttribute("flag");
       
    
	
		if (buser != null) {
			return true;
		}
		
		if(requestUrl.contains("css") || requestUrl.contains("js") ||requestUrl.contains("img") ||requestUrl.contains("layer") ){
			return true;
		}
		
		else if(buser==null){
			req.getSession().setAttribute("outTime", "用户信息已过期，请重新登陆！");
			resp.sendRedirect(req.getContextPath()+"/tologin1");
		
		}
		return false;
		
	
	}


	public void setAllowUrls(String[] allowUrls) {
		this.allowUrls = allowUrls;
	}

}
