<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Your Profile</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
</head>
<body>


	<jsp:useBean scope="page" id="User" class="jsp.travelsnap.user" />
	<%
	    //get username
	    String UserName = (String) session.getAttribute("user");
	    //get userinfo
	    User.setUserName(UserName);
	    User.show();
	%>

	<script type="text/javascript" src="js/infoeditcheck.js"></script>

	<div id="wrap">
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		<div class="center_content">
			<div class="left_content">



				<div class="title">
					<span class="title_icon"><img
						src="images/csspics/bullet1.gif" alt="" title="" /></span>Edit Your
					Profile
				</div>
				<div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">Input Information</div>
						<form method="post"
							action="usereditresult.jsp?UserName=<%=UserName%>" class="form"
							name="editForm">

							<div class="form_row">
								<label class="contact"><strong>User: <%=UserName%></strong></label>
								<img src="<%=User.getAvatar()%>" height="100" width="100"></img>
							</div>

							<div class="form_row">
								<label class="contact"><strong> Email:</strong></label> <input
									type="text" name="Email" value="<%=User.getEmail()%>"
									class="contact_input" maxlength="64" />
							</div>

							<div class="form_row">
								<label class="contact"><strong> First Name:</strong></label> <input
									type="text" name="FName" value="<%=User.getFName()%>"
									class="contact_input" maxlength="20" />
							</div>

							<div class="form_row">
								<label class="contact"><strong> Last Name:</strong></label> <input
									type="text" name="LName" value="<%=User.getLName()%>"
									class="contact_input" maxlength="20" />
							</div>

							<div class="form_row">
								<label class="contact"><strong> Introduction:</strong></label>
								<textarea name="Info" class="contact_textarea" id="info"
									rows="6" cols="29"><%=User.getInfo()%></textarea>
							</div>

							<div class="form_row">
								<label class="contact"><strong> Age:</strong></label> <input
									type="text" class="contact_input" name="Age"
									value="<%=User.getAge()%>"
									onkeyup="value=value.replace(/[^\d]/g,'')" />
							</div> <br /><br />



							<input type="submit" value="Edit" class="register"
								onclick="return CheckData()" /> 
						</form>


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