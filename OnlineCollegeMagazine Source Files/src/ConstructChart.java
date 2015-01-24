import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Paint;
import java.awt.GradientPaint;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.TextAnchor;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.DefaultFontMapper;
import com.lowagie.text.pdf.FontMapper;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfTemplate;
import com.lowagie.text.pdf.PdfWriter;


public class ConstructChart {
	String sysPath;
	String pdfPath;
	ConstructChart(String path, String pdf){
		sysPath=path;
		pdfPath=pdf;
	}
	@SuppressWarnings("deprecation")
	public void constructBarChart(String title,String valueAxisLabel,String categoryAxisLabel,ArrayList<String> ar1,ArrayList<String> ar2){
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		int i=0;
		while(i<ar1.size()){
		  double value=Double.parseDouble((String)ar1.get(i));
		  String columnKey=(String)ar2.get(i);
		  dataset.setValue(value, valueAxisLabel, columnKey);
		  i++;
		}
		JFreeChart chart = ChartFactory .createBarChart(
				title, 
				categoryAxisLabel, 
				valueAxisLabel, 
				dataset, 
				PlotOrientation.HORIZONTAL,true, true, false);
		CategoryPlot plot = chart.getCategoryPlot(); 
		plot.setBackgroundPaint(Color.lightGray);
        /*BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(false);
        GradientPaint gp0 = new GradientPaint(
                0.0f, 0.0f, Color.blue, 
                0.0f, 0.0f, new Color(0, 0, 64)
            );
        renderer.setSeriesPaint(0, gp0);*/
		final CategoryItemRenderer renderer = new CustomRenderer(
	            new Paint[] {Color.red, Color.blue, Color.green}
	        );
		renderer.setItemLabelsVisible(true);
        final ItemLabelPosition p = new ItemLabelPosition(
            ItemLabelAnchor.CENTER, TextAnchor.CENTER, TextAnchor.CENTER, 45.0
        );
        renderer.setPositiveItemLabelPosition(p);
        plot.setRenderer(renderer);
		File file=new File(sysPath);
		file.delete();
		File fi=new File(sysPath);
		File pdfFile=new File(pdfPath);
		try {
            ChartUtilities.saveChartAsJPEG(fi,
             chart,700, 300);
            saveChartAsPDF(pdfFile, chart, 400, 300, new DefaultFontMapper(),title);
            } catch (IOException e) {
            System.out.println("Problem in creating chart.");
}
	}
	public static void saveChartAsPDF(File file,
			JFreeChart chart,
			int width, int height,
			FontMapper mapper,String title) throws IOException {
			OutputStream out = new BufferedOutputStream(new FileOutputStream(file));
			writeChartAsPDF(out, chart, width, height, mapper,title);
			out.close();
			}
	public static void writeChartAsPDF(OutputStream out,
			JFreeChart chart,
			int width, int height,
			FontMapper mapper,String title) throws IOException {
			Rectangle pagesize = new Rectangle(width, height);
			Document document = new Document(pagesize, 50, 50, 50, 50);
			try {
			PdfWriter writer = PdfWriter.getInstance(document, out);
			document.addAuthor("Footprints");
			document.addSubject(title);
			document.open();
			PdfContentByte cb = writer.getDirectContent();
			PdfTemplate tp = cb.createTemplate(width, height);
			Graphics2D g2 = tp.createGraphics(width, height, mapper);
			Rectangle2D r2D = new Rectangle2D.Double(0, 0, width, height);
			chart.draw(g2, r2D, null);
			g2.dispose();
			cb.addTemplate(tp, 0, 0);
			}
			catch(DocumentException de) {
			System.err.println(de.getMessage());
			}
			document.close();
			}
}
