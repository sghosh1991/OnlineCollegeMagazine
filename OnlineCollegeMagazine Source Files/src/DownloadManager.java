

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadManager
 */
public class DownloadManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String issueName=null;
		issueName=request.getParameter("ISSUE_NAME");
		System.out.println("in update download count ISSUE: "+issueName);
		if(issueName!=null){
		String getQuery="SELECT DOWNLOAD_COUNT FROM \"santosh\".ISSUES where NAME='"+issueName+"'";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(getQuery);
		int downCount=0;
		try {
			if(rs.next()){
				downCount=rs.getInt("DOWNLOAD_COUNT");
				downCount++;
				System.out.println("The value of downCount is: "+downCount);
				String setQuery="UPDATE \"santosh\".ISSUES set DOWNLOAD_COUNT="+downCount+" where NAME='"+issueName+"'";
				int no=db.updateDatabase(setQuery);
				System.out.println("The no.of rows updated="+no);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		response.setContentType("application/pdf");
		System.out.println("in download manager 2");
		String filePath=request.getParameter("filePath");
		//System.out.println("in download manager 3");
		String articleName=request.getParameter("name");
		//System.out.println("in download manager 4");
		response.setHeader("Content-Disposition", "attachment;filename="+articleName);
		//System.out.println("in download manager 5");
		ServletContext ctx = getServletContext();
		//System.out.println("in download manager 6");
		InputStream is=ctx.getResourceAsStream(filePath);
		//System.out.println("in download manager 7");
		int read=0;
		byte[] bytes=new byte[4096];
		OutputStream os=response.getOutputStream();
		//System.out.println("in download manager 8");
		while((read=is.read(bytes))!=-1){
			os.write(bytes, 0, read);
		}
		//System.out.println("in download manager 9");
		os.flush();
		//System.out.print("in download manager 1");
		os.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
