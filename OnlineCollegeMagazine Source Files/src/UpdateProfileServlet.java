

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

import org.apache.commons.fileupload.FileItem;

/**
 * Servlet implementation class UpdateProfileServlet
 */
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int maxMemSize = 4 * 1024 ;
	private boolean isMultipart;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
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
	      RequestDispatcher view=null;
	      String fileName=null;
	      try{
	    	  ListIterator i = upload.parseRequest(request).listIterator();
	          System.out.println("Starting iteration");
	          System.out.println("i.hasnext() value="+i.hasNext());
	          String newpass=null,cnewpass=null,oldPass=null;
	          while ( i.hasNext () ) 
	          {
	        	 System.out.println("Entered loop");
	             FileItem fi = (FileItem)i.next();
	             String fieldName = fi.getFieldName();
	             if ( !fi.isFormField () )	
	             {
	            	String filePath = getServletContext().getRealPath(File.separator);
	            	filePath=filePath.concat("UserProfilePictures\\");
	            	int no=0;
	            	fileName = fi.getName();
	            	System.out.println("fileName:"+fileName+"dsd");
	            	if(!fileName.equals("")){
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
	            	}
	             }
	             else{
	            	 if(fieldName.equals("newpass"))
	            		 newpass=fi.getString();
	            	 else if(fieldName.equals("cnewpass"))
	            		 cnewpass=fi.getString();
	            	 else if(fieldName.equals("oldpass"))
	            		 oldPass=fi.getString();
	             }
	          }
	          HttpSession session=request.getSession(false);
	          String type=(String)session.getAttribute("type");
              if(session!=null){
              if(newpass.equals(cnewpass)){
            	  String query;
            	  DatabaseManager db=new DatabaseManager();
            	  PasswordManager pwd=new PasswordManager();
          		String encryptedPassword=pwd.encrypt(newpass);
          		String encryptOld=pwd.encrypt(oldPass);
            	if(type.equals("collegemember")){
            		String rid=(String)session.getAttribute("RID");
            		if(!newpass.equals("")){
            			String checkOld="select PASSWORD from \"santosh\".REGISTERED_MEMBERS where RID='"+rid+"' and PASSWORD='"+encryptOld+"'";
                		ResultSet rs=db.searchDatabase(checkOld);
                		System.out.println("the old password entered is: "+oldPass);
                		System.out.println("The encrypted old password is: "+encryptOld);
                		if(rs.next()){
                			System.out.println("Old password check successful");
                			query="update \"santosh\".REGISTERED_MEMBERS set PASSWORD='"+encryptedPassword+"' where RID='"+rid+"'";
                			db.updateDatabase(query);
                			System.out.println("New password entered");
                		}
                		else{
                			request.setAttribute("invalid","yes");
                			view=request.getRequestDispatcher("UpdateProfile.jsp");
                			view.forward(request, response);
                		}
            		}
            		if(!fileName.equals("")){
            			String pictureQuery="update \"santosh\".REGISTERED_MEMBERS set PICTURE_PATH='"+picture+"' where RID='"+rid+"'";
            			db.updateDatabase(pictureQuery);
            		}
            	}
            	else{
            		String sid=(String)session.getAttribute("SID");
            		if(!newpass.equals("")){
            		String checkOld="select PASSWORD from \"santosh\".SUPERVISOR where PASSWORD='"+encryptOld+"'";
            		ResultSet rs=db.searchDatabase(checkOld);
            		if(rs.next()){
            			query="update \"santosh\".SUPERVISOR set PASSWORD='"+encryptedPassword+"' where SID='"+sid+"'";
            			db.updateDatabase(query);
            		}
            		else{
            			request.setAttribute("invalid","yes");
            			view=request.getRequestDispatcher("UpdateProfile.jsp");
            			view.forward(request, response);
            		}
            		}
            	}
            	
            	request.setAttribute("update", "success");
            	view=getServletContext().getRequestDispatcher("/DisplayProfile");
              }
              else{
            	  request.setAttribute("match","no" );
            	  view=request.getRequestDispatcher("UpdateProfile.jsp");
              }
              view.forward(request, response);
              }
	      }catch(Exception e){
	    	  e.printStackTrace();
	      }
	}

}
