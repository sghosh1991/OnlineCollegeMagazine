

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class localLanguageGeneratorServlet
 */
public class localLanguageGeneratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public localLanguageGeneratorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currLang=(String)request.getParameter("lang");
        System.out.println("IN SERVLET..PARAMETER--->  "+currLang);
        HttpSession session = request.getSession(); 
        
        session.setAttribute("localLang", currLang);        // for future pages
       // request.setAttribute("currLang", currLang);         //for home page
        
            newpackage.localContent l=new  newpackage.localContent();
            HashMap <String,String> eng2lang=l.getLang(currLang);
            //request.setAttribute("lang", eng2lang);
           RequestDispatcher  view=request.getRequestDispatcher("HomePage.jsp");
	   view.forward(request, response);

        
        

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
