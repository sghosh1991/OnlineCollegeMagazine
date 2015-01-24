

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class ModeratorActivityRate
 */
public class ModeratorActivityRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModeratorActivityRate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		System.out.println("Moderator activity rate");
		String query="SELECT \"santosh\".SUPERVISOR.SID \"SID\",\"santosh\".SUPERVISOR.NAME \"NAME\",\"santosh\".PENDING_ARTICLES.CHECKED \"CHECKED\",COUNT(*) \"COUNT\" FROM \"santosh\".SUPERVISOR INNER JOIN \"santosh\".PENDING_ARTICLES ON \"santosh\".SUPERVISOR.CATEGORY=\"santosh\".PENDING_ARTICLES.CATEGORY WHERE DAYS(CURRENT DATE)-DAYS(\"santosh\".PENDING_ARTICLES.POST_DATE) BETWEEN 03 AND 90 GROUP BY \"santosh\".SUPERVISOR.NAME,\"santosh\".SUPERVISOR.SID,\"santosh\".PENDING_ARTICLES.CHECKED";
		
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=db.searchDatabase(query);
		ArrayList<String> ar1=new ArrayList<String>();
		ArrayList<String> ar2=new ArrayList<String>();
		int checked,notChecked;
		try {
			while(rs.next()){
				System.out.println("Entering");
				checked=0;
				notChecked=0;
				if((rs.getString("CHECKED")).equals("Yes")){
					checked=rs.getInt("COUNT");
					if(rs.isLast()==false){
						String sid=rs.getString("SID");
						rs.next();
						if((rs.getString("SID")).equals(sid))
							notChecked=rs.getInt("COUNT");
						else
							rs.previous();
					}
				}
				else{
					notChecked=rs.getInt("COUNT");
					if(rs.isLast()==false){
						String sid=rs.getString("SID");
						rs.next();
						if((rs.getString("SID")).equals(sid))
							checked=rs.getInt("COUNT");
						else
							rs.previous();
					}
				}
				double d=((double)checked)/(checked+notChecked);
				Double ob=new Double(d);
				String str=ob.toString();
				ar1.add(str);
				System.out.print(str+" ");
				ar2.add(rs.getString("NAME"));
				System.out.println(rs.getString("NAME"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sysPath=getServletContext().getRealPath(File.separator);
		String path=sysPath.concat("TemporaryReport\\Image3.jpg");
		String pdfPath=sysPath.concat("ReportPDF\\ModeratorActivity.pdf");
		ConstructChart ob=new ConstructChart(path,pdfPath);
		ob.constructBarChart("Activity Level of Moderators", "Percentage Activity", "Moderators", ar1, ar2);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		/*ImageIO.write(barChart, "jpg", baos);
		InputStream is = new ByteArrayInputStream(baos.toByteArray());
		byte[] bytes=new byte[4096];
		OutputStream os=response.getOutputStream();
		int read=0;
		while((read=is.read(bytes))!=-1){
			os.write(bytes, 0, read);
		}
		os.flush();*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
