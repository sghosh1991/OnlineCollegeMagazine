

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 * Servlet implementation class DisplayProfile
 */
public class DisplayProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		RequestDispatcher view=null;
		
		/*if(session.isNew()){
			System.out.println(" THIS IS A NEW SESSION ");
		}
		System.out.println(" THE SESSION IS:" + session);
		RequestDispatcher view=null;
		System.out.println(" iam in display profile");
		if(session==null){
			request.setAttribute("Error", "Sorry your session has expired. please login again");
			view= request.getRequestDispatcher("Login.jsp");
		}*/
		
		String type=(String)session.getAttribute("type");
		if(type==null){
			request.setAttribute("Error", "Please login to continue.");
			view= request.getRequestDispatcher("Login.jsp");
			view.forward(request, response);
		}
		
		if(type.equals("collegemember")){
			System.out.println("In display profile");
			UserProfileInfo UI=new UserProfileInfo();
			String pic=UI.getPicturePath((String)session.getAttribute("RID"));
			System.out.println("got the pic path:"+pic);
			ResultSet rs=UI.getArticles((String)session.getAttribute("RID"));
			System.out.println("Got the articles result set");
			request.setAttribute("picture_path", pic);
			request.setAttribute("articles", rs);
			ResultSet rs1=UI.getCategories();
			request.setAttribute("categories", rs1);
			ResultSet rs2=UI.getPendingArticles((String)session.getAttribute("RID"));
			request.setAttribute("pending", rs2);
			System.out.println("JUST BEFORE CREATING VIEW");
			System.out.println("PICTURE PATH IN DATABASE IS : "+ pic);
			view = request.getRequestDispatcher("UserProfile.jsp");
			
		}
		else if(type.equals("moderator")){
			ModeratorProfileInfo MI=new ModeratorProfileInfo();
			String category=MI.getCategory((String)session.getAttribute("SID"));
			ResultSet rs=MI.getPendingArticleList(category);
			request.setAttribute("category", category);
			request.setAttribute("pending_articles", rs);
			view = request.getRequestDispatcher("ModeratorProfile.jsp");
		}
		
		else if(type.equals("admin")){
			System.out.println("In display profile");
			AdminProfileInfo AI=new AdminProfileInfo();
			ResultSet rs1=AI.getValidArticleList();
			request.setAttribute("publishArticle",rs1);
			ResultSet rs2=AI.getReportCommentList();
			request.setAttribute("reportComment", rs2);
			view=request.getRequestDispatcher("AdminProfile.jsp");
		}
		
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
