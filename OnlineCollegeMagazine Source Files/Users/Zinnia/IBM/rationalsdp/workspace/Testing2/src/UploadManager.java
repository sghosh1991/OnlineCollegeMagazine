


import java.io.File;
import java.io.IOException;
import java.util.ListIterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




/**
 * Servlet implementation class UploadManager
 */
public class UploadManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
    private String filePath;
    private long maxFileSize = 7 * 1024 * 1024;
    private int maxMemSize = 4 * 1024 ;
    private File file ; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public void init( ){
        // Get the file location where it would be stored.
        filePath = 
               getServletContext().getInitParameter("picture-file"); 
     }
    public UploadManager() {
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
	      System.out.println("file factory");
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      System.out.println("Setting maximum memory size");
	      factory.setSizeThreshold(maxMemSize);
	      System.out.println("Setting temporary");
	      factory.setRepository(new File("C:\\temp"));
	      System.out.println("getting upload handler");
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      try{
	    	  ListIterator i = upload.parseRequest(request).listIterator();
	    	  
	    	  out.println("<html>");
	          out.println("<head>");
	          out.println("<title>Servlet upload</title>");  
	          out.println("</head>");
	          out.println("<body>");
	          System.out.println("Starting iteration");
	          System.out.println("i.hasnext() value="+i.hasNext());
	          while ( i.hasNext () ) 
	          {
	        	 System.out.println("Entered loop");
	             FileItem fi = (FileItem)i.next();
	             if ( !fi.isFormField () )	
	             {
	            	 System.out.println("starting file processing");
	                // Get the uploaded file parameters
	                String fieldName = fi.getFieldName();
	                String fileName = fi.getName();
	                System.out.println("file name is "+fileName);
	                String contentType = fi.getContentType();
	                boolean isInMemory = fi.isInMemory();
	                long sizeInBytes = fi.getSize();
	                if( fileName.lastIndexOf("\\") >= 0 ){
	                    file = new File( filePath + 
	                    fileName.substring( fileName.lastIndexOf("\\"))) ;
	                }
	                else{
	                    file = new File( filePath + 
	                    fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	                 }
	                fi.write( file ) ;
	                out.println("Uploaded Filename: " + fileName + "<br>");
	                out.println("</body>");
	                out.println("</html>");
	             }
	          } 
	            
	      }catch(Exception e){
	    	  e.printStackTrace();
	      }
	}

}
