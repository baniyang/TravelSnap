<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
	errorPage="errors/error.jsp"%>
	
<%
	if(session.getAttribute("user")!=null)
	    response.sendRedirect("./userindex.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to TravelSnap!</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
</head>
<body>
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
						src="images/csspics/bullet1.gif" alt="" title="" /></span>PLEASE LOGIN
				</div>
				<div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">Input Information</div>
						<form method="post" action="logincheck.jsp" class="form"
							name="register">
							<div class="form_row">
								<label class="contact"><strong> Username:</strong></label><input
									type="text" name="userName" class="contact_input" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Password:</strong></label><input
									type="password" name="pwd" class="contact_input" />
							</div>
							<div class="form_row">
								<input type="submit" value="Login" class="register" />
							</div>
						</form>
						<div class="form_row">
							<a href="register.jsp">Click to Register</a>
						</div>
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

</body>
</html>