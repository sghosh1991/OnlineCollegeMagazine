

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IgnoreComment
 */
public class IgnoreComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IgnoreComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String commentID=request.getParameter("comid");
		String query="UPDATE \"santosh\".COMMENTS SET REPORT_COUNT=0 WHERE COM_ID='"+commentID+"'";
		DatabaseManager db=new DatabaseManager();
		db.updateDatabase(query);
		request.setAttribute("commentIgnore", "Yes");
		RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
		  view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
