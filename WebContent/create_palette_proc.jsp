<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String palette1 = request.getParameter("palette1");
	String palette2 = request.getParameter("palette2");
	String palette3 = request.getParameter("palette3");
	String palette4 = request.getParameter("palette4");
	
	//out.println(palette1);
	
	//String filePath = application.getRealPath("/palette/palette.txt");
	//String filePath = "D:\\colorhunt\\palette\\palette.txt";
	String filePath = "C:\\project_model\\colorhunt\\palette\\palette.txt";
    PrintWriter pw = null;
    try {
        pw = new PrintWriter(new FileOutputStream(new File(filePath), true));
        pw.println();
        pw.println("#" + palette1);
        pw.println("#" + palette2);
        pw.println("#" + palette3);
        pw.println("#" + palette4);
        pw.println("0");
        pw.println("Today");
        pw.print("#black #red");
        pw.flush();
        pw.close();
%>
	<jsp:forward page="template.jsp">
		<jsp:param name="CONTENTPAGE" value="details.jsp?NUM=-1"/>
	</jsp:forward>        
<%
    } 
    catch (FileNotFoundException e) {        
        e.printStackTrace();
    } 
    catch (IOException e) {          
        e.printStackTrace();
    }
    finally{
        if(pw != null) 
        	pw.close();
    }
%>