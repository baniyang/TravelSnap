<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*"%>

<%
    String lUser = (String) session.getAttribute("user");
%>

<jsp:useBean scope="page" id="lfriend" class="jsp.travelsnap.friend" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Right Menu</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

	

</head>
<body>

		
	
	<script type="text/javascript">
		function logoutconfirm() {
			if (confirm("Are You Sure to Logout?")) {
				location.href = './logout.jsp';
			} else {
				return;
			}
			;
		};
	</script>

	<div class="right_content">
		<div class="languages_box">
			<div class="title">
				Welcome:
				<%
			    if (lUser != null) {
							out.println(lUser);
							lfriend.setUserName(lUser);
						} else {
							throw new Exception("not login");
						}
			%>
			</div>
		</div>
		<br />

		<ul class="list">
			<li><a href="userindex.jsp">User Home</a></li>
			<li><a href="userinfoedit.jsp">Edit Information</a></li>
			<li><a href="changepw.jsp">Change Password</a></li>
			<li><a href="addpost.jsp">Add Post</a></li>
			<li><a href="userlist.jsp">User List</a></li>
			<li><a href="#" onclick="javascript:logoutconfirm()">Logout</a></li>
		</ul>
		<br /> <br />


		<div id="fb-root"></div>
		<script src="http://connect.facebook.net/en_US/all.js"></script>
		<script>
			window.fbAsyncInit = FB
					.init({
						appId : '249072815230609',
						channelUrl : '//etoy.comp.polyu.edu.hk/TravelSnapFinal/channel.html', // Channel File
						cookie : true,
						status : true,
						xfbml : true
					});

			FB.Event.subscribe('auth.authResponseChange', function(response) {
				// Here we specify what we do with the response anytime this event occurs. 
				if (response.status === 'connected') {
					// The response object is returned with a status field that lets the app know the current
					// login status of the person. In this case, we're handling the situation where they 
					// have logged in to the app.
					//alert("Logged in");
					document.getElementById('fb_login').style.display = 'none';
					FB.api('/me', function(user) {
						if (user) {
							var image = document.getElementById('fb_image');
							image.src = 'https://graph.facebook.com/' + user.id
									+ '/picture';
							var name = document.getElementById('fb_name');
							name.innerHTML = user.name;
						}
					});
				} else if (response.status === 'not_authorized') {
					// In this case, the person is logged into Facebook, but not into the app, so we call
					// FB.login() to prompt them to do so. 
					// In real-life usage, you wouldn't want to immediately prompt someone to login 
					// like this, for two reasons:
					// (1) JavaScript created popup windows are blocked by most browsers unless they 
					// result from direct user interaction (such as a mouse click)
					// (2) it is a bad experience to be continually prompted to login upon page load.
					alert("Not authorized");
				} else {
					// In this case, the person is not logged into Facebook, so we call the login() 
					// function to prompt them to do so. Note that at this stage there is no indication
					// of whether they are logged into the app. If they aren't then they'll see the Login
					// dialog right after they log in to Facebook. 
					// The same caveats as above apply to the FB.login() call here.
					FB.login();
				}
			});
		</script>
		
         
       
		<div class="title">
			Friend List
		</div>
		<ul class="list">
		<li><b><a href="friendmanage.jsp" >Click to Manage Your Friends</a></b></li>
			<%
			    ResultSet rs1 = lfriend.show();
			    while (rs1.next()) {
			%>
			<li><a
				href="friendindex.jsp?FriendName=<%=rs1.getString("flist")%>"><%=rs1.getString("flist")%></a></li>
			<%
			    }
			%>

		</ul>
	</div>

</body>
</html>
