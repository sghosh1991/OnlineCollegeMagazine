

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class CategoryArticleDisplayServlet
 */
public class CategoryArticleDisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryArticleDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("I AM IN CATEGORY ARTICLE DISPLAY MANAGER SERVLET");
		String category=(String)request.getParameter("category");
		System.out.println(" CATEGORY: "+ category);
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=null;
		String issue_name=null;
		
		/*get the current issue*/
		
		String query="SELECT NAME FROM \"santosh\".ISSUES ORDER BY DATE DESC FETCH FIRST 1 ROWS ONLY";
		rs = db.searchDatabase(query);
		
		try {
			rs.next();
			issue_name=(String) rs.getString("NAME");
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.print("CURRENT ISSUE: " + issue_name);
		
		
		query="select * from \"santosh\".VALIDATED_ARTICLES where CATEGORY='"+category+"' and ISSUE_NAME='"+issue_name+"'";
		String changeQuery="select * from \"santosh\".VALIDATED_ARTICLES where CATEGORY='"+category+"' and ISSUE_NAME is not null";
		rs=db.searchDatabase(changeQuery);
		request.setAttribute("articles", rs);
		RequestDispatcher view= request.getRequestDispatcher("CategoryArticleDisplay.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
