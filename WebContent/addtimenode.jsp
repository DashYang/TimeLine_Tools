<%@page import="DataBase.TimeNodeFactory"%>
<%@page import="DataBase.Isqltool"%>
<%@ page import="storage.*" %>
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
		if(session.getAttribute("admin").equals("admin")){
			String t_weight = request.getParameter("time_weight");
			String t_description = request.getParameter("time_description");
			System.out.println(t_weight + " \n " + t_description);
			Isqltool itool = new TimeNodeFactory();
			Timenode tm = new Timenode(Integer.parseInt(t_weight),t_description,1);
			if(itool.add(tm))
				out.print("success");
			else
				out.print("fail");
		}else{
			out.print("unknowningstatus");
		}
	%>
</body>
</html>