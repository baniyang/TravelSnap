<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />

<%
	String UserName = (String) session.getAttribute("user");

	if (UserName == null || UserName.equals(""))
		throw new Exception("not valid user!");
 
	String Location = request.getParameter("Location");
	request.setCharacterEncoding("utf-8");
	System.out.println(Location);
%>

<html>
  <head>
    <script src="js/jquery-1.7.1.js"></script>
    
    <title>Flickr Image Search</title>

    <script type="text/javascript" src="js/flickrscript.js"></script>
  </head>
  <body>
    <input type="hidden" value="<%=Location%>" id="searchterm" />
   <br /> &nbsp;<button id="search">Click to See More Photos of <%=Location%></button><br />
    <div id="results"></div>
  </body>
</html>