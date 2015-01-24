

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		// TODO Auto-generated method stub
		String name;
		PasswordManager pass=new PasswordManager();
		String encryptedPassword=pass.encrypt(request.getParameter("password"));
		String query="select * from \"santosh\".REGISTERED_MEMBERS where EMAIL='"+request.getParameter("email")+"' and PASSWORD='"+encryptedPassword+"'";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
		try{
		if(rs.next()){
				name=rs.getString("FIRST_NAME")+" "+rs.getString("LAST_NAME");
				HttpSession session=request.getSession();
				request.setAttribute("name",name);
				request.setAttribute("loggedIn","YES");
				RequestDispatcher view=request.getRequestDispatcher("Welcome.jsp");
				view.forward(request, response);
		}
		else{
			response.sendRedirect("Login.jsp");
		}
		}
			 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
	}

}
