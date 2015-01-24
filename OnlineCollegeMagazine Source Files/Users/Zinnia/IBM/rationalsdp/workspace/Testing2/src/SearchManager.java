

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchManager
 */
public class SearchManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query;
		if(request.getParameter("type").equals("author"))
			query="select \"santosh\".VALIDATED_ARTICLES.FILE_PATH from \"santosh\".VALIDATED_ARTICLES where AUTHOR_NAME LIKE '%"+request.getParameter("searchString")+"%'"; 
		else if(request.getParameter("type").equals("articlename"))
			query="select \"santosh\".VALIDATED_ARTICLES.FILE_PATH from \"santosh\".VALIDATED_ARTICLES where NAME LIKE '%"+request.getParameter("searchString")+"%'";
		else{
			System.out.println("Keyword search");
			query="select \"santosh\".VALIDATED_ARTICLES.FILE_PATH from \"santosh\".VALIDATED_ARTICLES inner join \"santosh\".VALIDATED_ART_TAGS on \"santosh\".VALIDATED_ARTICLES.VID=\"santosh\".VALIDATED_ART_TAGS.VID where \"santosh\".VALIDATED_ART_TAGS.TAGS LIKE '%"+request.getParameter("searchString")+"%' and \"santosh\".VALIDATED_ARTICLES.ISSUE_NAME IS NOT NULL";
		}	
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
		
			request.setAttribute("resultset",rs );
			RequestDispatcher view=request.getRequestDispatcher("SearchPage.jsp");
			view.forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
