

import java.io.File;
import java.io.IOException;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadPicture
 */
public class UploadPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
    //private String filePath;
    private long maxFileSize = 7 * 1024 * 1024;
    private int maxMemSize = 4 * 1024 ;
 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadPicture() {
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
	      String picture="UserProfilePictures\\";
	      try{
	    	  ListIterator i = upload.parseRequest(request).listIterator();
	          System.out.println("Starting iteration");
	          System.out.println("i.hasnext() value="+i.hasNext());
	          while ( i.hasNext () ) 
	          {
	        	 System.out.println("Entered loop");
	             FileItem fi = (FileItem)i.next();
	             if ( !fi.isFormField () )	
	             {
	            	String filePath = getServletContext().getRealPath(File.separator);
	            	filePath=filePath.concat("UserProfilePictures\\");
	            	int no=0;
	            	String fileName = fi.getName();
	            	if( fileName.lastIndexOf("\\") >= 0 ){
	                	filePath = filePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
	                	picture=picture.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
	                }
	                else{
	                	filePath = filePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
	                	picture=picture.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
	                 }
	            	File file=new File(filePath);
	                System.out.println(file);
	                fi.write( file ) ;
	                HttpSession session=request.getSession(false);
	                if(session!=null){
	                	String rid=(String)session.getAttribute("RID");
	                	DatabaseManager db=new DatabaseManager();
	                	String query="update \"santosh\".REGISTERED_MEMBERS set PICTURE_PATH='"+picture+"' where RID='"+rid+"'";
	                	no=db.updateDatabase(query);
	                }
	                if(no>0){
	                out.println("Picture successfully uploaded!!");
	                out.println("File path is: " + filePath + "<br>");
	                }
	                out.println("</body>");
	                out.println("</html>");
	             }
	          } 
	            
	      }catch(Exception e){
	    	  e.printStackTrace();
	      }

	}

}
