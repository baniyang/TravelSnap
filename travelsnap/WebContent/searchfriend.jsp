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
<jsp:useBean scope="page" id="lfriend" class="jsp.travelsnap.friend" />

[
<%
	String UserName = (String) session.getAttribute("user");
	lfriend.setUserName(UserName);
	String query = request.getParameter("term");
	// System.out.println("Searching friend: " + query);
	ResultSet rs1 = lfriend.search(query);
	boolean first = true;
	while (rs1.next()) {
		if (first) {
			first = false;
		} else {
			%>,<%
		}
%>
{"label":"<%=rs1.getString("flist")%>", "value":"<%=rs1.getString("flist")%>",
"id":<%=rs1.getInt("friendid")%>}
<%
	}
%>
]
