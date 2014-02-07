<%@page import="com.mysql.jdbc.interceptors.SessionAssociationInterceptor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <% 
 	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("username");
	String password = request.getParameter("password");
	String hisverifycode = request.getParameter("verifycode").toString();
	String correctcode = session.getAttribute("rand").toString();
	System.out.println(hisverifycode + " " + correctcode);
	if(!hisverifycode.equals(correctcode))
	{
		out.print("wrongcode");
		return;
	}
	System.out.println(name + " \n " + password);
	if(name.equals("admin") && password.equals("123456"))
	{
		session.setAttribute("admin","admin");
		out.print("admin");
	}else{
		out.print("wrong");	
	}
%> 