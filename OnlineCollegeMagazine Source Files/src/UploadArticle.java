

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
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
 * Servlet implementation class UploadArticle
 */
public class UploadArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int maxMemSize = 4 * 1024 ;
	private boolean isMultipart;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadArticle() {
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
	      String pdfFilePath=null;
	      String pictureFilePath=null;
	      String pdf="ArticlePDF\\";
	      String picture="ArticlePicture\\";
	      String articleName=null;
	      String category=null;
	      String snippet=null;
	      String[] tags=new String[7];
	      int x=0;
	      File file;
	      try{
	    	  ListIterator i = upload.parseRequest(request).listIterator();
	    	  String filePath = getServletContext().getRealPath(File.separator);
	    	  while ( i.hasNext () ) {
	        	  FileItem fi = (FileItem)i.next();
	        	  String fieldName = fi.getFieldName();
		             if ( !fi.isFormField () )	
		             {
		            	 if(fieldName.equals("articlePDF")){
		            		 pdfFilePath=filePath.concat("ArticlePDF\\");
		            		 String fileName = fi.getName();
			            		if( fileName.lastIndexOf("\\") >= 0 ){
			            			pdfFilePath = pdfFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			pdf=pdf.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			System.out.println("pdfFilePath: "+pdfFilePath);
			            			System.out.println("pdf: "+pdf);
			            		}
			            		else{
			            			pdfFilePath = pdfFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			pdf=pdf.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			System.out.println("pdfFilePath: "+pdfFilePath);
			            			System.out.println("pdf: "+pdf);
			            		}
			            		file=new File(pdfFilePath);
		            	 }
		            	 else{
		            		 pictureFilePath=filePath.concat("ArticlePicture\\");
		            		 String fileName=fi.getName();
		            		 if( fileName.lastIndexOf("\\") >= 0 ){
			            			pictureFilePath = pictureFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			picture=picture.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			System.out.println("pictureFilePath: "+pictureFilePath);
			            			System.out.println("picture: "+picture);
			            		}
			            		else{
			            			pictureFilePath = pictureFilePath.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			picture=picture.concat(fileName.substring(fileName.lastIndexOf("\\")+1));
			            			System.out.println("pictureFilePath: "+pictureFilePath);
			            			System.out.println("picture: "+picture);
			            		}
		            		 file=new File(pictureFilePath);
		            	 }
		            	 fi.write(file);
		             }
		             else{
		            	 if(fieldName.equals("articleName"))
		            		 articleName=fi.getString().toUpperCase();
		            	 else if(fieldName.equals("category"))
		            		 category=fi.getString();
		            	 else if(fieldName.equals("snippet"))
		            		 snippet=fi.getString();
		            	 else{
		            		 tags[x]=fi.getString().toUpperCase();
		            		 x++;
		            	 }
		            		 
		             }
	    	  }
	    	  HttpSession session=request.getSession();
	    	  System.out.println("Getting session object");
	    	  String rid=(String)session.getAttribute("RID");
	    	  System.out.println("The rid is: "+rid);
	    	  String query1="VALUES NEXTVAL FOR \"santosh\".PENDING_ARTICLES_SEQ";
	    	  DatabaseManager db=new DatabaseManager();
	    	  ResultSet rs=db.searchDatabase(query1);
	    	  String seqVal=null;
	    	  if(rs.next())
	    	  seqVal=rs.getString(1);
	    	  System.out.println("The sequence value is: "+seqVal);
	    	  String query2="INSERT INTO \"santosh\".PENDING_ARTICLES(PID,NAME,CATEGORY,FILE_PATH,RID,PICTURE_PATH,SNIPPET) VALUES('"+seqVal+"','"+articleName+"','"+category+"','"+pdf+"','"+rid+"','"+picture+"','"+snippet+"')";
	    	  db.updateDatabase(query2);
	    	  for(x=0;x<5;x++){
	    		String query3="INSERT INTO \"santosh\".PENDING_ART_TAGS(PID,TAGS) VALUES('"+seqVal+"','"+tags[x]+"')";
	    		db.updateDatabase(query3);
	    	  }
	    	  request.setAttribute("post", "success");
	    	  RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
			  view.forward(request, response);
	      }catch(Exception e){
	    	  System.out.println("No success");
	      }
	}

}
