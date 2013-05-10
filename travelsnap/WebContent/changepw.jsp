<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Change Password</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
</head>
<body>
	<script type="text/javascript" src="js/changepwcheck.js">
		
	</script>
	<jsp:useBean scope="page" id="User" class="jsp.travelsnap.user" />
	<%
	    String UserName = (String) session.getAttribute("user");
	    User.setUserName(UserName);
	    User.show();
	%>
	<div id="wrap">
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		<div class="center_content">
			<div class="left_content">



				<div class="title">
					<span class="title_icon"><img
						src="images/csspics/bullet1.gif" alt="" title="" /></span>Change
					Password
				</div>
				<div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">Input Information</div>
						<form method="post"
							action="changepwresult.jsp?UserName=<%=UserName%>" class="form"
							name="passform">
							<div class="form_row">
								<label class="contact"><strong> Old Password:</strong></label><input
									type="password" name="oldPwd" class="contact_input" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> New Password:</strong></label><input
									type="password" name="newPwd" class="contact_input" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Confirm
										Password:</strong></label><input type="password" name="newPwdCon"
									class="contact_input" />
							</div>
							<div class="form_row">
								<input type="submit" value="Submit" class="register"
									onclick="return CheckData()" />
							</div>
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