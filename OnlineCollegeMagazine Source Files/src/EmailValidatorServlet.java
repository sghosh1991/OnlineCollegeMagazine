
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmailValidatorServlet
 */
public class EmailValidatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailValidatorServlet() {
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
		String email=request.getParameter("email");
		ResultSet rs1=null;
		String query1;
		System.out.println(" i am in email validator. email :"+ email);
		DatabaseManager db=new DatabaseManager();
		String query="select * from \"santosh\".COLLEGE_MEMBERS where EMAIL='"+email+"'";
		ResultSet rs=db.searchDatabase(query);
		response.setContentType("text");
		PrintWriter out=response.getWriter();
		try {
			if(rs.next()){
				System.out.println("ENROLLMENT NO: "+ rs.getString("ENROLLMENT_NO"));
				query1="select * from \"santosh\".REGISTERED_MEMBERS where EMAIl='"+email+"'";
				rs1=db.searchDatabase(query1);
					if(rs1.next()){
						out.print("alr_reg");
						System.out.print("ALREADY REGISTERED");
					}
					else{
						out.print("available");
						System.out.print("AVAILABLE");
					}
			}
					else{
						out.print("unavailable");
						System.out.print("UNAVAILABLE -------------------");
					}
				
				
				out.flush();
				out.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}

}
