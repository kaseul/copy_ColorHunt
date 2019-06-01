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
		String filePath = application.getRealPath("/palette/palette.txt");
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
                document.getElementById('tooltip').style.visibillity = "visible";
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
                    <button class="palette_detail">
                        <img src="image/like.png" width="15" style="vertical-align: middle; margin-right: 5px;">
                        <span class="likes"><%=details.get(7 * num + 4)%></span>
                    </button>
                    <button class="palette_detail" onclick="download('<%= new Date().getTime() %>')">
                        <img src="image/download.png" width="15" style="vertical-align: middle; margin-right: 5px;">
                        <span class="likes detail_button">Image</span>
                    </button>
                    <button class="palette_detail" onclick="copy('http://10.96.124.182:8088/Project_Website/palette.jsp?NUM=<%=num%>')">
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
                    			<a href="#" class="none detail_button"><%= hashtag %></a>	
                    			<% 
                    			break;
                    		}
                    		end = hashtags.indexOf('#', start + 1);
                    		hashtag = hashtags.substring(start, end);
                    		%>
                   			<a href="#" class="none detail_button"><%= hashtag %></a>
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
    	for(int i = 0; i < (details.size() / 7); i++) {
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
                <button>
                    <img src="image/like.png" width="15" style="vertical-align: middle; margin-right: 5px;">
                    <span class="likes"><%=details.get(7 * i + 4)%></span>
                </button>
                <span class="time"><%=details.get(7 * i + 5)%></span>
            </div>
        </div>  
        <% } %>
        <script>
	        function download(date) {
	      	  	html2canvas(document.getElementById('palette_detail')).then(function(canvas) {
	      	  			var a = document.createElement('a');
	      	  			a.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream");
	      	  			a.download = 'Color Hunt Platte-' + date +'.png';
	      	  			a.click();
	      	  	});
	        }
	        function toggleLike() {
	        	
	        }
        </script>
    </body>
</html>