import java.sql.*;
public class UserProfileInfo {
	public String getPicturePath(String rid){
		try{
		DatabaseManager db=new DatabaseManager();
		String query="select PICTURE_PATH from \"santosh\".REGISTERED_MEMBERS where RID='" + rid+ "'"; 
		ResultSet rs=db.searchDatabase(query);
		rs.next();
		String picture_path=rs.getString("PICTURE_PATH");
		System.out.println(picture_path);
		db=null;
		return picture_path;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
		}
	public ResultSet getArticles(String rid){
		
		DatabaseManager db=new DatabaseManager();
		String query="select * from \"santosh\".PENDING_ARTICLES left outer join \"santosh\".VALIDATED_ARTICLES on \"santosh\".PENDING_ARTICLES.NAME=\"santosh\".VALIDATED_ARTICLES.NAME where \"santosh\".PENDING_ARTICLES.RID='" + rid+ "' and (DAY(CURRENT DATE)-DAY(\"santosh\".PENDING_ARTICLES.POST_DATE))<30";
		ResultSet rs=db.searchDatabase(query);
		db=null;
		return rs;
		
	}
	public ResultSet getCategories(){
		DatabaseManager db=new DatabaseManager();
		String query="select CATEGORY from \"santosh\".SUPERVISOR where CATEGORY is not null";
		ResultSet rs=db.searchDatabase(query);
		db=null;
		return rs;
	}
	public ResultSet getPendingArticles(String rid){
		DatabaseManager db=new DatabaseManager();
		String query="select * from \"santosh\".PENDING_ARTICLES where RID='"+rid+"' and CHECKED='No' order by CATEGORY desc";
		ResultSet rs=db.searchDatabase(query);
		return rs;
	}
}
