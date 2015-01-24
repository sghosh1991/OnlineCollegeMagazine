

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.pdfview.PDFViewer;
/**
 * Servlet implementation class ArticleValidateServlet
 */
public class ArticleValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleValidateServlet() {
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
		String sid=null;
		String pid=request.getParameter("pid");
		String name=request.getParameter("articleName");
		String pdfPath=request.getParameter("pdfPath");
		String rid=request.getParameter("rid");
		String category=request.getParameter("category");
		String picturePath=request.getParameter("picturePath");
		String snippet=request.getParameter("snippet");
		String chosen=request.getParameter("chosen");
		PDFToImage pdf= new PDFToImage();
		String sysPath=getServletContext().getRealPath(File.separator);
		String fullPDFPath=sysPath.concat(pdfPath);
		int pageno=pdf.pdfToImage(fullPDFPath,sysPath,name);
		System.out.println(pageno);
		String articleViewPath="Articles\\";
		articleViewPath=articleViewPath.concat(name);
		HttpSession session=request.getSession();
		sid=(String)session.getAttribute("SID");
		DatabaseManager db=new DatabaseManager();
		String searchAuthor="SELECT NAME,EMAIL FROM \"santosh\".REGISTERED_MEMBERS WHERE RID='"+rid+"'";
		ResultSet rs=db.searchDatabase(searchAuthor);
		String query1="VALUES NEXTVAL FOR \"santosh\".VALIDATED_ARTICLES_SEQ";
  	  ResultSet rs1=db.searchDatabase(query1);
  	  String authorName=null;
  	  String seqVal=null;
  	  String recipient=null;
  	  String modifyChecked="UPDATE \"santosh\".PENDING_ARTICLES SET CHECKED='Yes' WHERE PID='"+pid+"'";
  	  db.updateDatabase(modifyChecked);
		try {
			if(rs.next()){
				authorName=rs.getString("NAME");
				recipient=rs.getString("EMAIL");
			}
			if(rs1.next())
				seqVal=rs1.getString(1);
			String query2="INSERT INTO \"santosh\".VALIDATED_ARTICLES(VID,FILE_PATH,NAME,CATEGORY,AUTHOR_NAME,SID,RID,PICTURE_PATH,SNIPPET,CHOSEN,PAGENO,PDF_PATH) VALUES('"+seqVal+"','"+articleViewPath+"','"+name+"','"+category+"','"+authorName+"','"+sid+"','"+rid+"','"+picturePath+"','"+snippet+"','"+chosen+"',"+pageno+",'"+pdfPath+"')";
			db.updateDatabase(query2);
			String query3="SELECT TAGS FROM \"santosh\".PENDING_ART_TAGS WHERE PID='"+pid+"'";
			ResultSet rs2=db.searchDatabase(query3);
			while(rs2.next()){
				String tag=rs2.getString("TAGS");
				String insert="INSERT INTO \"santosh\".VALIDATED_ART_TAGS(VID,TAGS) VALUES('"+seqVal+"','"+tag+"')";
				db.updateDatabase(insert);
			}
			String msg="Congratulations! Your article "+name+" under the category "+category+" have been successfully validated";
			String subject="Article Validation";
			MainMail ob=new MainMail(msg,recipient,subject);
				ob.callMailUtil();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("validate", "success");
  	  RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
		  view.forward(request, response);
		
	}

}

