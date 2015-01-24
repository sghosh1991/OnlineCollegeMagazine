

import java.io.IOException;
import java.io.PrintWriter;

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
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PasswordManager pass=new PasswordManager();
		String encryptedPassword=pass.encrypt(request.getParameter("password"));
		String query="insert into \"santosh\".REGISTERED_MEMBERS values('IEM006','"+request.getParameter("fname")+"','"+request.getParameter("lname")+"','"+request.getParameter("department")+"','"+encryptedPassword+"','"+request.getParameter("type")+"','F:\',"+request.getParameter("year")+",'"+request.getParameter("email")+"')";
		DatabaseManager db=new DatabaseManager();
		int no=db.updateDatabase(query);
		if(no>0){
			String name=request.getParameter("fname")+" "+request.getParameter("lname");
			request.setAttribute("name", name);
			RequestDispatcher view=request.getRequestDispatcher("Display.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
