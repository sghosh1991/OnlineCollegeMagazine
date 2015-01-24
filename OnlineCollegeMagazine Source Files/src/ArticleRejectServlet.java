

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ArticleRejectServlet
 */
public class ArticleRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleRejectServlet() {
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
		String pid=request.getParameter("pid");
		String rid=request.getParameter("rid");
		String category=request.getParameter("category");
		String articleName=request.getParameter("articleName");
		DatabaseManager db=new DatabaseManager();
		String modifyChecked="UPDATE \"santosh\".PENDING_ARTICLES SET CHECKED='Yes' WHERE PID='"+pid+"'";
	  	  db.updateDatabase(modifyChecked);
	  	String searchAuthor="SELECT EMAIL FROM \"santosh\".REGISTERED_MEMBERS WHERE RID='"+rid+"'";
	  		ResultSet rs=db.searchDatabase(searchAuthor);
	  		try {
				if(rs.next()){
					String recipient=rs.getString("EMAIL");
					String msg="Sorry your article "+articleName+" under the category "+category+" has been rejected.\n For further details contact the Moderator.";
					String subject="Article Validation";
					MainMail ob=new MainMail(msg,recipient,subject);
						ob.callMailUtil();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	  	request.setAttribute("reject", "success");
  	  RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
		  view.forward(request, response);
	}

}
