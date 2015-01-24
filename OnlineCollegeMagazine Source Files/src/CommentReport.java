

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommentReport
 */
public class CommentReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentReport() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in comment report");
		String comm_id=request.getParameter("comm_id");
		int count=0;
		String query="SELECT REPORT_COUNT FROM \"santosh\".COMMENTS WHERE COM_ID='"+comm_id+"'";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
		try {
			if(rs.next())
			count=rs.getInt("REPORT_COUNT");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		count++;
		String reportQuery="UPDATE \"santosh\".COMMENTS SET REPORT_COUNT="+count+" WHERE COM_ID='"+comm_id+"'";
		int no=db.updateDatabase(reportQuery);
		if(no>0){
			System.out.println("Your report has been successfully notified to the authorities");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
