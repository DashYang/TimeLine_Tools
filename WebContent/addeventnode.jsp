<%@page import="storage.*"%>
<%@page import="DataBase.*"%>
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
			String owner = request.getParameter("owner");
			String event_description = request.getParameter("event_description");
			System.out.println(owner + " \n " + event_description);
			Isqltool itool = new EventNodeFactory();
			Eventnode tm = new Eventnode(Integer.parseInt(owner),event_description);
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