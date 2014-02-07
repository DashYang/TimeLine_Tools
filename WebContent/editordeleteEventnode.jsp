<%@page import="DataBase.EventNodeFactory"%>
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
			String owner = request.getParameter("owner");
			String description = request.getParameter("time_description");
			String id = request.getParameter("id");
			String type = request.getParameter("type");
			
			System.out.println(type + "\n" + owner + " \n " + description);
			Isqltool itool = new EventNodeFactory();
			Eventnode tm = new Eventnode(Integer.parseInt(owner),description);
			tm.setId(Integer.parseInt(id));
			if(type.equals("保存")){
				if(itool.update(tm))
					out.print("success");
				else
					out.print("fail");
			}else if(type.equals("删除")){
				if(itool.delete(tm))
					out.print("success");
				else
					out.print("fail");
			}
		}else{
			out.print("unknowningstatus");
		}
	%>
</body>
</html>