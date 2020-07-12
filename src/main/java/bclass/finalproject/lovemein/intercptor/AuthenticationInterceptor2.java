package bclass.finalproject.lovemein.intercptor;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.plexus.logging.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor2 extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        

        HttpSession session = request.getSession();
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap = (HashMap)session.getAttribute("loginMember");
//        obj = session.getAttribute("loginMember");
        
        System.out.println("interceptor2: " + hashMap.toString());
        
        if ( hashMap == null ){
            
            response.sendRedirect(request.getContextPath());
            return false;
        }

        return true;
    }
 
    // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) 
    		throws Exception {
    	
        super.postHandle(request, response, handler, modelAndView);
  
    }

}
