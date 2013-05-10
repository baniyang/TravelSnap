package jsp.travelsnap;

import java.sql.*;

public class DBconn {
	//String userName = "travelsnap";
	 String userName = "root";
	 String userPassword = "123456";
	//String userPassword = "vHnTPvHPEPvb3JV7";
	// String url="jdbc:sqlserver://localhost:1433; DatabaseName=bookmanager";
	//String url = "jdbc:mysql://localhost:443/travelsnap";
	String url = "jdbc:mysql://localhost:3306/travelsnap";
	Connection conn;
	String errMsg;

	public DBconn() {
		errMsg = "";
		conn = null;
	}

	public Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, userName, userPassword);
		} catch (Exception e) {
			System.err.println(e.toString());
			conn = null;
			errMsg = e.toString();
		}
		return conn;
	}

	public String getErrMsg() {
		return errMsg;
	}
}
