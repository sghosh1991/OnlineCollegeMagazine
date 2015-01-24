import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.*;
import java.math.BigInteger;
import java.net.*;

import java.security.SecureRandom;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class captcha
 */
public class captcha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public captcha() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("i am in captcha servlet");
        int width = 200;
    int height = 70;
    System.out.println("I AM IN CAPTCHA");
    /*char data[][] = {
        { 'z', 'o', '8', 'c', 'o', 'r', 'n' },
        { 'l', 'i', 'n', 'u', 'x' },
        { 'f', 'r', 'e', 'e', 'o', 'N' },
        { 'u', 'r', 'b', 'a', 'n', 'd','r','e','a','m'},
        { 'j', 'e', 'e' },
        {'x','1','u','6','c','c'},
        {'i','e','m','2','0','1','2'},
        {'c','a','m','o','f','l','o','u','g','e'},
        {'m','a','N','h','a','T','t','0','N'},
        {'1','s','a','n','n','t','i','8','4'},
        {'p','H','E','o','n','I','x',' ','p','r','o','j'},
        {'a','P','R','o','d','I','s','i','a','C'},
        {'z','I','N','Z','i','n'},
        {'a','R','p','a','N','D'},
        {'A','n','W','e','s','H','a'},
        
    };*/
    char data[][] = new char[100][];
    System.out.println("Character array created");
	  SecureRandom random = new SecureRandom();
	  System.out.println("Random object generated");
	  for(int i=0;i<100;i++){
	    String str=new BigInteger(20, random).toString(10);
	    data[i]=str.toCharArray();
	    int len=data[i].length;
	    for(int j=0;j<len;j++){
	    	System.out.print(data[i][j]);
	    }
	    System.out.println();
	 }  


    BufferedImage bufferedImage = new BufferedImage(width, height, 
                  BufferedImage.TYPE_INT_RGB);

    Graphics2D g2d = bufferedImage.createGraphics();

    Font font = new Font("Georgia", Font.BOLD, 18);
    g2d.setFont(font);

    RenderingHints rh = new RenderingHints(
           RenderingHints.KEY_ANTIALIASING,
           RenderingHints.VALUE_ANTIALIAS_ON);

    rh.put(RenderingHints.KEY_RENDERING, 
           RenderingHints.VALUE_RENDER_QUALITY);

    g2d.setRenderingHints(rh);

    GradientPaint gp = new GradientPaint(0, 0, 
    Color.red, 0, height/2, Color.black, true);

    g2d.setPaint(gp);
    g2d.fillRect(0, 0, width, height);

    g2d.setColor(new Color(255, 153, 0));

    Random r = new Random();
    int index = Math.abs(r.nextInt()) % 100;

    String captcha = String.copyValueOf(data[index]);
    request.getSession().setAttribute("captcha", captcha );

    int x = 0; 
    int y = 0;

    for (int i=0; i<data[index].length; i++) {
        x += 10 + (Math.abs(r.nextInt()) % 25);
        y = 20 + Math.abs(r.nextInt()) % 30;
        g2d.drawChars(data[index], i, 1, x, y);
    }

    g2d.dispose();
        
    String path=getServletContext().getRealPath(File.separator);
    path=path.concat("images\\CaptchaImage\\captcha.png");
    File f=new File(path);
    if(f.exists())
    f.delete();
    f=new File(path);
    f.createNewFile();
response.setContentType("text/html");
PrintWriter os = response.getWriter();
ImageIO.write(bufferedImage, "png", f);
    os.print(captcha);
os.close();
} 
}
