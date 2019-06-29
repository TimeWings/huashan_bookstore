
package com.mqtt;

 

import java.util.Properties;

 

import javax.mail.Authenticator;

import javax.mail.Message;

import javax.mail.MessagingException;

import javax.mail.PasswordAuthentication;

import javax.mail.Session;

import javax.mail.Transport;

import javax.mail.internet.AddressException;

import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;

import javax.mail.internet.MimeMessage.RecipientType;

 

public class MailUtils {

	//1.创建会话内容

	//2.创建邮件内容

	//3.发送邮件

 

	//email:邮件发给谁  subject代表主题  emailMsg 邮件的内容

	public static void sendMail(String email, String subject, String emailMsg)

			throws AddressException, MessagingException {

 

		// 1.创建一个程序与邮件服务器会话对象 Session

		Properties props = new Properties();

		props.setProperty("mail.transport.protocol", "SMTP");  //发邮件的协议

		props.setProperty("mail.host", "smtp.163.com");  //发送邮件的服务器地址

		props.setProperty("mail.smtp.auth", "true");// 指定验证为true

 

		// 创建验证器

		Authenticator auth = new Authenticator() {

			public PasswordAuthentication getPasswordAuthentication() {

                //发送信息的邮箱账号:XX

				return new PasswordAuthentication("yhhbbgr@163.com", "yhhbbgr123");

			}

		};

 

		//  相当与邮箱服务器创建连接

		Session session = Session.getInstance(props, auth);

 

		// 2.创建一个Message，它相当于是邮件内容

		Message message = new MimeMessage(session);

        //发送信息的邮箱账号@163.com: XX@163.com
		message.setFrom(new InternetAddress("yhhbbgr@163.com")); // 设置发送者
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者
		message.setSubject(subject);
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.创建 Transport用于将邮件发送

		Transport.send(message);

		System.out.println("发送成功......");
	}

}
