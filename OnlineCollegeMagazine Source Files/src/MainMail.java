

public class MainMail {

	/**
	 * @param args
	 */
	String msgBody;
	String recipient;
	String subject;
	MainMail(String msg,String rec,String sub){
		msgBody=msg;
		recipient=rec;
		subject=sub;
	}
	public void callMailUtil() throws Exception{
		// TODO Auto-generated method stub
		MailUtil.sendmail(recipient, "colmag.sinergia@gmail.com", subject, msgBody);
		System.out.println("In Main...Mail sent!!!");
	}

}
