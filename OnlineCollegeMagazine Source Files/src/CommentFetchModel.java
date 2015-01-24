import java.sql.*;


public class CommentFetchModel {
	
	public ResultSet getComments(String vid){
		DatabaseManager db=new DatabaseManager();
		System.out.println("VID is: "+vid);
		String query="SELECT R.PICTURE_PATH,R.NAME,C.CONTENT,C.COMMENT_DATE FROM \"santosh\".COMMENTS C left join \"santosh\".REGISTERED_MEMBERS R on C.RID=R.RID WHERE VID='"+vid+"'";
		ResultSet rs=db.searchDatabase(query);
		return rs;
	}
}
