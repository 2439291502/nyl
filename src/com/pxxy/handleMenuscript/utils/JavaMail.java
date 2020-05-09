package com.pxxy.handleMenuscript.utils;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.junit.Test;

import com.pxxy.handleMenuscript.ex.SendEamilFailedException;

public class JavaMail {
	@Test
	public void javaMailTest(String username, String receiverEmail, String password)
			throws AddressException, MessagingException, IOException,SendEamilFailedException {
		/*
		 * 1得到Session
		 */
		Properties props = new Properties();
		// 设置服务器主机名
		props.setProperty("mail.host", "smtp.163.com");
		// 设置是否需要认证
		props.setProperty("mail.smtp.auth", "true");
		Authenticator auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("qq2439291502", "20160611nyl");
			}
		};
		Session session = Session.getInstance(props, auth);
		/*
		 * 2、创建MimeMessage
		 */
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress("qq2439291502@163.com")); // 设置发件人
		msg.setRecipients(RecipientType.TO, receiverEmail);// 设置收件人
//		msg.setRecipients(RecipientType.CC, "2439291502@qq.com");// 设置抄送
//		msg.setRecipients(RecipientType.BCC, "qq2439291502@126.com");// 设置密送
		msg.setSubject("欢迎注册《稿件处理系统网站》");
		msg.setContent(
				"您好，欢迎注册使用《稿件处理系统网站》，<br>" + "请使用您的账号" + username + "在该平台投稿，查看稿件审核状态等。<br>" + "用户名：" + username + ";邮箱："
						+ receiverEmail + ";密码：" + password + "<br>"
						+ "您可以现在点击进入本刊，从作者中心登陆，投稿。<br>" + "《稿件处理系统网站》编辑部<br>",
				"text/html;charset=utf-8");
		Transport.send(msg);

	}

}
