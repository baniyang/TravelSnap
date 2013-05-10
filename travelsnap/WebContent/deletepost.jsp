<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<%
    String UserName = (String) session.getAttribute("user");
    String Author = request.getParameter("author");

    if (UserName == null || UserName.equals("")
		    || (!UserName.equals(Author)))
		throw new Exception("not valid user!");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Post Deleted Successfully!</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

</head>
<body>
	<div id="test">
		<div class="center">

			<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />
			<%
			    request.setCharacterEncoding("utf-8");

			    String sPostID = request.getParameter("PostID");
			    int PostID = Integer.parseInt(sPostID);
			    post.setPostID(PostID);

			    if (post.delete(PostID)) {
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
									<p class="details">Post Deleted Successfully!</p>
									<p class="details">
										<a href="userindex.jsp">Back Home</a>
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
					out.println(PostID);
					throw new Exception("Failed to Delete.");
			    }
			%>

		</div>
	</div>
</body>
</html>