import java.awt.Image;
import java.awt.Toolkit;
import java.awt.geom.Rectangle2D;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

import javax.imageio.ImageIO;

import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;


public class PDFToImage {
	
	static Image image;
	public int pdfToImage (String fullPDFPath,String sysPath,String articleName) {
		try{
		  //pdfpath="C:\\Documents and Settings\\M.K.Ghosh\\IBM\\rationalsdp\\workspace\\xyz\\WebContent\\"+pdfpath;
		  //System.out.println("PDFNAME1 : "+ pdfpath);
		  RandomAccessFile raf = new RandomAccessFile (new File (fullPDFPath), "r");
	      FileChannel fc = raf.getChannel ();
	      ByteBuffer buf = fc.map (FileChannel.MapMode.READ_ONLY, 0, fc.size ());
	      PDFFile pdfFile = new PDFFile (buf);
	      String pdfname=fullPDFPath.substring(fullPDFPath.lastIndexOf("\\"));
	      pdfname=pdfname.substring(1,pdfname.lastIndexOf("."));
	      

	      int numpages = pdfFile.getNumPages ();
	      System.out.println ("Number of pages = "+numpages);
	      
	      for(int i=0;i<numpages;i++){

	      PDFPage page = pdfFile.getPage (i);
	              
	      Rectangle2D r2d = page.getBBox ();

	      double width = r2d.getWidth ();
	      double height = r2d.getHeight ();
	      width /= 72.0;
	      height /= 72.0;
	      System.out.println("WIDTH: "+ width+"  HEIGHT: "+height);
	      int res = Toolkit.getDefaultToolkit ().getScreenResolution ();
	      width *= res;
	      height *= res;
	      System.out.println("WIDTH: "+ width+"  HEIGHT: "+height);
	      image = page.getImage ((int) width, (int) height, r2d, null, true, true);
	      System.out.println("IMAGE created" + image);
	      
	      
	      // Create a Directory
	      String articleViewPath=sysPath.concat("Articles\\"+articleName);
	      File f=new File(articleViewPath);
			//System.out.println("BEFORE MAKING A DIRECTORY:  "+ "C:\\Documents and Settings\\M.K.Ghosh\\IBM\\rationalsdp\\workspace\\xyz\\WebContent\\article_images/"+pdfname);
			f.mkdir();
			//int x;
			//String path=f.getAbsolutePath();
			/*while((x=path.indexOf('\\'))!=-1){
				System.out.println("location of \\: "+ x);
				path=path.replace("\\", "/");
			}*/
			//System.out.println("MODIFIED PATH: "+ path+"/page"+i+".png");
			
			
			RenderedImage ri=(RenderedImage)image;
			int j=i+1;
			File file=new File(articleViewPath+"\\page"+j+".png");
			
			ImageIO.write(ri, "PNG", file);
	      }
	      return numpages;
	}catch(Exception e){
		e.printStackTrace();
	}
	return 0;
  }
}
