<%@page import="storage.Timenode"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DataBase.TimeNodeFactory"%>
<%@page import="DataBase.Isqltool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Timeline Tools</title>
<script type="text/javascript" src="./Resource/jquery-1.10.2.js"></script>
<script type="text/javascript" src="./Resource/index.js"></script>
<link rel="stylesheet" type="text/css" href="./Resource/index.css">
</head>
<body>
	<% 
		int num = 0;
		if(session.getAttribute("admin") != null &&
			session.getAttribute("admin").toString().equals("admin"))
		{
			out.println("<a href='./logout.jsp'>登出</a>");	
		}
	%>
	<div id = 'header' class = 'center'>
				New 52  时间线
	</div>
	<div id = 'inputbox' class = 'center'>
			<div id = 'd_name'><lable class = 'inp_opt'>用户：</lable><input type="text" id="username" maxlength = '12'></div>
			<div id = 'd_content'><label class = 'inp_opt'>密码：</label><input type="text" id="password" maxlength = '12'></div>
			<div id = 'd_verify'><lable class = 'inp_opt'>验证：</lable><input type="text" id="verifycode" size="8" maxlength = '4'>
				<img border=0 src="./image.jsp" id ="code"><a href="javascript:changeimg()">看不清，换一张 </a></div>
			<div id = 'd_submit'><input type="submit" id="submit" value="登录"></div>
	</div>
	<div id = 'main_content' class = 'center'>
		<div id = 'timeline' class = 'left'>
		<% 
			if(session.getAttribute("admin") != null &&
				session.getAttribute("admin").toString().equals("admin"))
			{
				out.println("<div class = 'timenodebox' id = 'tn'><lable id = 'time_weight_label'>时间权：</lable>");
				out.println("<input id= time_weight type=‘text’ maxlength = '4' value = '" + num + "'>");
				out.println("<div id = 'new_time_description'class='time_description' contenteditable='true' >添加对该时间节点的描述</div>");
				out.println("<input id = 'addTimenode' type = 'button' value = '保存'></div>");
			}
			Isqltool itool = new TimeNodeFactory();
			ArrayList<Object> tns = itool.show(1);
			int pos = 0;
			for(Object tmp:tns)
			{
				Timenode tn = (Timenode)tmp;
				out.println("<div class = 'timenodebox' id = tn."+ tn.getId() +"><lable id = 'twl" + tn.getId() + "' hidden = 'false'>时间权：</lable>");
				out.println("<input id= 'tw" + tn.getId() + "' type=‘text’ maxlength = '4' value = '" + tn.getTime_weight() + "' hidden = 'false'>");
				out.println("<div class = 'time_description' contenteditable='false' id= 'td" + tn.getId() + "'  >"+ tn.getTime_description() + "</div>");
				out.println("<input type = 'hidden' id = 'pos" + tn.getId() +"' value = '" + pos++ + "'></input>");
				if(session.getAttribute("admin") != null &&
						session.getAttribute("admin").toString().equals("admin"))
				{
					out.println("<input class = 'editorsavebutton' type = 'button' value = '编辑'>");
					out.println("<input class = 'deletebutton' type = 'button' value = '删除'>");
				}
				out.print("</div>");
			}
		%>
		</div>
		<div id = 'event' class = 'right'>
			<%
				if(session.getAttribute("admin") != null &&
					session.getAttribute("admin").toString().equals("admin"))
				{
					out.println("<div id = 'new_Event'><div id = 'new_event_description'class='event_description' contenteditable='true' >添加对该事件节点的描述</div>");
					out.println("<input id = 'addEventnode' type = 'button' value = '保存'></div>");
				}
			%>
			<div id = "event_lists">
			</div>
		</div>
		<div style="clear:both;"></div>
		<div style="clear:both;"></div>
	</div>
	<div id = "footer">本网站由dash编写，如果您对本网站有更好的建议，请联系</div>
</body>
</html>