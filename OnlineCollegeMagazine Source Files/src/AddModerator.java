

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddModerator
 */
public class AddModerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddModerator() {
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
		System.out.println("Inside ADD moderator servlet");
		String name=request.getParameter("fname")+" "+request.getParameter("lname");
		PasswordManager pwd=new PasswordManager();
		String generatedPassword=pwd.generate();
		String encryptedPassword=pwd.encrypt(generatedPassword);
		String category=request.getParameter("category");
		System.out.println(name+" "+encryptedPassword+" "+category);
		String query="UPDATE \"santosh\".SUPERVISOR SET NAME='"+name+"',PASSWORD='"+encryptedPassword+"',EMAIL='"+request.getParameter("email")+"' WHERE CATEGORY='"+category+"'";
		DatabaseManager db=new DatabaseManager();
		int no=db.updateDatabase(query);
		if(no>0){
			request.setAttribute("newCategory","No");
			System.out.println("Success!!!");
			request.setAttribute("modName",name);
			request.setAttribute("catName",category);
		}
		else if(no==0){
			query="insert into \"santosh\".SUPERVISOR(SID,NAME,PASSWORD,CATEGORY,EMAIL) values(NEXT VALUE FOR \"santosh\".SUPERVISOR_SEQ,'"+name+"','"+encryptedPassword+"','"+category+"','"+request.getParameter("email")+"')";
			no=db.updateDatabase(query);
			if(no>0)
				request.setAttribute("newCategory","Yes");
				request.setAttribute("modName",name);
				request.setAttribute("catName",category);
		}
		String recipient=request.getParameter("email");
		String msg="Congratulations! You have been successfully added as a Moderator in the "+category+" category for our college magazine Footprints.\nUser ID: "+recipient+"\nPassword:"+generatedPassword;
		String subject="Moderator for Footprints";
		MainMail ob=new MainMail(msg,recipient,subject);
		try {
			ob.callMailUtil();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher view=getServletContext().getRequestDispatcher("/DisplayProfile");
		  view.forward(request, response);
	}

}
