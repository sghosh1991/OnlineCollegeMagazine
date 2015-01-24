import java.sql.*;import java.util.*;
import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AutocompleteKeywordManager
 */
public class AutocompleteKeywordManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AutocompleteKeywordManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String term=request.getParameter("term");
		term=term.toUpperCase();
		System.out.println("TERM SENT FROM JQUERY IS " + term);
		System.out.println("THIS IS KEYWORD MANAGER");
		ArrayList<String> keyword=new ArrayList<String>();
		DatabaseManager db=new DatabaseManager();
		String query="select distinct(\"santosh\".validated_art_tags.tags) from \"santosh\".validated_articles inner join \"santosh\".validated_art_tags on \"santosh\".validated_articles.vid=\"santosh\".validated_art_tags.vid where \"santosh\".validated_art_tags.tags like '"+ term+"%' and \"santosh\".validated_articles.issue_name is not null";
		ResultSet rs=db.searchDatabase(query);
		try{
			while(rs.next()){
				keyword.add(rs.getString("tags"));
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
