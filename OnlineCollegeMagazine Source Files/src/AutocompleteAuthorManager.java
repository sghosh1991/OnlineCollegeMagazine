
import java.sql.*;
import com.google.gson.Gson;
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class AutocompleteAuthorManager
 */
public class AutocompleteAuthorManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutocompleteAuthorManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("THIS IS AUTHOR MANAGER");
		String term=request.getParameter("term");
		term=term.toUpperCase();
		System.out.println("TERM SENT FROM JQUERY IS " + term);
		ArrayList<String> keyword=new ArrayList<String>();
		DatabaseManager db=new DatabaseManager();
		String query="select DISTINCT(AUTHOR_NAME) from \"santosh\".VALIDATED_ARTICLES where AUTHOR_NAME like '"+ term+"%' and ISSUE_NAME IS NOT NULL";
		ResultSet rs=db.searchDatabase(query);
		try{
			while(rs.next()){
				keyword.add(rs.getString("AUTHOr_NAME"));
			}
		}catch(Exception e){
			e.printStackTrace();
			}
		
		Gson obj= new Gson();
		String json=obj.toJson(keyword);
		System.out.println("json = "+ json);
		PrintWriter out=response.getWriter();
		response.setContentType("application/json");
		out.write(json);
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
