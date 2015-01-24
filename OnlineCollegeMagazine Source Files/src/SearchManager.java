

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		int countRow=0;
		String searchString=request.getParameter("searchString").toUpperCase();
		if(request.getParameter("type").equals("author")){
			query="select * from \"santosh\".VALIDATED_ARTICLES where AUTHOR_NAME LIKE '%"+searchString+"%' and ISSUE_NAME is not null";
		}
		else if(request.getParameter("type").equals("articlename")){
			query="select * from \"santosh\".VALIDATED_ARTICLES where NAME LIKE '%"+searchString+"%' and ISSUE_NAME is not null";
		}
		else{
			System.out.println("Keyword search");
			ArrayList<String> ar1=new ArrayList<String>();
			int prevval=0;
			char presentChar;
			for(int i=0;i<searchString.length();i++){
				presentChar=searchString.charAt(i);
				if(presentChar==' '){
					ar1.add(searchString.substring(prevval,i).toUpperCase());
					prevval=i+1;
				}
			}
			ar1.add(searchString.substring(prevval).toUpperCase());
			int size=ar1.size()-1;
			query="select DISTINCT \"santosh\".VALIDATED_ARTICLES.VID,\"santosh\".VALIDATED_ARTICLES.VIEW_COUNT,\"santosh\".VALIDATED_ARTICLES.FILE_PATH,\"santosh\".VALIDATED_ARTICLES.NAME,\"santosh\".VALIDATED_ARTICLES.AUTHOR_NAME,\"santosh\".VALIDATED_ARTICLES.SNIPPET,\"santosh\".VALIDATED_ARTICLES.PAGENO,\"santosh\".VALIDATED_ARTICLES.ISSUE_NAME from \"santosh\".VALIDATED_ARTICLES inner join \"santosh\".VALIDATED_ART_TAGS on \"santosh\".VALIDATED_ARTICLES.VID=\"santosh\".VALIDATED_ART_TAGS.VID where \"santosh\".VALIDATED_ART_TAGS.TAGS in('";
			//+request.getParameter("searchString").toUpperCase()+"%' and \"santosh\".VALIDATED_ARTICLES.ISSUE_NAME IS NOT NULL";
			for(int i=0;i<ar1.size();i++){
				
				query=query.concat(ar1.get(i));
				query=query.concat("'");
				if(i<size){
					query=query.concat(",'");
				}
				else{
					query=query.concat(")");
				}
			}
			query=query.concat(" and \"santosh\".VALIDATED_ARTICLES.ISSUE_NAME IS NOT NULL");
			System.out.println(query);
		}	
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
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
			session.setAttribute("searchResult", rs);
			request.setAttribute("startRow","1" );
			request.setAttribute("countRow",rowCount);
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
