

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
 * Servlet implementation class CategoryRejectionRate
 */
public class CategoryRejectionRate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryRejectionRate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String query1="SELECT CATEGORY,COUNT(*) \"COUNT\" FROM \"santosh\".PENDING_ARTICLES WHERE (DAY(CURRENT DATE)-DAY(POST_DATE))<30 AND CHECKED='Yes' GROUP BY CATEGORY ORDER BY CATEGORY";
		String query2="SELECT CATEGORY,COUNT(*) \"COUNT\" FROM \"santosh\".VALIDATED_ARTICLES WHERE (DAY(CURRENT DATE)-DAY(VALIDATION_DATE))<30 GROUP BY CATEGORY ORDER BY CATEGORY";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs1=db.searchDatabase(query1);
		ResultSet rs2=db.searchDatabase(query2);
		ArrayList<String> ar1=new ArrayList<String>();
		ArrayList<String> ar2=new ArrayList<String>();
		int checked,accepted,rejected;
		try {
			while(rs1.next()){
				accepted=0;
				checked=rs1.getInt("COUNT");
				if(rs2.isLast()==false){
					rs2.next();
					if((rs2.getString("CATEGORY")).equals(rs1.getString("CATEGORY")))
						accepted=rs2.getInt("COUNT");
					else
						rs2.previous();
			    }
				rejected=checked-accepted;
				double d=(double)rejected/checked;
				Double ob=new Double(d);
				String str=ob.toString();
				ar1.add(str);
				ar2.add(rs1.getString("CATEGORY"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sysPath=getServletContext().getRealPath(File.separator);
		String path=sysPath.concat("TemporaryReport\\Image2.jpg");
		String pdfPath=sysPath.concat("ReportPDF\\CategoryRejectionRate.pdf");
		ConstructChart ob=new ConstructChart(path,pdfPath);
		ob.constructBarChart("Rejection rate of categories", "Rejection Rate", "Categories", ar1, ar2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
