package com.common;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 邮件发送工具类
 */
public class SendMailUtil {
    private static Session session;
    public static void main(String[] args) {
        // 您要发送给谁，标题，内容
        //SendMailUtil.send("*****@qq.com", "标题", "内容", "smtp", "smtp.qq.com", "发送人邮箱", "端口号", "邮箱用户名", "邮箱密码");
//        SendMailUtil.send("499203674@qq.com","激活码","订单号：激活码","smtp", "smtp.126.com",
//                "bjxbckj@126.com", "", "bjxbckj", "Lw88888888","XX科技公司");
        SendMailUtil.send("499203674@qq.com", "zhangsan", "内容");
    }
    public static boolean send(String email, String title, String content){
        try {
            Session session = getSession();
            Transport transport = session.getTransport();
//            MimeMessage message = createMimeMessage(session, "bjxbckj@126.com", email, title, content);
//            transport.connect("bjxbckj@126.com", "88888888");

//            contactus@econmod.cn
//            econmode123!
            MimeMessage message = createMimeMessage(session, "contactus@econmod.cn", email, title, content);
            transport.connect("contactus@econmod.cn", "econmode123!");
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            System.out.println("发送成功");
            return true;
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("发送失败");
            return false;
        }

    }

    private static Session getSession() {
        if (session == null) {
            Properties props = new Properties(); // 邮箱的发送服务器地址
            props.setProperty( "mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//            props.setProperty("mail.smtp.host", "smtp.126.com");
            props.setProperty("mail.smtp.host", "smtp.econmod.cn");
            props.setProperty("mail.smtp.socketFactory.fallback", "false");
            //邮箱发送服务器端口,这里设置为465端口
            props.setProperty("mail.smtp.port", "465");
            props.setProperty("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.auth", "true");
            session = Session.getInstance(props);
        }
        return session;
    }

    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail, String title,
                                                String content) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        message.setFrom(new InternetAddress(sendMail, "量化经济分析平台", "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "平台用户", "UTF-8"));

        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        message.setSubject(title, "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        message.setContent(content, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }



}