package com.qst.manger.interceptor;

import com.qst.manger.pojo.TbUsers;

import net.sf.json.JSONObject;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

//登录过滤拦截器
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    //在之前
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url=request.getRequestURI();
      //  System.out.println("进入拦截器"+url);
        TbUsers user= (TbUsers) request.getSession(true).getAttribute("user");

      //  System.out.println(user);

       if (user==null){
           //表示未登录或者登陆失效状态
       //    System.out.println("登录未成功"+url);
           if("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
               //ajax请求
               Map<String,String> ret=new HashMap<>();
               ret.put("type","error");
               ret.put("msg","登陆状态已经失效");
               response.getWriter().write(JSONObject.fromObject(ret).toString());
               return false;
           }
           response.sendRedirect(request.getContextPath() + "/admin/login");

           return false;
       }
      // System.out.println("登录成功"+url);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
