<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
  <style>
      * {
            color: #263646;
            font-family: 'Rubik';
            font-size: 14px;
      }
      body {
          font-family: 'Rubik';
          background: #fdfdfd;
      }
      h1 {
          color: #263646;
          font-size: 20px;
          font-weight: normal;
      }
      h2 {
          color: #263646;
          font-size: 14px;
          font-weight: normal;
          line-height: 20px;
      }
      
      #search {
          border: 1px solid #e9f2f9;
          border-radius: 4px;
          width: 200px;
          height: 36px;
          line-height: 36px;
          vertical-align: middle;
          background-color: white;
          padding: 0px 10px;
          cursor: pointer;
      }
      #search input {
      	  margin-top: 10px;
          border: none;
          font-family: 'Rubik';
          width: 180px;
          cursor: pointer;
      }
      #search input::placeholder {
          color: #899bb4;
      }
      .search_dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		.search_dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: white;
		  width: 220px;
		  max-height: 270px;
		  overflow: auto;
		  border-radius: 0px 0px 5px 5px;
		  z-index: 1;
		}
		
		.search_dropdown-content a {
		  color: #263646;
		  height: 36px;
		  line-height: 36px;
		  padding: 0px 10px;
		  text-decoration: none;
		  display: block;
		}
		.search_dropdown-content a span {
			padding-right: 10px;
			font-size: 18px;
			vertical-align: middle;
		}
		.search_dropdown a:hover {
			background-color: #e9f2f9;
		}
		.show {
			display: block;
		}
      #description {
      	  min-height: 150px;
          margin: 20px 0px 30px;
      }
      #ad img {
          border-radius: 4px;
          margin-bottom: 30px;
      }
      #chrome_store {
          font-size: 14px;
          color: #263646;
      }
      #chrome_store a button {
          width: 220px;
          height: 36px;
          border: 1px solid #e9f2f9;
          border-radius: 3px;
          background: white;
          margin-top: 20px;
          cursor: pointer;
      }
      #chrome_store a button:hover {
          background: #e9f2f9;
      }
      #footer {
          font-size: 12px;
          color: #899bb4;
          margin-top: 20px;
      }
      #footer a, #footer a:visited {
          font-size: 12px;
          color: #899bb4;
          text-decoration: none;
      }
      #footer a:hover {
          text-decoration: underline;
      }
  </style>
</head>

