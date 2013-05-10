package jsp.travelsnap;

import java.sql.ResultSet;

public class friend extends DBrun {

	private int FriendID;
	private String UserName;
	private String FriendName;
	private String AddTime;
	private String strSql;

	public friend() {
		this.FriendID = 0;
		this.UserName = "";
		this.FriendName = "";
		java.util.Date NowTime = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		this.AddTime = sdf.format(NowTime);
		this.strSql = "";
	}

	public boolean add() {
		this.strSql = "insert into friend (username,friendname,addtime) values ('"
				+ this.UserName
				+ "','"
				+ this.FriendName
				+ "','"
				+ this.AddTime + "')";
		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	public boolean delete(String FriendIDs) {
		this.strSql = "delete from friend where friendid in (" + FriendIDs
				+ ")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	public ResultSet show() {
		this.strSql = "select friendid,addtime,friendname as flist from friend";
		this.strSql = this.strSql + "  where username='" + this.UserName + "'";
		this.strSql = this.strSql + "  union all ";
		this.strSql = this.strSql
				+ "  select friendid,addtime,username from friend where friendname='"
				+ this.UserName + "'";

		System.out.println(strSql);

		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return rs;
	}

	public ResultSet search(String query) {
		this.strSql = "select friendid,addtime,friendname as flist from friend";
		this.strSql = this.strSql + "  where username='" + this.UserName
				+ "' and friendname like '%" + query + "%'";
		this.strSql = this.strSql + "  union all ";
		this.strSql = this.strSql
				+ "  select friendid,addtime,username from friend where friendname='"
				+ this.UserName + "'";

		System.out.println(strSql);

		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return rs;
	}

	public boolean valid(String Friend) {
		this.strSql = "select friendid,addtime,friendname as flist from friend";
		this.strSql = this.strSql + "  where username='" + this.UserName + "'";
		this.strSql = this.strSql + "  and friendname='" + Friend + "'";
		this.strSql = this.strSql + "  union all ";
		this.strSql = this.strSql
				+ "  select friendid,addtime,username from friend where friendname='"
				+ this.UserName + "'";
		this.strSql = this.strSql + "  and username='" + Friend + "'";
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				return true;
			} else
				return false;
		} catch (Exception e) {
			return false;
		}
	}

	public int getFriendID() {
		return this.FriendID;
	}

	public void setFriendID(int FriendID) {
		this.FriendID = FriendID;
	}

	public String getUserName() {
		return this.UserName;
	}

	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	public String getFriendName() {
		return this.FriendName;
	}

	public void setFriendName(String FriendName) {
		this.FriendName = FriendName;
	}

	public String getAddTime() {
		return this.AddTime;
	}

	public void setAddTime(String AddTime) {
		this.AddTime = AddTime;
	}

}
