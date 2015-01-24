

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPasswordMailServlet
 */
public class ForgotPasswordMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("I am in forgot mail servlet");
		String email=request.getParameter("email");
		System.out.println("Email is: "+email);
		String activationLink="http://localhost:9081/OnlineMagazine/ForgotPassword.jsp?email="+email;
		String message="Please click on the given link below in order to reset your password.\n"+"<a href=\""+activationLink+"\">Continue</a>";
		String subject="Change Password for Footprints";
		ActivationLinkSender als=new ActivationLinkSender();
		try {
			als.send(message, email,subject);
			System.out.println("Activation link sent");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