<body>
    <div class="search_dropdown">
    	<div id="search" onclick="toggleSearch()" onkeyup="filterFunction()">
	        <input type="text" id="colors" placeholder="Search Palettes">
	        <img src="image/search.png" width="17" style="float: right; padding-top: 10px;">
	    </div>
    	<div id="search_dropdown" class="search_dropdown-content">
    		<a href="main.jsp?category=red"><span style="color: #ff3737;">●</span>Red</a>
    		<a href="main.jsp?category=orange"><span style="color: #ff8227;">●</span>Orange</a>
    		<a href="main.jsp?category=brown"><span style="color: #c29867;">●</span>Brown</a>
    		<a href="main.jsp?category=yellow"><span style="color: #ffe272;">●</span>Yellow</a>
    		<a href="main.jsp?category=green"><span style="color: #9de16f;">●</span>Green</a>
    		<a href="main.jsp?category=turquoise"><span style="color: turquoise;">●</span>Turquoise</a>
    		<a href="main.jsp?category=blue"><span style="color: #53afff;">●</span>Blue</a>
    		<a href="main.jsp?category=purple"><span style="color: #de6fff;">●</span>Purple</a>
    		<a href="main.jsp?category=pink"><span style="color: #ff74be;">●</span>Pink</a>
    		<a href="main.jsp?category=grey"><span style="color: #bccdde;">●</span>Grey</a>
    		<a href="main.jsp?category=black"><span style="color: black;">●</span>Black</a>
    		<a href="main.jsp?category=white"><span style="color: white;">●</span>White</a>
    		<a href="main.jsp?category=warm" style="border-top: 1px solid #e9f2f9"><span><img src="image/star.png" width="16"></span>Warm</a>
    		<a href="main.jsp?category=cold"><span><img src="image/star.png" width="16"></span>Cold</a>
    		<a href="main.jsp?category=bright"><span><img src="image/star.png" width="16"></span>Bright</a>
    		<a href="main.jsp?category=dark"><span><img src="image/star.png" width="16"></span>Dark</a>
    		<a href="main.jsp?category=gold" style="border-top: 1px solid #e9f2f9"><span><img src="image/star.png" width="16"></span>Gold</a>
    		<a href="main.jsp?category=neon"><span><img src="image/star.png" width="16"></span>Neon</a>
    		<a href="main.jsp?category=pastel"><span><img src="image/star.png" width="16"></span>Pastel</a>
    		<a href="main.jsp?category=skin"><span><img src="image/star.png" width="16"></span>Skin</a>
    		<a href="main.jsp?category=vintage"><span><img src="image/star.png" width="16"></span>Vintage</a>
    		<a href="main.jsp?category=retro"><span><img src="image/star.png" width="16"></span>Retro</a>
    		<a href="main.jsp?category=wedding"><span><img src="image/star.png" width="16"></span>Wedding</a>
    		<a href="main.jsp?category=sunset" style="border-top: 1px solid #e9f2f9"><span><img src="image/star.png" width="16"></span>Sunset</a>
    		<a href="main.jsp?category=summer"><span><img src="image/star.png" width="16"></span>Summer</a>
    		<a href="main.jsp?category=autumn"><span><img src="image/star.png" width="16"></span>Autumn</a>
    		<a href="main.jsp?category=winter"><span><img src="image/star.png" width="16"></span>Winter</a>
    		<a href="main.jsp?category=spring"><span><img src="image/star.png" width="16"></span>Spring</a>
    		<a href="main.jsp?category=christmas" style="border-top: 1px solid #e9f2f9"><span><img src="image/star.png" width="16"></span>Christmas</a>
    		<a href="main.jsp?category=halloween"><span><img src="image/star.png" width="16"></span>Halloween</a>
    	</div>
    </div>
    <div id="description"></div>
    <div id="ad">
        <a href="https://www.wix.com/eteamhtml/900_create?utm_source=media_buying&utm_medium=paid_referral&utm_campaign=ma_Colorhunt&experiment_id=220" target="_blank">
            <img src="image/wix-ad.png" width="220" height="220">
        </a>
    </div>
    <div id="chrome_store">
        Get our Chrome extension for <br>
        color inspiration in every new tab <br>
        <a href="https://chrome.google.com/webstore/detail/color-tab/hchlgfaicmddilenlflajnmomalehbom" target="_blank">
            <button>
                <img src="image/chrome.png" height="16px" style="vertical-align: bottom; margin-right: 3px;">
                Add to Chrome
            </button>
        </a>
    </div>
    <div id="footer">
        Made with <img src="image/unlike.png" width="11px"> by 
        <a href="https://galshir.com/?ref=colorhunt_bar" target="_blank">Gal Shir</a>
    </div>
    <script>
		function toggleSearch() {
		 	document.getElementById("search_dropdown").classList.toggle("show");
		}
		
		function filterFunction() {
  			var input, filter, ul, li, a, i;
		  	input = document.getElementById("colors");
		  	filter = input.value.toUpperCase();
		  	div = document.getElementById("search_dropdown");
		  	a = div.getElementsByTagName("a");
		  	for (i = 0; i < a.length; i++) {
		    	txtValue = a[i].textContent || a[i].innerText;
		    	if (txtValue.toUpperCase().indexOf(filter) > -1) {	
		      		a[i].style.display = "";
		    	} 
		    	else {
		      		a[i].style.display = "none";
		    	}
		  }
		}
		window.onload = liked();
		function liked() {
			var parentElement = document.getElementById('description');
			if(localStorage.length == 0) {
				var element1 = document.createElement('h1');
				var element2 = document.createElement('h2');
				element1.innerHTML = 'Color Palettes for <br> Designers and Artists';
				element2.innerHTML = 'Color Hunt is a free and open <br>'
			             + 'platform for color inspiration with <br>'
			             + 'thousands of trendy hand-picked <br>'
			             + 'color palettes';
				parentElement.appendChild(element1);
				parentElement.appendChild(element2);
			}
			else {
				var element1 = document.createElement('h1');
				var element2 = document.createElement('h2');
				element1.innerHTML = 'You Liked ' + localStorage.length + ' Palettes!';
				element2.innerHTML = 'Choose More Palettes <br> You Liked!';
				parentElement.appendChild(element1);
				parentElement.appendChild(element2);
			}
		} 
	</script>
</body>
</html>