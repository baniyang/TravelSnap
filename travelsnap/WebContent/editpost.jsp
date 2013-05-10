<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*" import="javaxt.io.Image"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Post</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
<link href="./css/uploadify.css" rel="stylesheet" type="text/css" />


</head>
<body>

	<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />


	<%
	    String UserName = (String) session.getAttribute("user");
	    String Author = request.getParameter("author");

	    if (UserName == null || UserName.equals("")
			    || (!UserName.equals(Author)))
			throw new Exception("not valid user!");

	    String sPostID = request.getParameter("PostID");
	    int PostID = Integer.parseInt(sPostID);
	    request.setCharacterEncoding("utf-8");

	    post.setPostID(PostID);
	    post.show();
	%>


	<div id="wrap">
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		<div class="center_content">
			<div class="left_content">



				<div class="title">
					<span class="title_icon"><img
						src="images/csspics/bullet1.gif" alt="" title="" /></span>Edit Post
				</div>
				<div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">Input Information</div>
						<form method="post"
							action="editpostresult.jsp?PostID=<%=sPostID%>" class="form"
							name="editPostForm">
							<div class="form_row">
								<label class="contact"><strong> Title:</strong></label><input
									type="text" name="Title" class="contact_input"
									value="<%=post.getTitle()%>" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Location:</strong></label><input
									type="text" name="Location" class="contact_input"
									value="<%=post.getLocation()%>" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Introduction:</strong></label>
								<textarea name="Content" class="contact_textarea" id="Content"
									rows="6" cols="29"><%=post.getContent()%></textarea>
							</div>
                             
							<input type="submit" value="Edit" class="button" /> &nbsp; <input
								type="reset" value="Reset" class="button" />
						</form>
						<br />

					</div>
				</div>
				<div class="clear"></div>
			</div>
			<!--end of left content-->
			<div class="right_content">
				<%@include file="include/rightMenu.jsp"%>
			</div>

			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<div class="footer"></div>
	</div>

</body>
</html>