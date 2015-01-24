

import java.sql.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class AuthorDisplayServlet
 */
public class AuthorDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthorDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("I AM IN AUTHOR LIST DISPLAY MANAGER SERVLET");
		String issue_name=null;
		
		DatabaseManager db=new DatabaseManager();
		
		/* get the recent issue */
		
		String query="SELECT NAME FROM \"santosh\".ISSUES ORDER BY DATE DESC FETCH FIRST 1 ROWS ONLY";
		ResultSet rs = db.searchDatabase(query);
		
		try {
			rs.next();
			issue_name=(String) rs.getString("NAME");
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/* get the authors who have article sin this issue */
		
		query="SELECT * FROM \"santosh\".VALIDATED_ARTICLES where ISSUE_NAME='"+issue_name+"' ORDER BY AUTHOR_NAME";
		rs=db.searchDatabase(query);
		
		 /* forward the request to the authorListDisplayList.jsp */
		
		request.setAttribute("authors", rs);
		request.setAttribute("current_issue", issue_name);
		RequestDispatcher view=request.getRequestDispatcher("AuthorListDisplay.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
