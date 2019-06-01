<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");
	//out.println(contentPage);
	
	String category = "Palettes";
	String menu = "New";
	String num = request.getParameter("NUM");
	
	if(contentPage.contains("content.jsp")) {
		if(contentPage.contains("menu")) {
			menu = contentPage.substring(contentPage.indexOf("menu=") + 5);
		}
		else if(contentPage.contains("category")) {
			menu = contentPage.substring(contentPage.indexOf("category=") + 9);
		}
		menu = menu.substring(0, 1).toUpperCase() + menu.substring(1);
	}
	else {
		if(contentPage.contains("details_proc.jsp") || contentPage.contains("details.jsp")) {
			menu = "Palette " + num;
		}
		else {
			category = contentPage.substring(0, contentPage.indexOf("_"));
			category = category.substring(0, 1).toUpperCase() + category.substring(1);
		}
	}
%>
<!doctype html>
<html>
    <head>
        <title>Color Hunt - Color Palettes for Designers and Artists</title>
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <style>
            html, body {
                width: 100%;
                height: 100%;
                margin: 0 auto;
                font-family: 'Rubik';
                text-align: center;
            }
            #header {
                width: 1640px;
                height: 50px;
                margin: 0 auto;
                overflow: hidden;
            }
            ul {
                display: inline;
                height: 50px;
                background: white;
                margin: 0 auto;
                overflow: hidden;
            }
            ul li {
                display: inline-block;
                height: 50px;
                line-height: 53px;
                margin-right: 13px;
                float: left;
                font-size: 14px;
                overflow: hidden;
            }
            #header {
                margin: 0px 11px;
                height: 50px;
                line-height: 50px;
                background: white;
                display: inline-block;
            }
            .dropdown {
                float: left;
                overflow: hidden;
            }
            .dropdown_right {
                float: right;
                overflow: hidden;
            }
            .menu {
                height: 50px;
                padding-left: 10px;
            }
            .menu_list {
                display: none;
                position: absolute;
                background-color: white;
                width: 130px;
                box-shadow: 0px 8px 20px 0px rgba(0,0,0,0.1);
                z-index: 3;
            }
            .menu_list a {
                float: none;
                color: black;
                text-decoration: none;
                display: block;
                height: 36px;
                line-height: 36px;
                padding-left: 10px;
                text-align: left;
                font-size: 14px;
            }
            .menu_list a:hover {
            	background: #f0f8ff;
            }
            .menu_list:last-child {
                border-radius: 0px 0px 5px 5px;
            }
            .menu_list:last-child a:hover {
                border-radius: 0px 0px 5px 5px;
            }
            .show {
                display: block;
            }
            #menu1{
                float: right; 
                color: #bccddf; 
                font-size: 24px; 
                margin-right: 18px;
            } 
            #menu1:hover {
                color: #899bb4;
            }
            #menu2 {
                margin-right: 4px;
            }
            .a_none, .a_none:visited {
            	text-decoration: none;
            	color: #263646;
            }
        </style>
        
    </head>
    <body>
    	<center>
	        <div id="header">
	        	<a class="a_none" href="main.jsp">
	            <img src="image/logo.png" width="28" style="margin: 12px 10px 0px 4px; vertical-align: middle; float: left;">
	            <span style="font-size: 20px; float: left; margin-right: 23px;">Color Hunt</span>
	            </a>
	            <ul>
	            	<% if(category.equals("Palettes")) { %>
	                <li>
	                    <a class="a_none" href="main.jsp"><span id="menu1_display"><%= category %></span></a>
	                </li>
	                <li style="color: #899bb4; margin-right: 0px;">
	                    ›
	                </li>
	                <li>
	                	<% if(menu.equals("New") || menu.equals("Trendy") || menu.equals("Popular") || menu.equals("Random")) { %>
	                    <div class="dropdown">
	                        <div class="menu" onclick="toggleMenu2()">
	                            <span id="menu2"><%= menu %></span>
                            	<img src="image/down.png" width="12">
	                        </div>
	                        <div id="menu2_list" class="menu_list">
	                            <a href="main.jsp">New</a>
	                            <a href="main.jsp?menu=trendy">Trendy</a>
	                            <a href="main.jsp?menu=popular">Popular</a>
	                            <a href="main.jsp?menu=random">Random</a>
	                        </div>
	                    </div>
	                    <% }
	                	else if (menu.contains("Palette")){ %>
	                	<a class="a_none" href="details.jsp?NUM=<%=num %>"><span style="padding-left: 10px"><%= menu %></span></a>
	                	<% }
	                	else {
	                	%>
	                	<a class="a_none" href="main.jsp?category=<%= menu.toLowerCase() %>"><span style="padding-left: 10px"><%= menu %></span></a>
	                	<%	
	                	}
                	}
	            	else { %>
	            		<li>
	                    	<a class="a_none" href="<%= category.toLowerCase() %>.jsp"><span id="menu1_display"><%= category %></span></a>
	                	</li>
	            	<% 	
	            	}
	                	%>
	                </li>
	            </ul>
	            <div class="dropdown_right">
	                <div class="menu" onclick="toggleMenu1()" style="width: 50px;">
	                    <div id="menu1">•••</div>
	                </div>
	                <div id="menu1_list" class="menu_list" style="right: 150px; width: 150px;">
	                    <a href="main.jsp">Palettes</a>
	                    <a href="create.jsp">Create</a>
	                    <a href="likes.jsp" style="border-bottom: 1px solid #eee">Likes</a>
	                    <a href="about.jsp">About</a>
	                    <a href="https://www.instagram.com/color.hunt/" target="_blank">Instagram</a>
	                </div>
	            </div>
	        </div>
	        <script>
	            function toggleMenu1() {
	                document.getElementById("menu1_list").classList.toggle("show");
	            }
	            
	            function toggleMenu2() {
	                document.getElementById("menu2_list").classList.toggle("show");
	            }
	
	            window.onclick = function(e) {
	                if (!e.target.matches('.menu')) {
	                    if(!e.target.matches('#menu1')) {
	                        var myDropdown = document.getElementById("menu1_list");
	                    }
	                    var myDropdown2 = document.getElementById("menu2_list");
	                
	                    if (myDropdown.classList.contains('show')) {
	                        myDropdown.classList.remove('show');
	                    }
	                    else if(myDropdown2.classList.contains('show')) {
	                        myDropdown2.classList.remove('show');
	                    }
	                }
	            }
	        </script>
        </center>
    </body>
</html>