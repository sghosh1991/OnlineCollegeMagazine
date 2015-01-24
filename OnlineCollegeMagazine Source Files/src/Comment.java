

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Comment
 */
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment() {
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
		String comment=(String)request.getParameter("TXT");
		RequestDispatcher view=null;
		String vid=request.getParameter("VID");
		String rid=request.getParameter("RID");
		
		System.out.println("I AM IN COMMENT SERVLET vid: "+ vid+ "rid: "+ rid+"comment :" +comment);
		try{
		    PrintWriter out=response.getWriter();
			CommentFiltration cf=new CommentFiltration();
			
			if(cf.filter(comment)){
				System.out.println("bad comment");
				out.print("bad");
				
				
			}
			else{
				GregorianCalendar date=new GregorianCalendar();
				String com_date=Integer.toString(date.get(Calendar.YEAR))+"-"+Integer.toString(date.get(Calendar.MONTH))+"-"+Integer.toString(date.get(Calendar.DATE));
				System.out.println("CURRENT DATE: " + com_date);
				DatabaseManager db=new DatabaseManager();
				String query;
				if(!rid.equals("null")){
					System.out.println("Not null case");
					query="insert into \"santosh\".COMMENTS(COM_ID,CONTENT,VID,RID) values(next value for \"santosh\".COMMENTS_SEQ,'"+comment+"','"+vid+"','"+rid+"')";
				}
				else{
					System.out.println("Null case");
					query="insert into \"santosh\".COMMENTS(COM_ID,CONTENT,VID) values(next value for \"santosh\".COMMENTS_SEQ,'"+comment+"','"+vid+"')";
				}
				if(db.updateDatabase(query)>0)
					System.out.println("insert done");
				System.out.println("good comment");
				out.println("good");
				
				
			}
				// forward request to jsp anyway...jsp logic will decide when to show and when not to.
				
				out.flush();
				out.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
