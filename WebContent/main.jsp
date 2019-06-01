<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String category = request.getParameter("category");
	String menu = request.getParameter("menu");
	String url = "content.jsp";
	
	if(menu != null) {
		url += "?menu=" + menu;
	}
	else if(category != null) {
		url += "?category=" + category;
	}
		
%>
<jsp:forward page="template.jsp">
	<jsp:param name="CONTENTPAGE" value="<%= url %>"/>
</jsp:forward>