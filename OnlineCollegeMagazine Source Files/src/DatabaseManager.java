import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * 
 */

/**
 * @author Zinnia
 *
 */
public class DatabaseManager {
		private static boolean busy=false;
		
	/**
	 * @param args
	 */
	public DatabaseManager(){
		
	}
	public int updateDatabase(String query){
		int no=0;
		if(!busy){
		try{
			System.out.println("Inside try of db");
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/MAGDB","sinergia","iem");
			System.out.println("IN DB MANAGER: QUERY IS"+ query);
			PreparedStatement ps=con.prepareStatement(query);
			no=ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		}
		return no;
	}
	public ResultSet searchDatabase(String query){
		if(!busy){
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/MAGDB","sinergia","iem");
			PreparedStatement ps=con.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs=ps.executeQuery();
			return rs;
		}catch(Exception e){
			e.printStackTrace();
		}
		}
		return null;
	}
	public int backupDatabase(){
		int diff=0;
		try {
			File f=new File("C:/backup");
			int beforeBackup= f.listFiles().length;
			System.out.println(beforeBackup);
		      String line;
		      Runtime r=Runtime.getRuntime();
		      busy=true;
		      java.lang.Process p1=r.exec("cmd /c db2cmd db2 connect to MAGDB user sinergia using iem");
		      BufferedReader bri = new BufferedReader
		        (new InputStreamReader(p1.getInputStream()));
		      BufferedReader bre = new BufferedReader
		        (new InputStreamReader(p1.getErrorStream()));
		      while ((line = bri.readLine()) != null) {
		        System.out.println(line);
		      }
		      bri.close();
		      while ((line = bre.readLine()) != null) {
		        System.out.println(line);
		      }
		      bre.close();
		      p1.waitFor();
		     java.lang.Process p2=r.exec("cmd /c db2cmd db2 force applications all");
		      bri = new BufferedReader
		        (new InputStreamReader(p2.getInputStream()));
		      bre = new BufferedReader
		        (new InputStreamReader(p2.getErrorStream()));
		      while ((line = bri.readLine()) != null) {
		        System.out.println(line);
		      }
		      bri.close();
		      while ((line = bre.readLine()) != null) {
		        System.out.println(line);
		      }
		      bre.close();
		      p2.waitFor();
		      Thread.sleep(55000);
		      java.lang.Process p3=r.exec("cmd /c db2cmd db2 backup database MAGDB user sinergia using iem to C:\\backup");
		      bri = new BufferedReader
		        (new InputStreamReader(p3.getInputStream()));
		      bre = new BufferedReader
		        (new InputStreamReader(p3.getErrorStream()));
		      while ((line = bri.readLine()) != null) {
		        System.out.println(line);
		      }
		      bri.close();
		      while ((line = bre.readLine()) != null) {
		        System.out.println(line);
		      }
		      bre.close();
		      p3.waitFor();
		      busy=false;
		      Thread.sleep(5000);
		      int afterBackup= f.listFiles().length;
		      System.out.println(afterBackup);
		      System.out.println("Done.");
		      diff=afterBackup-beforeBackup;
		      
		    }
		    catch (Exception err) {
		      err.printStackTrace();
		    }
		    return diff;
	}
	public void restoreDatabase(String image){
		try {
			
		      String line;
		      Runtime r=Runtime.getRuntime();
		      busy=true;
		      java.lang.Process p1 = r.exec("cmd /c db2cmd db2 connect to MAGDB user sinergia using iem");
		      BufferedReader bri = new BufferedReader
		        (new InputStreamReader(p1.getInputStream()));
		      BufferedReader bre = new BufferedReader
		        (new InputStreamReader(p1.getErrorStream()));
		      while ((line = bri.readLine()) != null) {
		        System.out.println(line);
		      }
		      bri.close();
		      while ((line = bre.readLine()) != null) {
		        System.out.println(line);
		      }
		      bre.close();
		      p1.waitFor();
		     java.lang.Process p2=r.exec("cmd /c db2cmd db2 force applications all");
		      bri = new BufferedReader
		        (new InputStreamReader(p2.getInputStream()));
		      bre = new BufferedReader
		        (new InputStreamReader(p2.getErrorStream()));
		      while ((line = bri.readLine()) != null) {
		        System.out.println(line);
		      }
		      bri.close();
		      while ((line = bre.readLine()) != null) {
		        System.out.println(line);
		      }
		      bre.close();
		      p2.waitFor();
		      Thread.sleep(55000);
		      String s="cmd /c db2cmd db2 restore database MAGDB user sinergia using iem from C:\\backup taken at "+image;
		      java.lang.Process p3=r.exec(s);
		      bri = new BufferedReader
		        (new InputStreamReader(p3.getInputStream()));
		      bre = new BufferedReader
		        (new InputStreamReader(p3.getErrorStream()));
		      while ((line = bri.readLine()) != null) {
		        System.out.println(line);
		      }
		      bri.close();
		      while ((line = bre.readLine()) != null) {
		        System.out.println(line);
		      }
		      bre.close();
		      p3.waitFor();
		      busy=false;
		      System.out.println("Done.");
		    }
		    catch (Exception err) {
		      err.printStackTrace();
		    }


	}
}
