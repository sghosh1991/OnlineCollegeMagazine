

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CategoryAverageRating
 */
public class CategoryAverageRating extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryAverageRating() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String query="SELECT CATEGORY,AVG(RATE) FROM \"santosh\".VALIDATED_ARTICLES GROUP BY CATEGORY";
		String title="Average Rating of Articles in each Category";
		String categoryAxisLabel="Category";
		String valueAxisLabel="Average Rating";
		String sysPath=getServletContext().getRealPath(File.separator);
		String path=sysPath.concat("TemporaryReport\\Image1.jpg");
		String pdfPath=sysPath.concat("ReportPDF\\CategoryAverageRating.pdf");
		GenerateImage gi=new GenerateImage(title,path,pdfPath);
		gi.generateBarChart(query,categoryAxisLabel,valueAxisLabel);
		/*ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(barChart, "jpg", baos);
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
