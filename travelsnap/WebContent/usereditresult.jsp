<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Result</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

</head>
<body>
	<jsp:useBean scope="page" id="User" class="jsp.travelsnap.user" />
	
	<%
	    request.setCharacterEncoding("utf-8");
	%>


	<%
	    String UserName = (String) session.getAttribute("user");
	    String UserEmail = request.getParameter("Email");

	    String Age = request.getParameter("Age");
	    int iAge = Integer.parseInt(Age);
	    String FName = request.getParameter("FName");
	    String LName = request.getParameter("LName");
	    String Info = request.getParameter("Info");
	    String newFName = "";
	    String newLName = "";
	    System.out.println(Age);
	    
	    if (Character.isUpperCase(FName.charAt(0)))
			newFName = FName;
	    else
			newFName = (new StringBuilder())
				.append(Character.toUpperCase(FName.charAt(0)))
				.append(FName.substring(1)).toString();
	    if (Character.isUpperCase(LName.charAt(0)))
			newLName = LName;
	    else
			newLName = (new StringBuilder())
				.append(Character.toUpperCase(LName.charAt(0)))
				.append(LName.substring(1)).toString();

	    User.setEmail(UserEmail);
	    User.setUserName(UserName);
	    User.setFName(newFName);
	    User.setLName(newLName);
	    User.setAge(iAge);
	    User.setInfo(Info);

	    if (User.modify()) {
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
							<p class="details">Information Edited Successfully!</p>
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
			throw new Exception("Fail to Edit...Try Again Later.");
	    }
	%>


</body>
</html>