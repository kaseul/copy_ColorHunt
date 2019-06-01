<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<head>
	<link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon">
	<link rel="icon" href="image/favicon.ico" type="image/x-icon">
	<style>
		html, body {
			margin: 0 auto;
			width: 100%;
			height: 100%;
		}
	</style>
</head>

<body>
	<div style="width: 100%; height: 50px; background-color: white; box-shadow: 0px 0px 15px 0px rgba(0,0,0,0.07); position:fixed; top:0; z-index: 10; margin: 0 auto;">
		<jsp:include page="top.jsp?CONTENTPAGE=<%= contentPage %>" flush="false"/>
	</div>
	<table width="100%" height="100%" cellspacing="0" style="margin-top : 50px;">
		<% if(contentPage.equals("about_proc.jsp") || contentPage.equals("create_proc.jsp") || contentPage.equals("likes_proc.jsp")) { %>
		<tr>
			<td>
				<jsp:include page="<%= contentPage %>" flush="false"/>
			</td>
		</tr>
		<% }
		else { %>
		<tr>
			<td rowspan="2" valign="top" style="padding: 15px 20px 0px 135px;">
				<jsp:include page="<%= contentPage %>" flush="false"/>
			</td>
			<td valign="top" width="350" style="padding-top: 25px;">
				<div style="position:fixed; top: 70; z-index: 1; margin: 0 auto;">
					<jsp:include page="right.jsp" flush="false"></jsp:include>
				</div>
			</td>
		</tr>
		<% } %>
	</table>
</body>