<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("NUM"));
	
	ArrayList<String> details = new ArrayList<>();
	
	BufferedReader reader = null;
	
	try {
		//String filePath = application.getRealPath("/palette/palette.txt");
		//String filePath = "D:\\colorhunt\\palette\\palette.txt";
		String filePath = "C:\\project_model\\colorhunt\\palette\\palette.txt";
		// out.println(filePath);
		reader = new BufferedReader(new FileReader(filePath));
		
		while(true) {
			String str = reader.readLine();
			if(str == null)
				break;
			details.add(str);
		} // while
	}
	catch(Exception e) {
		out.print("지정된 파일을 읽을 수 없습니다.");
	}
	finally {
		reader.close();
	}
	if(num == -1) {
		num = (details.size()/7) - 1;
%>
	<jsp:forward page="template.jsp">
		<jsp:param name="CONTENTPAGE" value="details.jsp?NUM=<%= num %>"/>
	</jsp:forward>     
<%
	}
%>

<!doctype html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <link rel="stylesheet" href="css/palette.css">
        <script src="js/html2canvas.js"></script>
        <script>
            function copy(text) {
                var t = document.createElement("textarea");
                document.body.appendChild(t);
                t.value = text;
                t.select();
                document.execCommand('copy');
                document.body.removeChild(t);
               	alert("Copied!");
            }
        </script>
    </head>
    <body>
        <div class="box_palette_detail">
            <div class="palettes palette_detail" id="palette_detail">
                <div class="palette p1" style="background: <%=details.get(7 * num)%>">
                    <div>
                        <div class="tooltip" data-html2canvas-ignore="true">
                            <span onclick="copy('<%=details.get(7 * num)%>')"><%=details.get(7 * num).toUpperCase()%></span>
                            <span class="tooltiptext" id="tooltip">Copy!</span>
                        </div>
                    </div>
                </div>
                <div class="palette p2" style="background: <%=details.get(7 * num + 1)%>">
                    <div>
                        <div class="tooltip" data-html2canvas-ignore="true">
                            <span onclick="copy('<%=details.get(7 * num + 1)%>')"><%=details.get(7 * num + 1).toUpperCase()%></span>
                            <span class="tooltiptext">Copy!</span>
                        </div>
                    </div>
                </div>
                <div class="palette p3" style="background: <%=details.get(7 * num + 2)%>">
                    <div>
                        <div class="tooltip" data-html2canvas-ignore="true">
                            <span onclick="copy('<%=details.get(7 * num + 2)%>')"><%=details.get(7 * num + 2).toUpperCase()%></span>
                            <span class="tooltiptext">Copy!</span>
                        </div>
                    </div>
                </div>
                <div class="palette p4" style="background: <%=details.get(7 * num + 3)%>">
                    <div>
                         <div class="tooltip" data-html2canvas-ignore="true">
                             <span onclick="copy('<%=details.get(7 * num + 3)%>')"><%=details.get(7 * num + 3).toUpperCase()%></span>
                             <span class="tooltiptext">Copy!</span>
                         </div>
                     </div>
                </div>
                <div class="desc_palettes" style="margin-top: 16px;" data-html2canvas-ignore="true">
                    <button class="palette_detail" id="detail_like<%= num %>" onclick="toggleLikes(<%= num %>, '<%=details.get(7 * num)%>', '<%=details.get(7 * num + 1)%>', '<%=details.get(7 * num + 2)%>', '<%=details.get(7 * num + 3)%>')">
                        <span id="detail_span_like_heart<%= num %>" style="font-size: 16px; padding-right: 3px;">❤</span>
                        <span id="detail_span_like<%= num %>" class="likes"><%=details.get(7 * num + 4)%></span>
                    </button>
                    <button class="palette_detail" onclick="download('<%= new Date().getTime() %>')">
                        <img src="image/download.png" width="15" style="vertical-align: middle; margin-right: 5px;">
                        <span class="likes detail_button">Image</span>
                    </button>
                    <button class="palette_detail" onclick="copy('http://10.96.124.182:8088/Project_Website/details.jsp?NUM=<%=num%>')">
                        <img src="image/link.png" width="15" style="vertical-align: middle; margin-right: 5px;">
                        <span class="likes detail_button">Link</span>
                    </button>
                    <span>
                    <%
                    	String hashtags = details.get(7 * num + 6);
                    	String hashtag;
                    	int start = 0;
                    	int end = 0;
                    	while(true) {
                    		if(hashtags.indexOf('#', start + 1) == -1) {
                    			hashtag = hashtags.substring(start);
                    			%>
                    			<a href="main.jsp?category=<%= hashtag.substring(1) %>" class="none detail_button"><%= hashtag %></a>	
                    			<% 
                    			break;
                    		}
                    		end = hashtags.indexOf('#', start + 1);
                    		hashtag = hashtags.substring(start, end);
                    		%>
                   			<a href="main.jsp?category=<%= hashtag.substring(1) %>" class="none detail_button"><%= hashtag %></a>
                    		<%
                    		start = end;
                    	}
                    %>
                    </span>
                    <span class="time"><%=details.get(7 * num + 5)%></span>
                </div>
            </div>
        </div>
        <%
    	for(int i = (details.size() / 7) - 1; i >= 0; i--) {
    %>
        <div class="box_palettes">
            <div class="palettes">
                <a href="details.jsp?NUM=<%=i%>">
                    <div class="palette p1" style="background: <%=details.get(7 * i)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=details.get(7 * i)%>')"><%=details.get(7 * i).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p2" style="background: <%=details.get(7 * i + 1)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=details.get(7 * i + 1)%>')"><%=details.get(7 * i + 1).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p3" style="background: <%=details.get(7 * i + 2)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=details.get(7 * i + 2)%>')"><%=details.get(7 * i + 2).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p4" style="background: <%=details.get(7 * i + 3)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=details.get(7 * i + 3)%>')"><%=details.get(7 * i + 3).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="desc_palettes">
                <button class="like" id="like<%= i %>" onclick="toggleLikes(<%= i %>, '<%=details.get(7 * i)%>', '<%=details.get(7 * i + 1)%>', '<%=details.get(7 * i + 2)%>', '<%=details.get(7 * i + 3)%>')">
                    <span id="span_like_heart<%= i %>" style="font-size: 16px; padding-right: 3px;">❤</span>
                    <span id="span_like<%= i %>" class="likes"><%=details.get(7 * i + 4)%></span>
                </button>
                <span class="time"><%=details.get(7 * i + 5)%></span>
            </div>
        </div>  
        <% } %>
        <div style="clear: both; height: 20px"></div>
        <script>
	        function download(date) {
	      	  	html2canvas(document.getElementById('palette_detail')).then(function(canvas) {
	      	  			var a = document.createElement('a');
	      	  			a.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream");
	      	  			a.download = 'Color Hunt Platte-' + date +'.png';
	      	  			a.click();
	      	  	});
	        }
	        function toggleLikes(num, color1, color2, color3, color4) {
	        	var element;
	        	var detailElement;
	        	if(num == <%=num%>) {
	        		detailElement = document.getElementById("detail_like" + num);
	        		detailElement.classList.toggle("liked");
	        	}
   				element = document.getElementById("like" + num);
   			   	element.classList.toggle("liked");
   			   	
   			 	var i = parseInt(document.getElementById("span_like" + num).innerHTML);
   			   	if(element.classList.contains('liked')) {
   			   		i++;
   			   		document.getElementById("span_like" + num).style.color = "#70a1d4";
   			   		document.getElementById("span_like_heart" + num).style.color = "#70a1d4";
   			   		if(num == <%= num %>) {
   			   			document.getElementById("detail_span_like" + num).style.color = "#70a1d4";
   			   			document.getElementById("detail_span_like_heart" + num).style.color = "#70a1d4";
   			   		}	
   			   		var arr = new Array();
   			   		arr[0] = color1;
   			   		arr[1] = color2;
   			 		arr[2] = color3;
   					arr[3] = color4;
   			   		localStorage.setItem(num, JSON.stringify(arr));
   			   	}
   			   	else {
			   		i--;
			   		document.getElementById("span_like" + num).style.color = "#263646";
			   		document.getElementById("span_like_heart" + num).style.color = "#263646";
			   		if(num == <%= num %>) {
			   			document.getElementById("detail_span_like" + num).style.color = "#263646";
			   			document.getElementById("detail_span_like_heart" + num).style.color = "#263646";
			   		}
			   		localStorage.removeItem(num);
   			   	}
   			 	document.getElementById("span_like" + num).innerHTML = i;
   			 	if(num == <%= num %>) {
		   			document.getElementById("detail_span_like" + num).innerHTML = i;
		   		}
   			}
   			
   			window.onload = liked();
   			function liked() {
   				for(var i = 0; i < localStorage.length; i++ ) {
   					var key = localStorage.key(i);
   					if(parseInt(key) > <%= details.size() - 1 %>) {
   						localStorage.removeItem(key);
   					}
   					else {
	   					var val = localStorage.getItem(key);
	   					arr = JSON.parse(val);
	   					
	   					toggleLikes(key, arr[0], arr[1], arr[2], arr[3]);
   					}
   				}
   			}
        </script>
    </body>
</html>