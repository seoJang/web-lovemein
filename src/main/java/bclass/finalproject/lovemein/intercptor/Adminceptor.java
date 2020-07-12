package bclass.finalproject.lovemein.intercptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bclass.finalproject.lovemein.users.model.vo.AllUsers;

public class Adminceptor extends HandlerInterceptorAdapter {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	  System.out.println("interceptor2: ");
          
    	AllUsers allusers = new AllUsers();
        HttpSession session = request.getSession();
     /*   HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap = (HashMap)session.getAttribute("loginMember");*/
        allusers = (AllUsers)session.getAttribute("loginMember");
        
       // System.out.println("interceptor2: " + allusers.getU_no());
        
        if ( allusers.getU_no().equals("1")){
        	return true;
            
        } else {
        	response.sendRedirect(request.getContextPath());
            return false;
        }

    }
 
    // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) 
    		throws Exception {
    	
        super.postHandle(request, response, handler, modelAndView);
  
    }

	
}
