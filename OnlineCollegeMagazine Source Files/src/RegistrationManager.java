import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegistrationManager
 */
public class RegistrationManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 System.out.println("I am in reg manager");
			
			
			// TODO Auto-generated method stub
			response.setContentType("text/html");
			String query;
			DatabaseManager db=new DatabaseManager();
			int rid=0;
			
			/*Encrypt the password*/
			
			PasswordManager pass=new PasswordManager();
			String encryptedPassword=pass.encrypt(request.getParameter("password"));
			
			/* Get the current registration date */
			
			GregorianCalendar date=new GregorianCalendar();
			String reg_date=Integer.toString(date.get(Calendar.YEAR))+"-"+Integer.toString(date.get(Calendar.MONTH))+"-"+Integer.toString(date.get(Calendar.DATE));
			System.out.println("CURRENT DATE: " + reg_date);
			
			
			/* get the next value of the rid sequence*/
			query="values nextval for \"santosh\".REGISTERED_MEMBER_SEQ";
			
	        ResultSet rs= db.searchDatabase(query);
	        try {
	        	if(rs.next())
				rid =rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
				
			
			
			
			
			String activationLink="http://localhost:9081/OnlineMagazine/ActivateAccountServlet?rid="+rid;
			String recipient=request.getParameter("email");
			String subject="Activate Account for Footprints";
			/* create the class for sending activation mail  */
			ActivationLinkSender als=new ActivationLinkSender();
			String message="Congratulations! You have successfully registered for our Online Magazine.\n"+"<a href=\""+activationLink+"\">Click here to activate your account</a><br><br><b>NOTE: </b>Kindly activate your account within one month failing which your registration gets cancelled.";
			try {
				als.send(message, recipient,subject);
				System.out.println("Activation link sent");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			
			
			
			
			
			
			
			
			String name=request.getParameter("fname").toUpperCase()+" "+request.getParameter("lname").toUpperCase();
			query="insert into \"santosh\".REGISTERED_MEMBERS(RID,NAME,DEPARTMENT,PASSWORD,TYPE,YEAR,EMAIL) values('"+rid+"','"+name+"','"+request.getParameter("department")+"','"+encryptedPassword+"','"+request.getParameter("type")+"',"+request.getParameter("year")+",'"+request.getParameter("email")+"')";
			
			int no=db.updateDatabase(query);
			if(no>0){
				request.setAttribute("registrationSuccess","YES");
				request.setAttribute("regName", name);
				RequestDispatcher view=request.getRequestDispatcher("HomePage.jsp");
				view.forward(request, response);
			}
	}

}
