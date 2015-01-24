

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("newpass");
		System.out.println("In forgot password servlet");
		System.out.println("The email is: "+email);
		System.out.println("The password is: "+password);
		PasswordManager pm=new PasswordManager();
		RequestDispatcher view;
		int no=0;
		if(password!=null){
			String encryptedPassword=pm.encrypt(password);
			String query="UPDATE \"santosh\".REGISTERED_MEMBERS set PASSWORD='"+encryptedPassword+"' where EMAIL='"+email+"'";
			DatabaseManager db=new DatabaseManager();
			no=db.updateDatabase(query);
			System.out.println("Rows updated="+no);
			view=getServletContext().getRequestDispatcher("/Login.jsp");
			view.forward(request, response);
		}
	}

}
