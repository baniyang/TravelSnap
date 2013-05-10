<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<%@ page import="java.sql.*" import="javaxt.io.Image"%>

<%
    String UserName = (String) session.getAttribute("user");
    if (UserName.equals(""))
		throw new Exception("not valid user!");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Post</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
<link href="./css/uploadify.css" rel="stylesheet" type="text/css" />
<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />

</head>
<body>


	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.uploadify.v2.1.4.min.js"></script>
	<script type="text/javascript" src="js/swfobject.js"></script>
	

    <script type="text/javascript">
    $(document).ready(function() {
       
    	$("#uploadify").uploadify({
        	'uploader': 'js/uploadify.swf?ts='+ new Date().getTime(),
            'script' : 'servlet/UploadPhoto',
            'cancelImg' : 'images/cancel.png',
            'queueID' : 'travelphoto',
            'queueSizeLimit' : 1,  
            'SizeLimit' : 1024000,
            'fileDesc' : 'only JPG, JPEG, GIF and PNG allowed',
            'fileExt' : '*.jpg;*.jpeg;*.gif;*.png', 
            'auto' : false,
            'multi' : false,
            'removeCompleted' : true,
            'buttonText' : 'Browse',
            'onComplete': function(event, queueID, fileObj, response, data) {
                document.getElementById('photoinfo').value = response;
                }

        });
    });
    </script>

	<div id="wrap">
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		<div class="center_content">
			<div class="left_content">



				<div class="title">
					<span class="title_icon"><img
						src="images/csspics/bullet1.gif" alt="" title="" /></span>Add Post
				</div>
				<div class="feat_prod_box_details">
					<div class="contact_form">
						<div class="form_subtitle">Input Information</div>
						<form method="post" action="addpostresult.jsp" class="form"
							name="addPostForm">
							<div class="form_row">
								<label class="contact"><strong> Title:</strong></label><input
									type="text" name="Title" class="contact_input" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Location:</strong></label><input
									type="text" name="Location" class="contact_input" />
							</div>
							<div class="form_row">
								<label class="contact"><strong> Introduction:</strong></label>
								<textarea name="Content" class="contact_textarea" id="Content"
									rows="6" cols="29"></textarea>
							</div>
							<div class="form_row">
								<label class="contact"><strong> Photo:</strong></label>
								<div id="travelphoto"></div>
								<input type="hidden" name="photoinfo" id="photoinfo" /> <input
									type="file" name="uploadify" id="uploadify"
									class="contact_input" /><br />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<b><a href="javascript:jQuery('#uploadify').uploadifyUpload()">Upload</a></b>
							</div>

							<input type="submit" value="Submit" class="register" />
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