import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VoteProcessorServlet
 */
public class VoteProcessorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoteProcessorServlet() {
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
		int votes=0;
		double new_rating=0;
		double rating_till_now=0;
		Integer vote=Integer.parseInt(request.getParameter("VOTE_GIVEN"));
		System.out.println(" in vote processor..vote= "+request.getParameter("VOTE_GIVEN"));
		String vid=request.getParameter("vid");
		PrintWriter out=response.getWriter();
		DatabaseManager db=new DatabaseManager();
		String query="select VOTE_COUNT,RATE from \"santosh\".VALIDATED_ARTICLES where VID='"+vid+"'" ;
		ResultSet rs=db.searchDatabase(query);
		try{
		if(rs.next()){
		votes=rs.getInt("VOTE_COUNT");
		rating_till_now=rs.getDouble("RATE");
		new_rating=(votes*rating_till_now+vote)/(votes+1);
		votes=votes+1;
		System.out.println("The new rate is: "+new_rating);
		}
		query="update \"santosh\".VALIDATED_ARTICLES set RATE="+new_rating+",VOTE_COUNT="+votes+" where VID='"+vid+"'" ;
		if(db.updateDatabase(query)>0){
			System.out.println("I am in vote Processor...vote successfully entered");
			out.print("vote successfully updated!!!");
		}
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}

}
