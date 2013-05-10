package jsp.travelsnap;

import java.sql.*;

public class DBrun extends DBconn {

	private Connection dbConn;
	private Statement stmt;
	private ResultSet rs;

	private String errMsg;

	public DBrun() {
		dbConn = super.getConn();
		stmt = null;
		rs = null;
		this.errMsg = super.getErrMsg();
	}

	public boolean exeSql(String strSql) {
		boolean isSuc = false;
		try {
			stmt = dbConn.createStatement();
			stmt.executeUpdate(strSql);
			stmt.close();
			isSuc = true;
		} catch (Exception e) {
			this.errMsg = this.errMsg + "<br>" + e.toString();
			e.printStackTrace();
		}
		return isSuc;
	}

	public ResultSet exeQuery(String strSql) {
		try {
			stmt = dbConn.createStatement();
			rs = stmt.executeQuery(strSql);
		} catch (Exception e) {
			this.errMsg = this.errMsg + "<br>" + e.toString();
			rs = null;
		}
		return rs;
	}

	public String getErrMsg() {
		return errMsg;
	}
}
