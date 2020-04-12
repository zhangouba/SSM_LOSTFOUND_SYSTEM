package com.qst.manger.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.qst.common.pojo.LostResult;
import com.qst.common.utils.AppFileUtils;
import com.qst.common.utils.ExceptionUtil;
import com.qst.common.utils.WebUtils;
import com.qst.manger.pojo.TbUsers;
import com.qst.manger.pojoVo.LogInfoVo;
import com.qst.manger.service.LogInfoService;
import com.qst.manger.service.MangerUserService;
import com.qst.manger.utils.DataGridView;
import com.qst.manger.utils.ResultObj;
import com.qst.portal.service.PortalPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class MangerUserController {

	@Autowired
	private MangerUserService mangerUserService;
	@Autowired
	private LogInfoService logInfoService;
	@Autowired
	private PortalPictureService portalPictureService;
	
	//登录
	@ResponseBody
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public LostResult adminLogin(String username,String password, String code){
         TbUsers tbUsers=new TbUsers();
         tbUsers.setUsername(username);
         tbUsers.setPassword(password);
		 TbUsers newUser=	 mangerUserService.userLogin(tbUsers);
		String codes = (String) WebUtils.getHttpSession().getAttribute("code");
		if (code.equals(codes)) {
			if (newUser.getUsername() == null) {
				return LostResult.build(500, "用户不存在，请核对");
			}
			if (newUser.getPassword().equals(tbUsers.getPassword())) {

				WebUtils.getHttpSession().setAttribute("user", newUser);

				LogInfoVo logInfoVo = new LogInfoVo();
				logInfoVo.setLogintime(new Date());
				logInfoVo.setLoginname(newUser.getRealname() + "-" + newUser.getUsername());
				//记录ip地址
				logInfoVo.setLoginip(WebUtils.getHttpServletRequest().getRemoteAddr());
				logInfoService.addLogInfo(logInfoVo);
				//记录登陆日志 向sys_login_log里面插入数据

				return LostResult.build(200, "success");
			} else {
				return LostResult.build(500, "用户名或密码错误！");
			}
		}else {
			return LostResult.build(500, "验证码输入错误！");
		}
	}
	//修改个人资料
	@ResponseBody
	@RequestMapping("/changUserData")
	public LostResult changUserData(TbUsers tbUsers){
		try {
			mangerUserService.updateMySelfDate(tbUsers);
			return  LostResult.build(200,"");

		}catch (Exception e)
		{
			return  LostResult.build(500,"");
		}
	}
	//修改用户密码
	@ResponseBody
	@RequestMapping("/changeUserPwd")
	public LostResult changeUserPwd(TbUsers tbUsers){
		try {
			mangerUserService.updateUserData(tbUsers);
			return  LostResult.build(200,"");

		}catch (Exception e)
		{
			return  LostResult.build(500,"");
		}
	}

	//得到登录验证码
	@RequestMapping("getCode")
	@ResponseBody
	public  void  getCode(HttpServletResponse response, HttpSession session){

		LineCaptcha lineCaptcha= CaptchaUtil.createLineCaptcha(116 ,36,4,6);

		session.setAttribute("code",lineCaptcha.getCode());

		ServletOutputStream outputStream= null;
		try {
			outputStream = response.getOutputStream();
			ImageIO.write(lineCaptcha.getImage(),"JPEG",outputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@ResponseBody
	@RequestMapping("/changMyPhoto")
	public ResultObj changMyPhoto(MultipartFile uploadFile,
								  HttpServletRequest request) {
		try {
			Map getResult = portalPictureService.uploadFile(uploadFile, request);

			TbUsers tbUsers = (TbUsers) WebUtils.getHttpSession().getAttribute("user");
			TbUsers tbUsers1 = new TbUsers();
			tbUsers1.setId(tbUsers.getId());
			//pa.substring(0,pa.length()-9)
			String pa=(String) getResult.get("url");
			tbUsers1.setImg(pa.substring(0,pa.length()-9));
			//保存头像
			mangerUserService.changMyPhoto(tbUsers1);
            //更新session数据
			//看不懂是不是，我写完以后也看不懂了，但是就是能用
//			System.out.println("pa"+pa);
			String imageBaseUrl = WebUtils.getHttpSession().getServletContext().getRealPath("images");
//			System.out.println("imageBaseUrl"+imageBaseUrl);
//			System.out.println(pa.substring(6, 17));
//			System.out.println(pa.substring(18)+"18_______________");
	    	String name=	AppFileUtils.updateFileNameSUB(imageBaseUrl+
					pa.substring(6, 17),pa.substring(18));
			System.out.println("name"+name);

			TbUsers tbUsersSession=    mangerUserService.seleteSession(tbUsers.getId());
            WebUtils.getHttpSession().setAttribute("user",tbUsersSession);
 			return ResultObj.UPDATE_SUCCESS;
		} catch (Exception e) {
			return ResultObj.UPDATE_ERROR;
		}
	}
	//退出登录状态
	@RequestMapping("/logout")
	public String logout(){
	HttpSession session = WebUtils.getHttpSession();

		session.removeAttribute("user");

		return "index";
	}
	
	//修改密码
	@ResponseBody
	@RequestMapping(value="/changePwd",method=RequestMethod.POST)
	public LostResult updatePwd(String oldPwd,String newPwd){
		try {

			LostResult result = mangerUserService.changePwd(oldPwd, newPwd);

			return result;

		} catch (Exception e) {
			e.printStackTrace();
			return LostResult.build(500, ExceptionUtil.getStackTrace(e));
		}
	}

	//注册页 面检查用户是 否存在
	@RequestMapping(value = "/checkuser",method = RequestMethod.POST)
	@ResponseBody
	public LostResult checkuser(String username){
	   return 	mangerUserService.checkuser(username);

	}


	@RequestMapping(value = "/adduser",method = RequestMethod.POST)
	@ResponseBody
	public LostResult adduser(TbUsers users) {
		try {
			mangerUserService.adduser(users);
			return LostResult.ok();
		} catch (Exception e) {
			return LostResult.build(500, "用户已经存在");
		}
	}


	//锁屏状态获取当前用户的密码
	@RequestMapping(value = "/getSessionAll",method = RequestMethod.POST)
	@ResponseBody
	public DataGridView getSessionPwd(){
		TbUsers tbUsers= (TbUsers) WebUtils.getHttpSession().getAttribute("user");
	//	System.out.println("这里是查看密码");
		Map<String,String> map=new HashMap<>();
		map.put("pwd",tbUsers.getPassword());
		map.put("img",tbUsers.getImg());
		map.put("realname",tbUsers.getRealname());
		System.out.println(map);
		return  new DataGridView(map);
	}


}
