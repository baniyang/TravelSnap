<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<%
    String UserName = (String) session.getAttribute("user");

			if (UserName == null || UserName.equals(""))
				throw new Exception("not valid user!");
%>

<%
    session.invalidate();
			response.sendRedirect("index.jsp");
%>
