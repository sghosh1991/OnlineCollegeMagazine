

import java.io.File;
import java.io.IOException;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadIssue
 */
public class UploadIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int maxMemSize = 4 * 1024 ;
	private boolean isMultipart;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadIssue() {
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
		 isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	      java.io.PrintWriter out = response.getWriter( );
	      DiskFileItemFactory factory = new DiskFileItemFactory();	    
	      factory.setSizeThreshold(maxMemSize);	      
	      String tempPath=getServletContext().getRealPath(File.separator);
	      tempPath=tempPath.concat("temp");
	      factory.setRepository(new File(tempPath));	      
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      try{
	    	  ListIterator i = upload.parseRequest(request).listIterator();
	          String issueName=null;
	          String filePath=null;
	          String pdfFilePath=null;
	          String pictureFilePath=null;
	          String pdf="IssuePDF\\";
	          String picture="IssueCover\\";
	          File file=null;
	          while ( i.hasNext () ) {
	        	  FileItem fi = (FileItem)i.next();
	        	  String fieldName = fi.getFieldName();
		             if ( !fi.isFormField () )	
		             {
		            	filePath = getServletContext().getRealPath(File.separator);
		            	if(fieldName.equals("issuepdf")){
		            		pdfFilePath=filePath.concat("IssuePDF\\");
		            		String fileName = fi.getName();
		            		if( fileName.lastIndexOf("\\") >= 0 ){
		            			pdfFilePath = pdfFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            			pdf=pdf.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            		}
		            		else{
		            			pdfFilePath = pdfFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            			pdf=pdf.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            		}
		            		System.out.println("pdf:"+pdf);
		            		System.out.println("pdfFilePath:"+pdfFilePath);
		            		file=new File(pdfFilePath);
		            	}
		            	else{
		            		pictureFilePath=filePath.concat("IssueCover\\");
		            		String fileName = fi.getName();
		            		if( fileName.lastIndexOf("\\") >= 0 ){
		            			pictureFilePath = pictureFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            			picture=picture.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            		}
		            		else{
		            			pictureFilePath = pictureFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            			picture=picture.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
		            		}
		            		System.out.println("picture:"+picture);
		            		System.out.println("pictureFilePath:"+pictureFilePath);
		            		file=new File(pictureFilePath);
		            	}
		            		
		            		fi.write( file ) ;
		            }
		            else{
		            	 if(fieldName.equals("issuename")){
		            		 issueName=fi.getString();
		            		 System.out.println("Name of issue is: "+issueName);
		            	 }
		           }
		      }
	          DatabaseManager db=new DatabaseManager();
	          String query1="INSERT INTO \"santosh\".ISSUES(NAME,COVER_PICTURE,FILE_PATH) VALUES('"+issueName+"','"+picture+"','"+pdf+"')";
	          String query2="UPDATE \"santosh\".VALIDATED_ARTICLES SET ISSUE_NAME='"+issueName+"' WHERE ISSUE_NAME IS NULL";
	          int no=db.updateDatabase(query1);
	          if(no==0){
	        	  request.setAttribute("duplicate", "Yes");
	          }
	          else{
	        	  no=db.updateDatabase(query2);
	        	  if(no==0)
	        		  request.setAttribute("noArticle", "Yes");
	        	  else
	        		  request.setAttribute("success", "Yes");
	          }
	          RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
			  view.forward(request, response);
	      }catch(Exception e){
	    	  
	      }
}
}
