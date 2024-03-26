package com.itbank.component;

import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Scanner;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailComponent {

   private final String host = "smtp.naver.com";
   private final int port = 465;
   private String serverId = "zgmv5896";
   private String serverPw = "xptmxmdlqslek.";
   
   private Properties props;
   
   // @Autowired가 자동으로 스프링 빈을 연결하듯ㅇ
   // @Value는 자동으로 자원(파일)을 연결한다
   // classpath: "src/main/java" or "src/main/resources"
   @Value("classpath:mailForm.html")
   private Resource mailForm;
   
   @PostConstruct
   private void init() {
      props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", port);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.ssl.enable", "true");
      props.put("mail.smtp.ssl.trust", host);
         
   }
   
   //단순 텍스트 메일 보내기
   public int sendSimpleMessage(String address,String subject, String content) {
      
      // 1) 메일 서버 인증(접속에 필요하다)
      Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
         String un = serverId;
         String pw = serverPw;
         
         @Override
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(un, pw);
         }
      });
      mailSession.setDebug(true);      // 메일 전송 과정을 콘솔창에 출력한다
      
      
      //2) 보낼 메세지 작성
      Message message = new MimeMessage(mailSession);   
      
      try {
         message.setFrom(new InternetAddress(serverId + "@naver.com")); // 보내는 사람
         message.setRecipient(Message.RecipientType.TO,new InternetAddress(address));      // 받는 사람
         message.setSubject(subject);         // 제목
         message.setText(content);         // 내용
         
         Transport.send(message);         // 3) 준비가 끝난 메시지를 발송한다
         return 1;
         
      } catch (MessagingException e) {
         e.printStackTrace();
         return 0;
      }   
   }

   public int sendMimeMessage(HashMap<String, String> param) {
      // 1) 메일 서버 인증(접속에 필요하다)
            Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
               String un = serverId;
               String pw = serverPw;
               
               @Override
               protected PasswordAuthentication getPasswordAuthentication() {
                  return new PasswordAuthentication(un, pw);
               }
            });
            mailSession.setDebug(true);      // 메일 전송 과정을 콘솔창에 출력한다
            
            
            //2) 보낼 메세지 작성
            Message message = new MimeMessage(mailSession);
            String address = param.get("address");
            String subject = param.get("subject");
            String content = param.get("content");
            
            
            try {
               message.setFrom(new InternetAddress(serverId + "@naver.com")); // 보내는 사람
               message.setRecipient(Message.RecipientType.TO,new InternetAddress(address));      // 받는 사람
               message.setSubject(subject);         // 제목
                //message.setText(content);         // 내용
               
               String tag = "";
               Scanner sc = new Scanner(mailForm.getFile());
               while(sc.hasNextLine()) {
                  tag += sc.nextLine();
               }
               sc.close();
               content = String.format(tag, content);
               message.setContent(content,"text/html; charset=utf-8");      // 태그포함
//               tag += "<div style=\"paddong: 10px; font-size: 20px;\">";
//               tag += "<p>인증번호는 [%s]입니다 </p>";
//               tag += "</div>";

       
               Transport.send(message);         // 3) 준비가 끝난 메시지를 발송한다
               return 1;
               
            } catch (MessagingException | IOException e) {
               e.printStackTrace();
               return 0;
            }
   }
}