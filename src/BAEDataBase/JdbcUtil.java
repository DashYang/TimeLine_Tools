package BAEDataBase;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

public final class JdbcUtil { 
    private static String dbUrl = "jdbc:mysql://";
    public static String port = "4050";
    public static String host = "sqld.duapp.com";
    public static String username = "3DoDxrjzeC6nZOXDTK65prq6";
    public static String password = "kYPMD958sDATnyE98lKXZU8eC2MeugU7";
    public static String databaseName = "iXrufxFzukJiCmunTkoW";
  
    //拒绝new一个实例  
    private JdbcUtil() {};  
  
    static {//注册驱动  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  
        } catch (ClassNotFoundException e) {  
            throw new ExceptionInInitializerError(e);
        }  
    }  

    public static Connection getConnection() throws SQLException {
    	String connName = dbUrl + host + ":" + port + "/" + databaseName;
        return (Connection) DriverManager.getConnection(connName);
    }  
}