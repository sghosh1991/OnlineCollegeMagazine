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

	/**
	 * @param args
	 */
	public int updateDatabase(String query){
		int no=0;
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/MAGDB","sinergia","iem");
			PreparedStatement ps=con.prepareStatement(query);
			no=ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return no;
	}
	public ResultSet searchDatabase(String query){
		try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/MAGDB","sinergia","iem");
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			return rs;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
}
