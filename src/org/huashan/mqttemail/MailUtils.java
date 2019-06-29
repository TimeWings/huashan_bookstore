
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

	//1.�����Ự����

	//2.�����ʼ�����

	//3.�����ʼ�

 

	//email:�ʼ�����˭  subject��������  emailMsg �ʼ�������

	public static void sendMail(String email, String subject, String emailMsg)

			throws AddressException, MessagingException {

 

		// 1.����һ���������ʼ��������Ự���� Session

		Properties props = new Properties();

		props.setProperty("mail.transport.protocol", "SMTP");  //���ʼ���Э��

		props.setProperty("mail.host", "smtp.163.com");  //�����ʼ��ķ�������ַ

		props.setProperty("mail.smtp.auth", "true");// ָ����֤Ϊtrue

 

		// ������֤��

		Authenticator auth = new Authenticator() {

			public PasswordAuthentication getPasswordAuthentication() {

                //������Ϣ�������˺�:XX

				return new PasswordAuthentication("yhhbbgr@163.com", "yhhbbgr123");

			}

		};

 

		//  �൱�������������������

		Session session = Session.getInstance(props, auth);

 

		// 2.����һ��Message�����൱�����ʼ�����

		Message message = new MimeMessage(session);

        //������Ϣ�������˺�@163.com: XX@163.com
		message.setFrom(new InternetAddress("yhhbbgr@163.com")); // ���÷�����
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // ���÷��ͷ�ʽ�������
		message.setSubject(subject);
		// message.setText("����һ�⼤���ʼ�����<a href='#'>���</a>");

		message.setContent(emailMsg, "text/html;charset=utf-8");

		// 3.���� Transport���ڽ��ʼ�����

		Transport.send(message);

		System.out.println("���ͳɹ�......");
	}

}
