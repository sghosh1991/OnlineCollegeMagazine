

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class XMLTest
 */
public class XMLTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XMLTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String xml = 
		      "<?xml version=\"1.0\"?>" + 
		      "<Client>" + 
		      "<Address> " +
		        "<street>54 Moorpark Ave.</street>" +
		        "<city>San Jose</city>" +
		        "<state>CA</state>" +
		        "<zip>95110</zip>" +
		      "</Address>" +
		      "<phone>" +
		        "<work> 4084630110</work>" +
		        "<home> 4081114444</home>" +
		        "<cell> 4082223333</cell>" +
		      "</phone>" +
		      "<fax> 4087776688</fax>" +
		      "<email>sailer555@yahoo.com</email>" +
		      "</Client>";
		String query="insert into \"santosh\".Test(CID,CONTACT) values(\"1\"," + xml + ")";
		DatabaseManager db=new DatabaseManager();
		int updated=db.updateDatabase(query);
		System.out.println("No of rows updated" + updated);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
