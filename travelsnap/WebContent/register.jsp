<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
<link href="./css/uploadify.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
</head>
<body>
<%
	if(session.getAttribute("user")!=null)
	    response.sendRedirect("./userindex.jsp");
%>

	<script type="text/javascript" src="js/regcheck.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/swfobject.js"></script>
    <script type="text/javascript" src="js/jquery.uploadify.v2.1.4.min.js"></script>
	
	<script type="text/javascript">
    $(document).ready(function() {

        $("#uploadify").uploadify({
        	'uploader': 'js/uploadify.swf?ts='+ new Date().getTime(),
            'script' : 'servlet/UploadAvatar',
            'cancelImg' : 'images/cancel.png',
            'queueID' : 'avatar',
            'queueSizeLimit' : 1,   
            'SizeLimit' : 1024000,
            'fileDesc' : 'only JPG, JPEG, GIF and PNG allowed',
            'fileExt' : '*.jpg;*.jpeg;*.gif;*.png', 
            'auto' : false,
            'multi' : false,
            'removeCompleted' : true,
            'buttonText' : 'Browse',
            'onComplete': function(event, queueID, fileObj, response, data) {
                document.getElementById('avatarurl').value = response;
                }

        });
    });
</script>
	
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
						src="images/csspics/bullet1.gif" alt="" title="" /></span>Register
				</div>
				<div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">Input Information</div>
						<form method="post" action="regfeedback.jsp" class="form"
		name="regForm">
							<div class="form_row">
								<label class="contact"><strong> Username:</strong></label><input
									type="text" name="name" class="contact_input" maxlength="20"/>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Password:</strong></label><input
									type="password" name="password" class="contact_input" maxlength="20"/>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Confirm Password:</strong></label><input
									type="password" name="pwdConfirm" class="contact_input" maxlength="20"/>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Email:</strong></label><input
									type="text" name="email" class="contact_input" maxlength="64"/>
							</div>
							<div class="form_row">
								<label class="contact"><strong> First Name:</strong></label><input
									type="text" name="fname" class="contact_input" maxlength="20"/>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Last Name:</strong></label><input
									type="text" name="lname" class="contact_input" maxlength="20"/>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Introduction:</strong></label>
								<textarea name="info" class="contact_textarea" id="info"></textarea>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Age:</strong></label><input type="text" class="contact_input" name="age"onkeyup="value=value.replace(/[^\d]/g,'')" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Gender:</strong></label>
								Male <input type="radio" value="male" id="gender" name="gender" />&nbsp;
          Female <input type="radio" value="female" id="gender" name="gender" />&nbsp;
          Other <input type="radio" value="other" id="gender" name="gender" checked="checked" />
							</div>
							<div class="form_row">
						<label class="contact"><strong> Avatar:</strong></label>
        <div id="avatar"></div>
        <input type="hidden" name="avatarurl" id="avatarurl" />
		<input type="file" name="uploadify" id="uploadify" class="contact_input"/><br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <b><a href="javascript:jQuery('#uploadify').uploadifyUpload()">Upload</a></b>
							</div>
							
							
							<input type="submit" value="Register" class="register" onclick="return CheckData();" />
						</form>
						
						<br />
						

					</div>
					<div class="form_row">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp"><b>I Already Have an Account</b></a>&nbsp;
						</div>
				</div>
				<div class="clear"></div>
			</div>
			<!--end of left content-->
							<div class="right_content">
				
			</div>

			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<div class="footer"></div>
	</div>

</body>
</html>