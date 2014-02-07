package DataBase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import storage.Timenode;

import com.mysql.jdbc.Statement;

public class TimeNodeFactory implements Isqltool {
	private Connection conn;
	
	public TimeNodeFactory()
	{
	}
	
	@Override
	public boolean add(Object item) {
		conn = new SQLconnect().getConnection();
		if(item instanceof Timenode)
		{
			Timenode newitem = new Timenode();
			newitem = (Timenode)item;
			try {  
	            String sql = String.format("INSERT INTO Timenodes(time_weight, time_description, time_owner, display)" +
			" VALUES ('%s', '%s', '%s','%s')",newitem.getTime_weight(),newitem.getTime_description(),newitem.getTime_owner(),"true"  );

	            Statement st = (Statement) conn.createStatement();    // 创建用于执行静态sql语句的Statement对象  
	            
	            System.out.println(sql);
	            int count = st.executeUpdate(sql);  // 执行插入操作的sql语句，并返回插入数据的个数  
	            System.out.println("insert " + count + " entries"); //输出插入操作的处理结果  
	            conn.close();   //关闭数据库连接  
	            return true;
	        } catch (SQLException e) {  
	            System.out.println("插入数据失败 " + e.getMessage());  
	            return false;
	        }
		}
		return false;
	}

	@Override
	public boolean update(Object item) {
		conn = new SQLconnect().getConnection();
		String sqlcommand = "UPDATE `Timeline_Database`.`Timenodes` SET `time_weight`='%s', `time_description`='%s' WHERE `id`='%s';";
		if(item instanceof Timenode)
		{
			Timenode newitem = new Timenode();
			newitem = (Timenode)item;
			try {  
	            String sql = String.format(sqlcommand,newitem.getTime_weight(),newitem.getTime_description(),newitem.getId());

	            Statement st = (Statement) conn.createStatement();    // 创建用于执行静态sql语句的Statement对象  
	            
	            System.out.println(sql);
	            int count = st.executeUpdate(sql);  // 执行插入操作的sql语句，并返回插入数据的个数  
	            System.out.println("insert " + count + " entries"); //输出插入操作的处理结果  
	            conn.close();   //关闭数据库连接  
	            return true;
	        } catch (SQLException e) {  
	            System.out.println("插入数据失败 " + e.getMessage());  
	            return false;
	        }
		}
		return false;
	}

	@Override
	public boolean delete(Object item) {
		conn = new SQLconnect().getConnection();
		String sqlcommand = "UPDATE `Timeline_Database`.`Timenodes` SET `display`='false' WHERE `id`='%s';";
		if(item instanceof Timenode)
		{
			Timenode newitem = new Timenode();
			newitem = (Timenode)item;
			try {  
					String sql = String.format(sqlcommand,newitem.getId());
					Statement st = (Statement) conn.createStatement();    // 创建用于执行静态sql语句的Statement对象  
					System.out.println(sql);
					int count = st.executeUpdate(sql);  // 执行插入操作的sql语句，并返回插入数据的个数  
					System.out.println("delete " + count + " entries"); //输出插入操作的处理结果
					conn.close();
					return true;
			}catch (SQLException e) {
				System.out.println("删除数据失败 " + e.getMessage());
				return false;
			}
		}
		return false;
	}

	@Override
	public ArrayList<Object> show(int id) {
		conn = new SQLconnect().getConnection();
		ArrayList<Object> tns = new ArrayList<Object>();
		try {
			String sql = "select * from Timenodes where display = 'true' and time_owner = " + id + " order by time_weight desc;";
			Statement st = (Statement) conn.createStatement();    // 创建用于执行静态sql语句的Statement对象  
			ResultSet rs = st.executeQuery(sql);  // 执行查询操作的sql语句，并返回插入数据的个数  
			while (rs.next())
			{
				int time_id = rs.getInt("id");
				int t_weight = rs.getInt("time_weight");
				String t_description = rs.getString("time_description");
				int owner = rs.getInt("time_owner");
				
				Timenode tmp = new Timenode(t_weight, t_description,owner);
				tmp.setId(time_id);
				
				tns.add(tmp);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tns;
	}

}
