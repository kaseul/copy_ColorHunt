<%@page import="java.util.Collections"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String category = null;
	String menu = null;
	
	category = request.getParameter("category");
	menu = request.getParameter("menu");

	ArrayList<String> palette = new ArrayList<>();
	ArrayList<Integer> index = new ArrayList<>();
	
	BufferedReader reader = null;
	try {
		//String filePath = application.getRealPath("/palette/palette.txt");
		//String filePath = "D:\\colorhunt\\palette\\palette.txt";
		String filePath = "C:\\project_model\\colorhunt\\palette\\palette.txt";
		// out.println(filePath);
		reader = new BufferedReader(new FileReader(filePath));
		
		int line = 0;
		while(true) {
			String str = reader.readLine();
			if(str == null)
				break;
			else if(category != null && str.contains(category)) {
				index.add(line / 7);
			}
			palette.add(str);
			line++;
		} // while
		
		if(menu != null) {
			if(menu.equals("popular")) {
				ArrayList<Integer> temp = new ArrayList<>();
				for(int i = 0; i < palette.size() / 7; i++) {
					temp.add(Integer.parseInt(palette.get(7 * i + 4)));
				}
				Collections.sort(temp);
				for(int i = 0; i < palette.size() / 7; i++) {
					for(int j = 0; j < palette.size() / 7; j++) {
						if(temp.get(i) == Integer.parseInt((palette.get(7 * j + 4)))) {
							index.add(j);
							break;
						}
					}
				}
			}
			else if(menu.equals("trendy")) {
				for(int i = 0; i < (palette.size() / 7) / 4; i++) {
					index.add(4 * i + 3);
					index.add(4 * i + 0);
					index.add(4 * i + 1);
					index.add(4 * i + 2);
				}
				for(int i = 0; i < (palette.size() / 7) % 4; i++) {
					index.add((palette.size() / 7) - 1 - i);
				}
			}
			else {
				int random = (int)(Math.random() * 7) + 5;
				
				for(int i = 0; i < (palette.size() / 7) / random; i++) {
					for(int j = random - 1; j >= 0; j--) {
						index.add(random * i + j);
					}
				}
				for(int i = 0; i < (palette.size() / 7) % random; i++) {
					index.add((palette.size() / 7) - 1 - i);
				}
			}
		}
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
        <script>
            function copy(rgb) {
                var t = document.createElement("textarea");
                document.body.appendChild(t);
                t.value = rgb;
                t.select();
                document.execCommand('copy');
                document.body.removeChild(t);
            }
        </script>
    </head>
    <body>
    <%
    	int end;
    	if(category == null && menu == null) {
    		end = palette.size() / 7;
    	}
    	else {
    		end = index.size();
    	}
    	for(int i = end - 1; i >= 0; i--) {
    		if(category == null && menu == null) {
    %>
        <div class="box_palettes">
            <div class="palettes">
                <a href="details.jsp?NUM=<%=i%>">
                    <div class="palette p1" style="background: <%=palette.get(7 * i)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * i)%>')"><%=palette.get(7 * i).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p2" style="background: <%=palette.get(7 * i + 1)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * i + 1)%>')"><%=palette.get(7 * i + 1).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p3" style="background: <%=palette.get(7 * i + 2)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * i + 2)%>')"><%=palette.get(7 * i + 2).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p4" style="background: <%=palette.get(7 * i + 3)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * i + 3)%>')"><%=palette.get(7 * i + 3).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="desc_palettes">
                <button class="like" id="like<%= i %>" onclick="toggleLikes(<%= i %>, '<%=palette.get(7 * i)%>', '<%=palette.get(7 * i + 1)%>', '<%=palette.get(7 * i + 2)%>', '<%=palette.get(7 * i + 3)%>')">
                    <span id="span_like_heart<%= i %>" style="font-size: 16px; padding-right: 3px;">❤</span>
                    <span id="span_like<%= i %>" class="likes"><%=palette.get(7 * i + 4)%></span>
                </button>
                <span class="time"><%=palette.get(7 * i + 5)%></span>
            </div>
        </div>  
        <% 
    		}
    		else {
    	%>
    			<div class="box_palettes">
            <div class="palettes">
                <a href="details.jsp?NUM=<%= index.get(i) %>">
                    <div class="palette p1" style="background: <%=palette.get(7 * index.get(i))%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * index.get(i))%>')"><%=palette.get(7 * index.get(i)).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p2" style="background: <%=palette.get(7 * index.get(i) + 1)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * index.get(i) + 1)%>')"><%=palette.get(7 * index.get(i) + 1).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p3" style="background: <%=palette.get(7 * index.get(i) + 2)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * index.get(i) + 2)%>')"><%=palette.get(7 * index.get(i) + 2).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                    <div class="palette p4" style="background: <%=palette.get(7 * index.get(i) + 3)%>">
                        <div>
                            <div class="tooltip">
                                <span onclick="copy('<%=palette.get(7 * index.get(i) + 3)%>')"><%=palette.get(7 * index.get(i) + 3).toUpperCase()%></span>
                                <span class="tooltiptext">Copy!</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="desc_palettes">
                <button class="like" id="like<%= index.get(i) %>" onclick="toggleLikes(<%= index.get(i) %>, '<%=palette.get(7 * index.get(i))%>', '<%=palette.get(7 * index.get(i) + 1)%>', '<%=palette.get(7 * index.get(i) + 2)%>', '<%=palette.get(7 * index.get(i) + 3)%>')">
                    <span id="span_like_heart<%= index.get(i) %>" style="font-size: 16px; padding-right: 3px;">❤</span>
                    <span id="span_like<%= index.get(i) %>" class="likes"><%=palette.get(7 * index.get(i) + 4)%></span>
                </button>
                <span class="time"><%=palette.get(7 * index.get(i) + 5)%></span>
            </div>
        </div>  
    		<%
    		}
   		} %>
   		<div style="clear: both; height: 20px"></div>
   		<script>
   			function toggleLikes(num, color1, color2, color3, color4) {
   				var element = document.getElementById("like" + num);
   			   	element.classList.toggle("liked");
   			   	
   			 	var i = parseInt(document.getElementById("span_like" + num).innerHTML);
   			   	if(element.classList.contains('liked')) {
   			   		i++;
   			   		document.getElementById("span_like" + num).style.color = "#70a1d4";
   			   		document.getElementById("span_like_heart" + num).style.color = "#70a1d4";
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
			   		localStorage.removeItem(num);
   			   	}
   			 	document.getElementById("span_like" + num).innerHTML = i;
   			}
   			
   			window.onload = liked();
   			function liked() {
   				for(var i = 0; i < localStorage.length; i++ ) {
   					var key = localStorage.key(i);
   					if(parseInt(key) > <%= palette.size() - 1 %>) {
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