<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <!doctype html>
    <html>
    	<head>
    		<style>
    			* {
	                color: #263646;
	                font-family: 'Rubik';
	                font-size: 14px;
	                font-weight: normal;
	            }
	            body {
	                background: #fdfdfd;
	            }
	           	h1 {
	           		font-size: 24px;
	           		margin: 50px 0px;
	           	}
	           	a button {
	           		padding: 10px 15px;
	                border: 1px solid #e9f2f9;
	                border-radius: 3px;
	                background: white;
	                margin-top: 50px;
	                font-size: 20px;
	           	}
	           	.palettes {
	           		display: inline-block;
	           		width: 200px;
	           		height: 200px;
	           		background: white;
	           		border-radius: 5px;
	           		margin: 15px;
	           	}
	           	.place {
	           		width: 100%;
	           		position: relative;
	           	}
	           	.p1 {
	           		height: 35%;
	           		background: #eee;
	           		border-radius: 5px 5px 0px 0px;
	           	}
	           	.p2 {
	           		height: 27%;
	           		background: #bbb;
	           	}
	           	.p3 {
	           		height: 17%;
	           		background: #888;
	           	}
	           	.p4 {
	           		height: 15%;
	           		background: #555;
	           		border-radius: 0px 0px 5px 5px;
	           	}
	           	.palettes div div {
				    position: absolute;
				    bottom: 0px;
				}
	           	.palettes div div span {
				    visibility: hidden;
				    position: relative;
				    bottom: 0px;
				    padding: 3px 6px;
				    border-radius: 0px 3px 0px 0px;
				    background: rgba(0, 0, 0, 0.1);
				    color: #fff;
				    transition-duration: 0.2s;
				    transition-delay: 0s;
				    transition-timing-function: ease;
				    cursor: pointer;
				}
				div.palettes div div span:hover {
				    background: rgba(0, 0, 0, 0.2);
				}
				div.place:hover div span {
				    visibility: visible;
				}
    		</style>
    	</head>
    	<body style="height: 600px">
    		<center>
    			<div id="likesContainer" style="top: 0; text-align: center; width: 1000px;"></div>
    		</center>
    	</body>
    	<script>
    		window.onload = isLikes();
    		function isLikes() {
    			var container = document.getElementById("likesContainer");
    			if(localStorage.length == 0) {
    				container.innerHTML = "<center>"
        				+ "<h1>My Palettes Collection</h1>"
        				+ '<img src="image/nolikes.png" width="600">'
        				 + '<div style="font-size: 18px; line-height: 24px;">'
    	    				 + '<p style="font-size: 18px; line-height: 26px;">No Likes Yet</p>'
    						+ "Seems like you haven't like anything yet.<br>"
    						+ 'Just hit the "Like" button on any palette and come back here to see your personal collection.<br>'
    					+ "</div>"
    					+ '<a href="main.jsp">'
    						+ '<button style="">'
    						+ 'Explore Some Colors'
    						 + "</button>"
    					+ "</a>"
        			+ "</center>";
    			}
    			else {
    				var key;
    				var val;
    				var arr;
    				container.innerHTML = "<center>"
						+ "<h1>My Palettes Collection</h1>"
						+ "<p style='font-size: 16px; margin: 20px 0px 50px'>You Liked " + localStorage.length + " Palettes</p>"
						+ "<div style=''>";
    				for(var i = 0; i < localStorage.length; i++) {
    					key = localStorage.key(i);
    					val = localStorage.getItem(key);
    					arr = JSON.parse(val);
    					container.innerHTML += "<div class='palettes'>"
	        				+ '<a href="details.jsp?NUM=' + key + '">'
	    	    				+ '<div class="place p1" style="background:' + arr[0] + '">'
	    	    					+ '<div>'
	    	    						+ '<span>' + arr[0] + '</span>'
	    	    					 + '</div>'
	    	    				+ '</div>' 
	    	    				+ '<div class="place p2" style="background:' + arr[1] + '">'
	    	    					+ '<div>'
	    	    						+ '<span>' + arr[1] + '</span>'
	    	    					 + '</div>'
	    	    				+ '</div>' 
	    	    				+ '<div class="place p3" style="background:' + arr[2] + '">'
	    	    					+ '<div>'
	    	    						+ '<span>' + arr[2] + '</span>'
	    	    					 + '</div>'
	    	    				+ '</div>' 
	    	    				+ '<div class="place p4" style="background:' + arr[3] + '">'
	    	    					+ '<div>'
	    	    						+ '<span>' + arr[3] + '</span>'
	    	    					 + '</div>'
	    	    				+ '</div>' 
	        				+ '</a>'
	        			 + '</div>';
    				}
    			}
    		}
    	</script>
    </html>