

import java.sql.*;
import java.util.ArrayList;

import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CommentFetchServlet
 */
public class CommentFetchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentFetchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Object> xx=new ArrayList<Object>();
		String vid=request.getParameter("VID");
		
		
		DatabaseManager db=new DatabaseManager();
		System.out.println("I AM IN Comment Fetch Servlet.....VID is: "+vid);
		String query="SELECT C.COM_ID,R.NAME,C.CONTENT,C.COMMENT_DATE FROM \"santosh\".COMMENTS C left join \"santosh\".REGISTERED_MEMBERS R on C.RID=R.RID WHERE VID='"+vid+"' ORDER BY COM_ID";
		ResultSet rs=db.searchDatabase(query);
		try {
			while(rs.next()){
				String author=rs.getString("NAME");
				System.out.print("AUTHOR:  "+author);
				if(author==null)
					author="Guest";
				String comment=rs.getString("CONTENT");
				String comm_id=rs.getString("COM_ID");
				String date=rs.getString("COMMENT_DATE");
				xx.add(new ConstructComment(author,comment,comm_id,date));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Gson obj=new Gson();
		String json=obj.toJson(xx);
		System.out.print("I AM IN COMMENT FETCH: "+json);
		PrintWriter out=response.getWriter();
		response.setContentType("application/json");
		out.println(json);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
