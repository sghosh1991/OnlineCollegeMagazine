

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
 * Servlet implementation class AllArticleServlet
 */
public class AllArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query="SELECT * FROM \"santosh\".VALIDATED_ARTICLES WHERE ISSUE_NAME IS NOT NULL ORDER BY NAME";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
		int countRow=0;
		try {
			if(rs.next()){
				rs.last();
				countRow=rs.getRow();
				rs.beforeFirst();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String rowCount=new Integer(countRow).toString();
		System.out.println("Obtained result set");
		HttpSession session=request.getSession();
		session.setAttribute("articleResult", rs);
		request.setAttribute("startRow","1" );
		request.setAttribute("countRow",rowCount);
		request.setAttribute("resultset",rs );
		RequestDispatcher view=request.getRequestDispatcher("AllArticle.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
