package com.qst.portal.service.impl;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Testmail {
    public static void main(String[] args) {
        try {
            JavaMailSenderImpl senderImpl   = new JavaMailSenderImpl();
            // 设定mail server  		    
            senderImpl.setHost( "smtp.qq.com" );
            // 建 立 邮 件 消 息 
            MimeMessage mimeMessage = senderImpl.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
            // 设置收件人，寄件人 用数组发送多个邮件
            // String[] array = new String[]    {"sun111@163.com","sun222@sohu.com"};    
            // mailMessage.setTo(array); bineawu@163.com
            helper.setTo("1120857854@qq.com");
            helper.setFrom("1139861012@qq.com");
            helper.setSubject("用户建议与问题-校园失物招领");
            helper.setText("<div>您好！校园失物招领平台管理员！<br/><br/>");
            //  根据自己的情况,设置username
            senderImpl.setUsername("1139861012@qq.com");
            //  根据自己的情况, 设置password
            senderImpl.setPassword("ossyklsmzworgdbc");
            Properties prop = new Properties();
            //ossyklsmzworgdbc
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.timeout ", "25000");
            senderImpl.setJavaMailProperties(prop);
            //发送邮件
            senderImpl.send(mimeMessage);
            System.out.println("success");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error");
        }
    }
}
