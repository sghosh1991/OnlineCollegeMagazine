

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateDownloadCountServlet
 */
public class UpdateDownloadCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDownloadCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String issueName=request.getParameter("ISSUE_NAME");
		System.out.println("in update download count ISSUE: "+issueName);
		String getQuery="SELECT DOWNLOAD_COUNT FROM \"santosh\".ISSUES where NAME='"+issueName+"'";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(getQuery);
		int downCount=0;
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		try {
			if(rs.next()){
				downCount=rs.getInt("DOWNLOAD_COUNT");
				downCount++;
				System.out.println("The value of downCount is: "+downCount);
				String setQuery="UPDATE \"santosh\".ISSUES set DOWNLOAD_COUNT="+downCount+" where NAME='"+issueName+"'";
				int no=db.updateDatabase(setQuery);
				System.out.println("The no.of rows updated="+no);
				out.println("1");
				//out.flush();
			}
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
		doGet(request,response);
	}

}
