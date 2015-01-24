import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Anwesha
 */
public class ActivationLinkSender {
    public void send(String htmlText,String recipient,String subject)throws MessagingException{
        Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");                  
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("colmag.sinergia@gmail.com","asazsiner2345");
				}
			});
                
                
                MimeMessage message = new MimeMessage(session);
		message.setSubject(subject);
                 message.setContent(htmlText, "text/html");
                  
		//3-address the message
		InternetAddress fromAdress = new InternetAddress("colmag.sinergia@gmail.com");
		InternetAddress toAddress = new InternetAddress(recipient);
		message.setFrom(fromAdress);
		message.setRecipient(Message.RecipientType.TO, toAddress);		
		
		//4-send the message
		Transport.send(message);
                
		
                
        
        
    }
}
