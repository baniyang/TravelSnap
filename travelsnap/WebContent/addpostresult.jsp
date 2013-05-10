<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../errors/error.jsp"%>
<%
    String UserName = (String) session.getAttribute("user");
    if (UserName.equals(""))
		throw new Exception("not valid user!");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>AddPostResult</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

</head>
<body>
	<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />
	<jsp:useBean scope="page" id="photo" class="jsp.travelsnap.photo" />

	<%
	    request.setCharacterEncoding("utf-8");
	%>




	<%
	    String Title = request.getParameter("Title");
	    String Content = request.getParameter("Content");
	    String Location = request.getParameter("Location");

	    post.setTitle(Title);
	    post.setContent(Content);
	    post.setUserName(UserName);
	    post.setLocation(Location);

	    String Info = request.getParameter("photoinfo");
	    //System.out.println(Info);
	    String[] PhotoInfo = new String[3];
	    PhotoInfo = Info.split("\\^");
	    for (int i = 0; i < PhotoInfo.length; i++)
			System.out.println(PhotoInfo[i]);

	    try {

			String Time = post.addP();

			double lon = Double.parseDouble(PhotoInfo[2]);
			double lat = Double.parseDouble(PhotoInfo[1]);
			//System.out.println(lon);
			//System.out.println(lat);

			if (post.getpostid(UserName, Time)) {

			    int PostID = post.getPostID();

			    //System.out.println("a:"+PostID);
			    photo.setPostID(PostID);
			    photo.setLongitude(lon);
			    photo.setLatitude(lat);
			    photo.setURL(PhotoInfo[0]);

			    if (photo.add()) {
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
							<p class="details">Post Added Successfully!</p>
							<p class="details">
								<a href="addpost.jsp">Add Another Post</a>
							</p>
							<p class="details">
								<a href="userindex.jsp">Back home</a>
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
				throw new Exception("ERROR");
			    }

			}

			else
			    throw new Exception("ERROR");
	    } catch (Exception e) {

	    }
	%>

</body>
</html>