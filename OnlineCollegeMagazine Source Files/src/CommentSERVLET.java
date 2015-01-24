

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CommentSERVLET
 */
public class CommentSERVLET extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentSERVLET() {
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
		String comment=null;
		RequestDispatcher view=null;
		System.out.println("I AM IN SERVLET");
		try{
			CommentFiltration cf=new CommentFiltration();
			comment=(String)request.getParameter("comment");
			if(cf.filter(comment)){
				request.setAttribute("profane", "true");
				view=request.getRequestDispatcher("Comment.jsp");
				view.forward(request, response);
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	}

