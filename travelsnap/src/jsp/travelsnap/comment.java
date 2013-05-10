package jsp.travelsnap;

import java.sql.*;

public class comment extends DBrun {

	private int CommID;
	private String Content;
	private String UserName;
	private int PostID;
	private String CommTime;
	private String strSql;

	public comment() {
		this.CommID = 0;
		this.Content = "";
		this.PostID = 0;
		this.UserName = "";
		java.util.Date NowTime = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		this.CommTime = sdf.format(NowTime);
		this.strSql = "";
	}

	public boolean add() {
		this.strSql = "insert into comment(username,postid,content,commtime) values ('"
				+ this.UserName
				+ "','"
				+ this.PostID
				+ "','"
				+ this.Content
				+ "','" + this.CommTime + "')";
		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	public ResultSet show() {
		this.strSql = "select * from comment";
		this.strSql = this.strSql + " where postid = '" + this.PostID + "'";
		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return rs;
	}

	public ResultSet getPID() {
		this.strSql = "select postid from comment";
		this.strSql = this.strSql + " where commid = '" + this.CommID + "'";
		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return rs;
	}

	public ResultSet showall() {
		this.strSql = "select * from comment";
		this.strSql = this.strSql + " where username = '" + this.UserName + "'";
		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return rs;
	}

	public boolean delete(int CommID) {
		this.strSql = "delete from comment";
		this.strSql = this.strSql + " where commid = '" + this.CommID + "'";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	public void setCommID(int CommID) {
		this.CommID = CommID;
	}

	public int getCommID() {
		return this.CommID;
	}

	public void setContent(String Content) {
		this.Content = Content;
	}

	public String getContent() {
		return this.Content;
	}

	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	public String getUserName() {
		return this.UserName;
	}

	public void setPostID(int PostID) {
		this.PostID = PostID;
	}

	public int getPostID() {
		return this.PostID;
	}

	public void setCommTime(String CommTime) {
		this.CommTime = CommTime;
	}

	public String getCommTime() {
		return this.CommTime;
	}
}
