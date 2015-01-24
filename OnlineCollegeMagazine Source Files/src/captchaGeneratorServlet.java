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
public class captchaGeneratorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public captchaGeneratorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("i am in captcha servlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("i am in captcha servlet");
            int width = 300;
	    int height = 70;
	    System.out.println("I AM IN CAPTCHA");
	    char data[][] = new char[100][];
	    System.out.println("Character array created");
		  SecureRandom random = new SecureRandom();
		  System.out.println("Random object generated");
		  for(int i=0;i<100;i++){
		    String str=new BigInteger(35, random).toString(10);
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
	    System.out.println("The generated captcha is: "+captcha);
	    request.getSession().setAttribute("captcha", captcha );
	    System.out.println("the length is: "+data[index].length);
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

