package jsp.travelsnap;

import java.sql.*;

public class user extends DBrun {

	private String UserName;
	private String Email;
	private String Password;
	private String FName;
	private String LName;
	private String Info;
	private String Avatar;
	private int Age;
	private String Gender;
	private String RegTime;
	private String strSql;

	public user() {
		this.UserName = "";
		this.Email = "";
		this.Password = "";
		this.FName = "";
		this.LName = "";
		this.Info = "";
		this.Avatar = "images/avatar/default.gif";
		this.Gender = "other";
		java.util.Date NowTime = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		this.RegTime = sdf.format(NowTime);
		this.Age = 0;
		this.strSql = "";

	}

	public boolean add() {
		this.strSql = "INSERT INTO user ";
		this.strSql = this.strSql + "(";
		this.strSql = this.strSql + "username,";
		this.strSql = this.strSql + "email,";
		this.strSql = this.strSql + "password,";
		this.strSql = this.strSql + "fname,";
		this.strSql = this.strSql + "lname,";
		this.strSql = this.strSql + "info,";
		this.strSql = this.strSql + "avatar,";
		this.strSql = this.strSql + "gender,";
		this.strSql = this.strSql + "regtime,";
		this.strSql = this.strSql + "age";
		this.strSql = this.strSql + ") ";
		this.strSql = this.strSql + "values(";
		this.strSql = this.strSql + "'" + this.UserName + "',";
		this.strSql = this.strSql + "'" + this.Email + "',";
		this.strSql = this.strSql + "'" + this.Password + "',";
		this.strSql = this.strSql + "'" + this.FName + "',";
		this.strSql = this.strSql + "'" + this.LName + "',";
		this.strSql = this.strSql + "'" + this.Info + "',";
		this.strSql = this.strSql + "'" + this.Avatar + "',";
		this.strSql = this.strSql + "'" + this.Gender + "',";
		this.strSql = this.strSql + "'" + this.RegTime + "',";
		this.strSql = this.strSql + "'" + this.Age + "'";
		this.strSql = this.strSql + ")";
		boolean isAdd = super.exeSql(this.strSql);
		return isAdd;
	}

	public boolean modify() {
		this.strSql = "update user set email='" + this.Email + "',fname='"
				+ this.FName + "',age='" + this.Age + "',info='" + this.Info
				+ "',lname='" + this.LName + "' where username='"
				+ this.UserName + "'";
		boolean isModify = super.exeSql(this.strSql);
		return isModify;
	}

	public boolean modifypass() {
		this.strSql = "update user set password='" + this.Password
				+ "' where username='" + this.UserName + "'";
		boolean isModifypass = super.exeSql(this.strSql);

		return isModifypass;
	}

	public boolean valid() {
		this.strSql = "select * from user where username='" + this.UserName
				+ "' and password='" + this.Password + "'";

		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.UserName = rs.getString("username");
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			{
				ex.printStackTrace();
				return false;
			}
		}
	}

	public boolean exist() {
		this.strSql = "select * from user ";
		this.strSql = this.strSql + " where username='" + this.UserName + "'";

		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			return false;
		}
	}

	public boolean show() {
		this.strSql = "select * from user";
		this.strSql = this.strSql + "  where username='" + this.UserName + "'";
		try {
			ResultSet rs = super.exeQuery(this.strSql);
			if (rs.next()) {
				this.UserName = rs.getString("username");
				this.Email = rs.getString("email");
				this.Password = rs.getString("password");
				this.FName = rs.getString("fname");
				this.LName = rs.getString("lname");
				this.Avatar = rs.getString("avatar");
				this.Age = rs.getInt("age");
				this.Info = rs.getString("info");
				this.Gender = rs.getString("gender");
				this.RegTime = rs.getString("RegTime");

				return true;
			} else {
				return false;
			}
		} catch (Exception ex) {
			return false;
		}
	}
	
	public ResultSet showall() {
		this.strSql = "select username,avatar from user";
		//this.strSql = this.strSql + "  where username='" + this.UserName + "'";
		ResultSet rs = null;
		try {
			rs = super.exeQuery(this.strSql);
		} catch (Exception ex) {
			System.out.println(ex.toString());
		}
		return rs;
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

	public boolean delete(String UserNames) {
		this.strSql = "delete from user where username in (" + UserNames + ")";

		boolean isDelete = super.exeSql(this.strSql);
		return isDelete;
	}

	public void setUserName(String UserName) {
		this.UserName = UserName;
	}

	public String getUserName() {
		return this.UserName;
	}

	public void setFName(String FName) {
		this.FName = FName;
	}

	public String getFName() {
		return this.FName;
	}

	public void setLName(String LName) {
		this.LName = LName;
	}

	public String getLName() {
		return this.LName;
	}

	public void setPassword(String Password) {
		this.Password = Password;
	}

	public String getPassword() {
		return this.Password;
	}

	public void setRegTime(String RegTime) {
		this.RegTime = RegTime;
	}

	public String getRegTime() {
		return this.RegTime;
	}

	public void setEmail(String Email) {
		this.Email = Email;
	}

	public String getEmail() {
		return this.Email;
	}

	public void setAvatar(String Avatar) {
		this.Avatar = Avatar;
	}

	public String getAvatar() {
		return this.Avatar;
	}

	public void setInfo(String Info) {
		this.Info = Info;
	}

	public String getInfo() {
		return this.Info;
	}

	public void setGender(String Gender) {
		this.Gender = Gender;
	}

	public String getGender() {
		return this.Gender;
	}

	public void setAge(int Age) {
		this.Age = Age;
	}

	public int getAge() {
		return this.Age;
	}
}
