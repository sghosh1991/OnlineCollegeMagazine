/*import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class ActivationMailSendModel {
	public void sendActivationLink(String activation_link,String email){
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
		
		//2-create a message
		MimeMessage message = new MimeMessage(session);
		message.setSubject("ACTIVATION LINK FOR COLLEGE MAGAZINE");
		
		
		//3-address the message
		InternetAddress fromAdress = new InternetAddress(from);
		InternetAddress toAddress = new InternetAddress(to);
		message.setFrom(fromAdress);
		message.setRecipient(Message.RecipientType.TO, toAddress);		
		
		//4-send the message
		Transport.send(message);
		
		
	}
}
*/