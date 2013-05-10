<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" 
	errorPage="errors/error.jsp"
	%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="user" class="jsp.travelsnap.user" />
<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />
<jsp:useBean scope="page" id="friend" class="jsp.travelsnap.friend" />

<%
	String UserName = (String) session.getAttribute("user");

	if (UserName == null || UserName.equals(""))
		throw new Exception("not valid user!");
	
	request.setCharacterEncoding("utf-8");
    String FriendName = request.getParameter("FriendName");
    session.setAttribute("friend", FriendName);
    user.setUserName(FriendName);
    post.setUserName(FriendName);
    friend.setUserName(UserName);
    user.show();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252" />
<title>User Information</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
<link rel="stylesheet" href="./css/lightbox.css" type="./css/text/css"
	media="screen" />
	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
 
 <style type="text/css">
.ui-autocomplete {
    background: #ffffff;
    width:310px;      
}
.ui-helper-hidden-accessible { display:none; }
</style> 
   
</head>
<body>

	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-ui-1.10.2.js"></script>
	
	<script language="javascript" type="text/javascript">
		$(function() {
			var cust_ac = $("#autocomplete input#cust_input").autocomplete(
					{
						source : "searchfriendpost.jsp",
						select : function(event, ui) {
							//alert(ui.item.id);
							window.location.href = 'postdetail.jsp?PostID='
									+ ui.item.id;
						},
						width : 200,
						max : 32,
						minLength: 3,
						selectFirst : false,
						delay : 250,
						minChars : 3,
						matchContains : 1,
						scroll : false,
						scrollHeight : 200,
						maxItemsToShow : 20
					});
			$('#autocomplete').submit(function() {
				return false; //  Cancel submit button on form.
			});
		});

		function handleKeyPress(e, form) {
			var key = e.keyCode || e.which;

			if (key == 13) {
				e.cancelBubble = true;
				e.returnValue = false;
			}
		}
	</script>
	
<script type="text/javascript">
		function addconfirm() {
			if (confirm("Are You Sure to Add this User?")) {
				location.href = 'addfriend.jsp?FriendName=<%=FriendName%>';
			} else {
				return;
			}
			;
		};
	</script>
	
    <script>
   $(document).ready(function(){
    	  $('#toggleButton').click(function(){
    	 var yourUl = document.getElementById("userinfo");
    	yourUl.style.display = yourUl.style.display === 'none' ? '' : 'none';
    	    $('#userinfo').Toggle();
    		
    	  });
    	});
 </script>

	<div id="wrap">
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		<div class="center_content">
			<div class="left_content">
<input type="button" id="toggleButton" class="userinfo" />
				<div class="feat_prod_box_details" id="userinfo" style=display:none;>
					<div class="prod_img">
						<img src="<%=user.getAvatar()%>" height="100" width="100 " alt="Avatar"
							title="" border="0" /> <br />
						<br />
					</div>
					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title">Your Information</div>
							<p class="details">
								Username：<%=user.getUserName()%></p>
							<p class="details">
								Email：<%=user.getEmail()%></p>
							<p class="details">
								Age：<%=user.getAge()%></p>
							<p class="details">
								Gender：<%=user.getGender()%></p>
							<p class="details">
								First Name：<%=user.getFName()%></p>
							<p class="details">
								Last Name：<%=user.getLName()%></p>
							<p class="details">
								Register Time：<%=user.getRegTime().substring(0, 16)%></p>
							<p class="details">
								Info：<%=user.toHTMLString(user.getInfo())%></p>
							<div class="clear"></div>
						</div>

						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>
				

				
	<% if(friend.valid(FriendName))
	{
		
	%>
			<div id="demo" class="demolayout">
					<ul id="demo-nav" class="demolayout">
						<li><a class="active" href="#tab1">Post List</a></li>
						<li><a class="" href="#tab2">My Travel Map</a></li>
					</ul>
					<div class="tabs-container">

						<div style="display: block;" class="tab" id="tab1">
                          <div class="feat_prod_box_details">
							<textarea id="holdtext" style="display: none;"></textarea>
							
							<form id="autocomplete" name="autocomplete">
								<p class="details">Search Post Title: <input type='text' value='' name='cust_input'
									id='cust_input' size='24'
									onkeypress='handleKeyPress(event,this.form)' /></p>
							</form>
                            </div>
                           <ul class="list">

                            <li>    

							<%
								ResultSet rs = post.postlist();
								while (rs.next()) {
							%>
							<a href="postdetail.jsp?PostID=<%=rs.getString("postid")%>">
								<br /> <b><%=rs.getString("title")%></b>
							</a> <br /> Post Time:
							<%=rs.getString("time").substring(0,16)%><br />
							<%
								}
							%>
							</li>
							</ul>
						</div>
						
						<div style="display: none;" class="tab" id="tab2">
							<iframe frameborder="0" src="map.view?user=<%=FriendName%>" width="450"
								height="450"></iframe>
						</div>

					</div>


				</div>
				
				
				<%} else{%>
				 <div class="feat_prod_box_details">
				 <div class="prod_img">
						<img src="images/csspics/add.jpg" height="100" width="100 " alt=""
							title="" border="0" /> <br />
						<br />
					</div>
             <div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">

          
				<p class="details">You Two are NOT Friends!</p>
				<p class="details"><a href="#" onclick="javascript:addconfirm()"><b>Add this user here!</b></a></p>
				
				  </div>
            <div class="box_bottom"></div>
            </div>
            </div><%}%>
				
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

<script type="text/javascript">
var tabber1 = new Yetii({
id: 'demo'
});
</script>

</html>