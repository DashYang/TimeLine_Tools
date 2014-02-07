<%@page import="java.util.ArrayList"%>
<%@page import="DataBase.EventNodeFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DataBase.TimeNodeFactory"%>
<%@page import="DataBase.Isqltool"%>
<%@ page import="storage.*" %>
<%
	String owner = request.getParameter("float_index");
	System.out.println(owner);
	Isqltool tool = new EventNodeFactory();
	ArrayList<Object> e_list = tool.show(Integer.parseInt(owner));
	for(Object en:e_list)
	{
		Eventnode tmp = (Eventnode) en;
		int id = tmp.getId();
		System.out.println("en."+id);
		System.out.println(tmp.getEvent_description());
		String description = tmp.getEvent_description();
		out.print("<div id = 'en." + id + "'><div id = 'ed" + id + "' class='event_description' contenteditable='false' >" + description + "</div>");
		if(session.getAttribute("admin") != null &&
				session.getAttribute("admin").toString().equals("admin")){
			out.print("<input class = 'editorsaveEvent' type = 'button' value = '编辑'>");
			out.print("<input class = 'deleteEvent' type = 'button' value = '删除'>");
		}
		out.print("</div>");
	}
%>