

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActivateAccountServlet
 */
public class ActivateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rid=(String)request.getParameter("rid");
		System.out.println(" I AM IN ACTIVATION SERVLET....RID is : "+ rid);
		
		DatabaseManager db=new DatabaseManager();
		String query="update \"santosh\".REGISTERED_MEMBERS set ACTIVATED='YES' where RID='"+rid+"' and (days(current date)-days(REG_DATE))<30";
		db.updateDatabase(query);
		request.setAttribute("activated", "YES");
		RequestDispatcher view=request.getRequestDispatcher("Login.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
