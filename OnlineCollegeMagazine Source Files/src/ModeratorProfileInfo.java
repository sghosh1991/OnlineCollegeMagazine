import java.sql.*;
public class ModeratorProfileInfo {
	public ResultSet getPendingArticleList(String category){
		DatabaseManager db=new DatabaseManager();
		String query="select * from \"santosh\".PENDING_ARTICLES where CATEGORY='"+category+"' and CHECKED='No'";
		ResultSet rs=db.searchDatabase(query);
		return rs;
		
	}
	public String getCategory(String sid){
		try{
		DatabaseManager db=new DatabaseManager();
		String query="select CATEGORY from \"santosh\".SUPERVISOR where SID='"+sid+"'";
		ResultSet rs=db.searchDatabase(query);
		rs.next();
		String category=rs.getString("CATEGORY");
		return category;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
}
