<%@ page language="java" pageEncoding="UTF-8"
	errorPage="errors/error.jsp"%>
<jsp:useBean scope="page" id="user" class="jsp.travelsnap.user" />

<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String username = request.getParameter("userName");
    String password = request.getParameter("pwd");

    user.setUserName(username);
    user.setPassword(password);

    if (username == null || password == null || username.equals("")
		    || password.equals("")) {
		throw new Exception("Input can NOT be NULL.");
    } else if (!user.valid()) {
		throw new Exception("Fail to Login (Wrong Input?)");
    } else {
		session.setAttribute("user", user.getUserName());
		response.sendRedirect("./userindex.jsp");
    }
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Login Check</title>

<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>

<body>

</body>
</html>