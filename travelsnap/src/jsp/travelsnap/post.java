package jsp.travelsnap;

import java.sql.ResultSet;

public class post extends DBrun {
	private int PostID;
	private String Title;
	private String Content;
	private String PostTime;
	private String Location;
	private double Lat;
	private double Lng;
	private String UserName;

	private String strSql;

	public post() {
		this.PostID = 0;
		this.Title = "";
		this.Content = "";
		java.util.Date NowTime = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		this.PostTime = sdf.format(NowTime);
		this.Location = "";
		this.setLat(0);
		this.setLng(0);
		this.UserName = "";
		this.strSql = "";
	}

	public boolean add() {
		this.strSql = "insert into post (title,content,time,username,location) values ('"
				+ this.Title
				+ "','"
				+ this.Content
				+ "','"
				+ this.PostTime
				+ "','" + this.UserName + "','" + this.Location + "')";
		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	public String addP() {
		this.strSql = "insert into post (title,content,time,username,location) values ('"
				+ this.Title
				+ "','"
				+ this.Content
				+ "','"
				+ this.PostTime
				+ "','" + this.UserName + "','" + this.Location + "')";
		super.exeSql(this.strSql);
		return this.PostTime;
	}

	public boolean getPostLocations(int postId) {
		this.strSql = "select latitude, longitude, location from post, photo where post.postid = photo.postid and";
		this.strSql = this.strSql + " post.postid=" + postId + "";

		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.Location = rs.getString("location");
				this.setLat(rs.getDouble("latitude"));
				this.setLng(rs.getDouble("longitude"));
				return true;
			} else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean getpostid(String user, String time) {
		this.strSql = "select postid from post where";
		this.strSql = this.strSql + "  username='" + user + "'";
		this.strSql = this.strSql + "  and time='" + time + "'";
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.PostID = rs.getInt("postid");
				return true;
			} else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean modify() {
		this.strSql = "update post set title='" + this.Title + "',content='"
				+ this.Content + "',time='" + this.PostTime + "',location='"
				+ this.Location + "' where postid='" + this.PostID + "'";
		boolean isModify = super.exeSql(this.strSql);
		return isModify;
	}

	public boolean delete(int PostID) {
		this.strSql = "delete from post";
		this.strSql = this.strSql + " where postid = '" + this.PostID + "'";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	public boolean show() {
		this.strSql = "select * from post";
		this.strSql = this.strSql + "  where postid='" + this.PostID + "'";

		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.PostID = rs.getInt("postid");
				this.Title = rs.getString("title");
				this.Content = rs.getString("content");
				this.UserName = rs.getString("username");
				this.Location = rs.getString("location");
				this.PostTime = rs.getString("time").toString();
				return true;
			} else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public String toHTMLString(String in) {
		StringBuffer out = new StringBuffer();
		for (int i = 0; in != null && i < in.length(); i++) {
			char c = in.charAt(i);
			if (c == '\'')
				out.append("&#039;");
			else if (c == '\"')
				out.append("&#034;");
			else if (c == '<')
				out.append("&lt;");
			else if (c == '>')
				out.append("&gt;");
			else if (c == '&')
				out.append("&amp;");
			else if (c == ' ')
				out.append("&nbsp;");
			else if (c == '\n')
				out.append("<br/>");
			else
				out.append(c);
		}
		return out.toString();
	}

	public ResultSet postlist() {
		this.strSql = "select * from post";
		this.strSql = this.strSql + "  where username='" + this.UserName + "'";
		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return rs;
	}

	public ResultSet searchpost(String term) {
		this.strSql = "select postid,title,location from post";
		this.strSql = this.strSql + "  where username='" + this.UserName
				+ "' and title like '%" + term + "%'";
		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return rs;
	}

	public String getContent() {
		return this.Content;
	}

	public void setContent(String Content) {
		this.Content = Content;
	}

	public String getTitle() {
		return this.Title;
	}

	public void setTitle(String Title) {
		this.Title = Title;
	}

	public int getPostID() {
		return this.PostID;
	}

	public void setPostID(int PostID) {
		this.PostID = PostID;
	}

	public String getUserName() {
		return this.UserName;
	}

	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	public String getLocation() {
		return this.Location;
	}

	public void setLocation(String Location) {
		this.Location = Location;
	}

	public String getPostTime() {
		return this.PostTime;
	}

	public void setPostTime(String PostTime) {
		this.PostTime = PostTime;
	}

	public double getLat() {
		return Lat;
	}

	public void setLat(double lat) {
		Lat = lat;
	}

	public double getLng() {
		return Lng;
	}

	public void setLng(double lng) {
		Lng = lng;
	}

}
