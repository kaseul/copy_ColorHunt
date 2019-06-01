<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!doctype html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Rubik" rel="stylesheet">
        <script src="ColorPicker/colorpicker.js"></script>
        <link rel="stylesheet" type="text/css" href="ColorPicker/themes.css" />
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
            h1.create {
                font-size: 20px;
                margin: 0px 0px 40px;
            }
            div.create {
                width: 400px;
                height: 400px;
            }
            div.create_p {
                width: 100%;
            }
            div.create_p.p1 {
                height: 35%;
                background: #dddddd;
                border-radius: 5px 5px 0px 0px;
            }
            div.create_p.p2 {
                height: 27%;
                background: #cccccc;
            }
            div.create_p.p3 {
                height: 17%;
                background: #bbbbbb;
            }
            div.create_p.p4 {
                height: 15%;
                background: #aaaaaa;
                border-radius: 0px 0px 5px 5px;
            }
            button.done {
                visibility: hidden;
                padding: 10px;
                border: 1px solid #e9f2f9;
                border-radius: 3px;
                background: white;
            }
        </style>
    </head>
    <body style="height: 600px">
            <div style="top:0">
            	<center>
                <h1 class="create">Create a Color Palette!</h1>
                <div class="create">
                    <div id="palette1" class="create_p p1" onclick="changePalette('palette1')">

                    </div>
                    <div id="palette2" class="create_p p2" onclick="changePalette('palette2')">

                    </div>
                    <div id="palette3" class="create_p p3" onclick="changePalette('palette3')">

                    </div>
                    <div id="palette4" class="create_p p4" onclick="changePalette('palette4')">

                    </div>
                </div>
                <button id="create_done" class="done" onclick="create()">
                   Done
                </button>
                </center>
                </div>
            
            <div id="small" class="cp cp-small"></div>
        <script src="ColorPicker/showcase.js"></script>
        <script>
	        function hiddenColorPicker() {
	            document.getElementById('small').visibility="hidden";
	        }
		   	function create() {
		   		var element = document.getElementById('palette1');
	            var color;
	            var url = "create_palette_proc.jsp?";
	            
	            for(i = 0; i < 4; i++) {
	               element = document.getElementById('palette' + (i+1));
	               if (element.currentStyle) {
	                   //alert(element.currentStyle.backgroundColor);
	                   color = element.currentStyle.backgroundColor;
	                   url += "palette" + (i+1) + "=" + rgbToHex(color) + "&";
	               } 
	               else {
	                   //alert(window.getComputedStyle(element,null).backgroundColor);
	                   color = window.getComputedStyle(element,null).backgroundColor;
	                   url += "palette" + (i+1) + "=" + rgbToHex(color) + "&";
	               }    
	            }
	           
	            url = url.substring(0, url.length - 1);
	           
	            location.href = url;
		   	}
		        
		   	function rgbToHex(rgb) {
		   		rgb = rgb.substring(rgb.indexOf('(') + 1, rgb.length - 1);
	            var hex = "";
	            var code;
	            var start = 0;
	            var end;
		   		while(true) {
	               end = rgb.indexOf(',', start + 1);
	               if(end == -1) {
	                   code = parseInt(rgb.substring(start));
	                   if(code == 0) {
	                       hex += "00";
	                   }
	                   else if(code / 10 == 0) {
	                	   hex += "0" + code;
	                   }
	                   else {
	                       hex += code.toString(16);
	                   }
	                   break;
	               }
	               else {
	                   code = parseInt(rgb.substring(start, end));
	               }
	               if(code == 0) {
	                   hex += "00";
	               }
	               else if(code / 10 == 0) {
                	   hex += "0" + code;
                   }
	               else {
	                   hex += code.toString(16);
	               }
	               start = end + 2;
	           }
	           hex = hex.toUpperCase();
	           //alert(hex);
	           return hex;
		   	}
        </script>
    </body>
</html>