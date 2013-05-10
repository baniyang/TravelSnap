<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<%@ page import="java.sql.*"%>

<%
    String UserName = (String) session.getAttribute("user");

    if (UserName == null || UserName.equals(""))
		throw new Exception("not valid user!");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Friend Successfully Added!</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
<jsp:useBean scope="page" id="friend" class="jsp.travelsnap.friend" />
</head>
<body>


	<%
	    request.setCharacterEncoding("utf-8");
	    String FriendName = request.getParameter("FriendName");
	    System.out.println(UserName);
	    System.out.println(FriendName);
	    friend.setUserName(UserName);
	    friend.setFriendName(FriendName);

	    if (!friend.valid(FriendName)) {
			if (friend.add()) {
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
							<p class="details">Friend Successfully Added!</p>
							<p class="details">
								<a href="friendindex.jsp?FriendName=<%=FriendName%>"><b>Go
										Back</b></a>
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
			    throw new Exception("Failed!Try Again.");
			}

	    } else {
			throw new Exception("Can not add one person twice!");
	    }
	%>


</body>
</html>