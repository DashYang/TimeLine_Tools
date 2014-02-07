package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import com.mysql.jdbc.Statement;


public class SQLconnect {
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/Timeline_Database?useUnicode=true&characterEncoding=utf8";
	private String user = "root";
	private String pwd = "123456";

	public Connection getConnection() {
		try {
			// load driver
			Class.forName(driver);
			// link to database
			Connection conn = DriverManager.getConnection(url, user, pwd);
			if (!conn.isClosed())
			{
				System.out.println("Succeeded connecting to the Database!");
				return conn;
			}else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
}