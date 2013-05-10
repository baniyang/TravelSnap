<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Register Feedback</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

</head>
<body>


	<jsp:useBean scope="page" id="user" class="jsp.travelsnap.user" />

	<%
	    request.setCharacterEncoding("utf-8");
	%>


	<%
	    String name = request.getParameter("name");
	    user.setUserName(name);
	    if (user.exist()) {
			throw new Exception("Username already exsits.");
	    } else {
			String Password = request.getParameter("password");
			String Email = request.getParameter("email");
			String FName = request.getParameter("fname");
			String LName = request.getParameter("lname");
			String Avatar = request.getParameter("avatarurl");
			String Info = request.getParameter("info");
			String Gender = request.getParameter("gender");
			String Age = request.getParameter("age");
			String newFName = "";
			String newLName = "";
			int iAge = Integer.parseInt(Age);

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

			user.setPassword(Password);
			user.setEmail(Email);
			user.setFName(newFName);
			user.setLName(newLName);
			user.setAvatar(Avatar);
			user.setInfo(Info);
			user.setGender(Gender);
			user.setAge(iAge);

			/*System.out.println(name);
			System.out.println(Password);
			System.out.println(Email);
			System.out.println(newFName);
			System.out.println(newLName);
			System.out.println(Avatar);
			System.out.println(Info);
			System.out.println(Gender);
			System.out.println(iAge);*/

			if (user.add()) {
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
							<p class="details">Congratulations and Welcome to TravelSnap!</p>
							<p class="details">
								<a href="./index.jsp">Login Now!</a>
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
			    throw new Exception("Fail to Register....Try again later.");
			}

	    }
	%>

</body>
</html>