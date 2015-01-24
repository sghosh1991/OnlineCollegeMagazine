import javax.servlet.*;
import javax.sql.*;
import java.sql.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ibm.security.krb5.internal.EncTicketPart;

/**
 * Servlet implementation class LoginManager
 */
public class LoginManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginManager() {
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
		String name;
		String query;
		RequestDispatcher view=null;
		PasswordManager pass=new PasswordManager();
		String encryptedPassword=pass.encrypt(request.getParameter("password"));
		//String encryptedPassword=request.getParameter("password");
		System.out.println("The encrypted password is: "+encryptedPassword);
		String type=request.getParameter("type");
		String email=request.getParameter("email");
		System.out.println("I AM IN LOGIN MANAGER...type=="+type+" email:  "+email);
		
		
		
		/* search the database as per type of login*/
		
		if(type.equals("collegemember"))
			query="select * from \"santosh\".REGISTERED_MEMBERS where EMAIL='"+request.getParameter("email")+"' and PASSWORD='"+encryptedPassword+"' and ACTIVATED='YES'";
		else
			query="select * from \"santosh\".SUPERVISOR where EMAIL='"+request.getParameter("email")+"' and PASSWORD='"+encryptedPassword+"'";
		
		
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
		try{
		if(rs.next()){ // if true login is successful...so now set session attributes
				name=rs.getString("NAME");
				
				HttpSession session=request.getSession();
				
				
				if(request.getParameter("type").equals("collegemember")){
					session.setAttribute("type", "collegemember");     /* type parameter required by DisplayProfile servlet to determine which jsp page to dispaly*/
					session.setAttribute("RID", rs.getString("RID"));
					
				}
				else if(request.getParameter("type").equals("moderator")){

					session.setAttribute("type", "moderator");
					session.setAttribute("SID",rs.getString("SID"));
				}
				else{
					session.setAttribute("type", "admin");
					session.setAttribute("SID",rs.getString("SID"));
				}
					
				
				/* set request attributes just for sake of displaying use name 
				 	during 1st login when client has not yet responded to a session*/
				
				request.setAttribute("name",name);
				request.setAttribute("loggedIn","YES");
				session.setAttribute("name", name);
				System.out.println("in login mnager servlet: name:"+name+" logged?: "+ request.getAttribute("loggedIn"));
				view=request.getRequestDispatcher("HomePageNEW.jsp");
				
				
				
		}
		else{
			request.setAttribute("displayInvalid","YES");
			view=request.getRequestDispatcher("Login.jsp");
			
		}
		
		rs.close(); /* relese the JDBC resources */
		view.forward(request, response);
		}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
