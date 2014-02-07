<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("admin");
	out.print("<script>alert('用户即将退出，确定后退出该页面。');window.location.href='Index.jsp'</script>");
%>