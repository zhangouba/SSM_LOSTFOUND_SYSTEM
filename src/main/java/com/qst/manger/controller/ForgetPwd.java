package com.qst.manger.controller;

import com.qst.common.pojo.LostResult;
import com.qst.common.utils.WebUtils;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.service.MangerUserService;
import com.qst.manger.utils.Mailutils;
import com.qst.manger.utils.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/forget")
public class ForgetPwd {

    @Autowired

    private MangerUserService mangerUserService;



    @ResponseBody
    @RequestMapping(value = "/fuck",method = RequestMethod.POST)
    public LostResult fuck(){
        return  LostResult.build(200,"");
    }



    @ResponseBody
    @RequestMapping(value = "/checkEmail",method = RequestMethod.POST)
    public LostResult checkEmail(String email){
        try {
         TbUsers tbUsers= mangerUserService.checkEmail(email);
            if (tbUsers==null){
                return LostResult.build(500,"");
            }
            else {
          //      System.out.println(email);
           //     System.out.println(tbUsers.getEmail());
                    return LostResult.build(200,"");
            }
        }catch (Exception e)
        {
        return LostResult.build(500,"");
        }
    }

    @ResponseBody
    @RequestMapping(value = "/getEmailCode",method = RequestMethod.POST)
    public LostResult getEmailCode(String email,HttpServletRequest request){
     try {
         TbUsers tbUsers= mangerUserService.checkEmail(email);
         Integer code = RandomUtils.createRandomStringCode();
         Mailutils.mailUs(tbUsers.getEmail(),"重置密码操作",code);
         System.out.println(code);
         HttpSession session = request.getSession();

         session.setAttribute("code", code);
         session.setAttribute("email",tbUsers.getEmail());
        // session.setMaxInactiveInterval(180);

         return LostResult.build(200,"");

     }catch (Exception e){

         return LostResult.build(500,"");

     }
    }

    @ResponseBody
    @RequestMapping(value = "/checkCode",method = RequestMethod.POST)
    public  LostResult checkCode(String code){
    Integer incode  = (Integer) WebUtils.getHttpSession().getAttribute("code");

        String codes=incode.toString();

        if (code.equals(codes)){
           return LostResult.build(200,"");
       }else {
           return LostResult.build(500,"");
       }
    }





       @ResponseBody
       @RequestMapping(value = "/resetPwdsss",method = RequestMethod.POST)
       public LostResult resetPwd(String password){
        try {
        //     System.out.println(password);
      //      mangerUserService.updateForgetPwd(email);
            String email= (String) WebUtils.getHttpSession().getAttribute("email");
            System.out.println(email+"--------------------------------------"+password);
            mangerUserService.resetPwd(email,password);


            return   LostResult.build(200,"");
        }catch (Exception e){
           return LostResult.build(500,"");
        }
   }

}
