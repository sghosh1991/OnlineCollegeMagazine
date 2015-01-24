

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EnhanceRegexSERVLET
 */
public class EnhanceRegexSERVLET extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnhanceRegexSERVLET() {
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
		String slang=(String)request.getParameter("slang");
		try{
			String sysPath=getServletContext().getRealPath(File.separator);
			EnhanceRegexMODEL reg= new EnhanceRegexMODEL(sysPath);
			reg.enhance(slang);
			request.setAttribute("enhance", "success");
	    	  RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
			  view.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	}

