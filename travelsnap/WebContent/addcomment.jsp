<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<jsp:useBean scope="page" id="comment" class="jsp.travelsnap.comment" />

<%
    request.setCharacterEncoding("utf-8");
%>

<%
    String sPostID = request.getParameter("PostID");
    int PostID = Integer.parseInt(sPostID);
    String UserName = (String) session.getAttribute("user");
    String Content = request.getParameter("Content");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Comment Successfully Added!</title>
<link rel="stylesheet" href="./css/style_new.css" type="text/css"
	media="screen" />

</head>
<body>

	<%
	    comment.setPostID(PostID);
	    comment.setContent(Content);
	    comment.setUserName(UserName);
	    if (comment.add()) {
	%>

	<div id="wrap">
		<div class="header">
			<div class="logo">
				<a href="index.jsp"><img src="images/csspics/logo.gif" alt=""
					title="" border="0" /></a>
			</div>
		</div>
		<div class="center_content">
			<div class="left_content">

				<div class="title">
					<span class="title_icon"><img
						src="./images/csspics/bullet1.gif" alt="" title="" /></span>Congratulations!<br />
				</div>
				<div class="feat_prod_box_details">
					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<p class="details">Comment Successfully Added!</p>
							<p class="details">
								<a href="postdetail.jsp?PostID=<%=PostID%>">Back to the Post</a>
							</p>
						</div>
						<div class="box_bottom"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<!--end of left content-->


			<div class="clear"></div>
		</div>
		<!--end of center content-->

		<div class="footer"></div>
	</div>
	<%
	    } else {
			throw new Exception("Fail to Comment.");
	    }
	%>


</body>
</html>