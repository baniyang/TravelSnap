<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Password Changed Successfully!</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

</head>
<body>
	<jsp:useBean scope="page" id="User" class="jsp.travelsnap.user" />
	<%
		request.setCharacterEncoding("utf-8");
	%>


	<%
		String UserName = (String) session.getAttribute("user");
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		//String newPwdCon=request.getParameter("newPwdCon");
		User.setUserName(UserName);
		User.show();

		String origin = User.getPassword();

		//System.out.println(origin);
		//System.out.println(oldPwd);

		if (origin.equals(oldPwd)) {
			User.setPassword(newPwd);

			if (User.modifypass()) {
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

<div class="title"><span class="title_icon"><img src="./images/csspics/bullet1.gif" alt="" title="" /></span>Congratulations!<br /></div>
            <div class="feat_prod_box_details">
             <div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
	<p class="details">Password Changed Successfully!</p>
	<p class="details"><a href="userindex.jsp">Back Home</a></p>
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

   <div class="footer">
       	
       </div>
	</div>
	<%
		} else {
				throw new Exception("Fail to Change...Try Again Later.");
			}

		} else
			throw new Exception("Change Failed");
	%>

</body>
</html>