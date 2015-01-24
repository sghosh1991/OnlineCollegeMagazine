import java.sql.ResultSet;



public class AdminProfileInfo {
	public ResultSet getValidArticleList(){
		String query="SELECT NAME, PDF_PATH FROM \"santosh\".VALIDATED_ARTICLES WHERE ISSUE_NAME IS NULL";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=null;
		rs=db.searchDatabase(query);
		return rs;
	}
	public ResultSet getReportCommentList(){
		String query="SELECT C.COM_ID \"COM_ID\",C.CONTENT \"CONTENT\" ,RM.NAME \"NAME\" FROM \"santosh\".COMMENTS C LEFT JOIN \"santosh\".REGISTERED_MEMBERS RM ON C.RID=RM.RID  WHERE C.REPORT_COUNT>0";
		DatabaseManager db=new DatabaseManager();
		ResultSet rs=null;
		rs=db.searchDatabase(query);
		return rs;
	}
}

