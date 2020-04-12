package com.qst.manger.utils;

import com.qst.common.pojo.LostResult;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class Mailutils {


	public static LostResult mailUs(String email, String subject, Integer code) {
				//将密码发送给用户
			try {

				JavaMailSenderImpl senderImpl   = new JavaMailSenderImpl();
				// 设定mail server  		    
				senderImpl.setHost( "smtp.qq.com" );

				Properties properties = System.getProperties();

				// 建 立 邮 件 消 息 
				MimeMessage mimeMessage = senderImpl.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
				// 设置收件人，寄件人 用数组发送多个邮件
				// String[] array = new String[]    {"sun111@163.com","sun222@sohu.com"};    
				// mailMessage.setTo(array); bineawu@163.com
				helper.setTo(email);
				helper.setFrom("1139861012@qq.com");
				helper.setSubject(subject);
				helper.setText("  【校园失物招领网】验证码" +
						code +
						"，用于" +subject+
						"，3分钟内有效。验证码提供给他人可能导致帐号被盗，请勿泄露，谨防被骗。", true);
				//  根据自己的情况,设置username
				senderImpl.setUsername("1139861012@qq.com");
				//  根据自己的情况, 设置password
				senderImpl.setPassword("uyphdfywmtzjjbef");
				Properties prop = new Properties();
				//ossyklsmzworgdbc
				prop.put("mail.smtp.auth", "true");
				prop.put("mail.smtp.timeout ", "25000");
				senderImpl.setJavaMailProperties(prop);
				//发送邮件
				senderImpl.send(mimeMessage);
				//System.out.println("success");
				return LostResult.ok();
				} catch (Exception e) {
					e.printStackTrace();
				}
		System.out.println("error");

		return null;
	}

	/*
	*   JavaMailSenderImpl senderImpl   = new JavaMailSenderImpl();
					 // 设定mail server  		    
					senderImpl.setHost( "smtp.qq.com" );

				Properties properties = System.getProperties();

					 // 建 立 邮 件 消 息 
					MimeMessage mimeMessage = senderImpl.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
					// 设置收件人，寄件人 用数组发送多个邮件
					// String[] array = new String[]    {"sun111@163.com","sun222@sohu.com"};    
					// mailMessage.setTo(array); bineawu@163.com
					helper.setTo(email);
					helper.setFrom("1139861012@qq.com");
					helper.setSubject(subject);
					helper.setText("  【校园失物招领网】验证码" +
							code +
							"，用于" +subject+
							"，3分钟内有效。验证码提供给他人可能导致帐号被盗，请勿泄露，谨防被骗。", true);
					//  根据自己的情况,设置username
					senderImpl.setUsername("1139861012@qq.com");
					//  根据自己的情况, 设置password
					senderImpl.setPassword("uyphdfywmtzjjbef");
					Properties prop = new Properties();
					//ossyklsmzworgdbc
					prop.put("mail.smtp.auth", "true");
					prop.put("mail.smtp.timeout ", "25000");
					senderImpl.setJavaMailProperties(prop);
					//发送邮件
					senderImpl.send(mimeMessage);
					//System.out.println("success");
					return LostResult.ok();*/
}
