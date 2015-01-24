import javax.mail.*;
import java.util.*;
public class AuhthenticatePassword extends Authenticator {
	public PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication("ghosh.santosh91@gmail.com","san08104001036");
	}
}
