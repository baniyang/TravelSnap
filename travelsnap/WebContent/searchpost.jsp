<%-- Set the content type header with the JSP directive --%>
<%@ page contentType="application/json"%>

<%-- Set the content disposition header --%>
<%
	// Returns all employees (active and terminated) as json.
	response.setContentType("application/json");
	response.setHeader("Content-Disposition", "inline");
%>

<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />

[
<%
	String UserName = (String) session.getAttribute("user");
	post.setUserName(UserName);
	String query = request.getParameter("term");
	// System.out.println("Searching post: " + query);
	ResultSet rs1 = post.searchpost(query);
	boolean first = true;
	while (rs1.next()) {
		if (first) {
			first = false;
		} else {
%>,<%
	}
%>
{"label":"<%=rs1.getString("title")%>", "value":"<%=rs1.getString("title")%>",
"id":<%=rs1.getInt("postid")%>}
<%
	}
%>
]
