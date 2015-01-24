

import java.sql.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ArticleViewManagerServlet
 */
public class ArticleViewManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleViewManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("I am in article view manager");
		String article_name=null;
		String vid=null;
		Integer view_count=Integer.parseInt(request.getParameter("view_count"));
		article_name=(String)request.getParameter("article_name");
		vid=(String)request.getParameter("vid");
		Integer pageno=Integer.parseInt(request.getParameter("pageno"));
		String issue_name=request.getParameter("issue_name");
		
		System.out.println("Parametrs : article_name: " + article_name+" VID: " + vid+"  pages : "+pageno+"view count: "+view_count+"ISSUE NAME:  " + issue_name);
		
		/* update view count first*/
		
		DatabaseManager db=new DatabaseManager();
		String query="update \"santosh\".VALIDATED_ARTICLES set VIEW_COUNT="+(view_count+1)+" where VID='"+vid+"'";
		db.updateDatabase(query);
		
		
		
		/* Get the comments for this article */
		
		//CommentFetchModel cm=new CommentFetchModel();
		//ResultSet rs=cm.getComments(vid);
		
		/* get the pdfpath using joins so that the download button can access the issues psd path*/
		
		query="select I.FILE_PATH from \"santosh\".validated_articles V inner join \"santosh\".issues I on V.ISSUE_NAME=I.NAME where V.VID='"+vid+"'";
		ResultSet rs1 = db.searchDatabase(query);
		try {
			rs1.next();
			String pdf_path=(String)rs1.getString("FILE_PATH");
			
			System.out.println("PDF PATH--------------->>>"+pdf_path);
		
		
		/* Set the request attributes */
		
		request.setAttribute("article_name", article_name);
		request.setAttribute("pageno",pageno);
		//request.setAttribute("comments",rs);
		request.setAttribute("VID", vid);
		request.setAttribute("pdf_path", pdf_path);
		request.setAttribute("issue_name", issue_name);
		
		/*forward the request to the articleview.jsp */
		
		RequestDispatcher view=request.getRequestDispatcher("ArticleView.jsp");
		view.forward(request, response);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
