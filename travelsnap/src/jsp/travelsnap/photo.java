package jsp.travelsnap;

import java.sql.ResultSet;

public class photo extends DBrun {

	private int PhotoID;
	private int PostID;
	private String URL;
	private double Longitude;
	private double Latitude;
	private String strSql;

	public photo() {
		this.PostID = 0;
		this.PhotoID = 0;
		this.URL = "";
		this.Longitude = 0;
		this.Latitude = 0;
		this.strSql = "";
	}

	public boolean add() {
		this.strSql = "insert into photo (postid,url,longitude,latitude) values ('"
				+ this.PostID
				+ "','"
				+ this.URL
				+ "','"
				+ this.Longitude
				+ "','" + this.Latitude + "')";
		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	public boolean delete(String PhotoIDs) {
		this.strSql = "delete from photo where photoid in (" + PhotoIDs + ")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	public boolean show() {
		this.strSql = "select * from photo";
		this.strSql = this.strSql + "  where postid='" + this.PostID + "'";

		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.PostID = rs.getInt("postid");
				this.PhotoID = rs.getInt("photoid");
				this.URL = rs.getString("url");
				this.Latitude = rs.getDouble("latitude");
				this.Longitude = rs.getDouble("longitude");
				return true;
			} else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean showUserPhoto(String UserName) {
		this.strSql = "select * from photo";
		this.strSql = this.strSql
				+ "  where postid in (select postid from post where username='"
				+ UserName + "')";

		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.PostID = rs.getInt("postid");
				this.PhotoID = rs.getInt("photoid");
				this.URL = rs.getString("url");
				this.Latitude = rs.getDouble("latitude");
				this.Longitude = rs.getDouble("longitude");
				return true;
			} else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public int getPhotoID() {
		return this.PhotoID;
	}

	public void setPhotoID(int PhotoID) {
		this.PhotoID = PhotoID;
	}

	public int getPostID() {
		return this.PostID;
	}

	public void setPostID(int PostID) {
		this.PostID = PostID;
	}

	public String getURL() {
		return this.URL;
	}

	public void setURL(String URL) {
		this.URL = URL;
	}

	public double getLongitude() {
		return this.Longitude;
	}

	public void setLongitude(double Longitude) {
		this.Longitude = Longitude;
	}

	public double getLatitude() {
		return this.Latitude;
	}

	public void setLatitude(double Latitude) {
		this.Latitude = Latitude;
	}

}
