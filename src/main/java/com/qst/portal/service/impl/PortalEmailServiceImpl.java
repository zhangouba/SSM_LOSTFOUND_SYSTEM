package com.qst.portal.service.impl;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Properties;
@Service
public class PortalEmailServiceImpl {

	public static void main(String[] args) {
		
		try {
			JavaMailSenderImpl senderImpl   = new JavaMailSenderImpl();
			 // 设定mail server  		    
			senderImpl.setHost( "smtp.qq.com" );
			 // 建立邮件消息  
			MimeMessage mimeMessage = senderImpl.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
			// 设置收件人，寄件人 用数组发送多个邮件
			// String[] array = new String[]    {"sun111@163.com","sun222@sohu.com"};    
			// mailMessage.setTo(array); bineawu@163.com
			helper.setTo("bineawu@163.com");
			helper.setFrom("156669011@qq.com");
			helper.setSubject("找回信息管理密码-嘉园失物招领");
			helper.setText("<div>您好！欢迎使用嘉园失物招领平台！<br/><br/>"
					+ "您发布的信息为：23412352352344<br/>"
					+ "信息管理密码为：123456</div><br/><br/>"
					+ "本邮件为系统自动发送，请勿回复，谢谢！"
					+ "<br/>嘉园失物招领平台，让失物招领变得更简单，一个公益性平台，"
					+ "如果您有好的建议或者意见，或者想参与失物招领平台建设，请联系我们，你就是下一个受益者！", true);
			//  根据自己的情况,设置username
			senderImpl.setUsername("156669011@qq.com");
			//  根据自己的情况, 设置password
			senderImpl.setPassword("llwfeerpbmwsbibe");
			Properties prop = new Properties();
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.timeout ", "25000");
			senderImpl.setJavaMailProperties(prop);
			//发送邮件
			senderImpl.send(mimeMessage);
			System.out.println("qq邮件发送成功！");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}


	
	
	
	
}
