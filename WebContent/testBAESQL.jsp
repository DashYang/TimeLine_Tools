<%@page import="BAEDataBase.JdbcUtil"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = JdbcUtil.getConnection();
		Statement stmt = (Statement) conn.createStatement();
		/* 至此连接已完全建立，就可对当前数据库进行相应的操作了 */
		/* 3. 接下来就可以使用其它标准mysql函数操作进行数据库操作 */
		// 创建一个数据库表
		String sql = "create table if not exists test_mysql("
				+ "id int primary key auto_increment," + "no int, "
				+ "name varchar(1024)," + "key idx_no(no))";
		stmt.execute(sql);
		conn.close();
		out.print("hello!");
	%>
</body>
</html>