package com.semi.email;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
	private String host = "smtp.gmail.com"; // 메일 발송에 사용할 SMTP 서버 호스트명
	private String port = "465"; // 메일 발송에 사용할 SMTP 서버 포트번호
	private String username = "iiuu217@google.com"; // SMTP 서버 인증에 사용할 계정 아이디
	private String password = "semi230636!"; // SMTP 서버 인증에 사용할 계정 비밀번호

    public void sendEmail(String fromAddress, String toAddress, String subject, String content) {
    	try {
    	
    	// SMTP 서버 설정
        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.debug", "true");
        properties.put("mail.smtp.socketFactory.fallback", "false");

        // SMTP 서버 인증을 위한 사용자 정보
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication(username, password);
            }
          };  
          
        // 세션 생성
        Session session = Session.getInstance(properties, authenticator);

        session.setDebug(true);
        
        
            // 메일 메시지 작성
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromAddress));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
            message.setSubject(subject);
            message.setText(content);

            // 메일 발송
            Transport.send(message);

            System.out.println("메일이 성공적으로 발송되었습니다.");
    	} catch (MessagingException ex) {
            System.out.println("메일 발송 중 오류가 발생했습니다: " + ex.getMessage());
            ex.printStackTrace();
    	}
    }
}