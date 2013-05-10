<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*"%>


<jsp:useBean scope="page" id="user" class="jsp.travelsnap.user" />
<jsp:useBean scope="page" id="photo" class="jsp.travelsnap.photo" />
<jsp:useBean scope="page" id="post" class="jsp.travelsnap.post" />
<jsp:useBean scope="page" id="comment" class="jsp.travelsnap.comment" />
<%
	//get username
	String UserName = (String) session.getAttribute("user");

	if (UserName == null || UserName.equals(""))
		throw new Exception("not valid user!");
 
	String sPostID = request.getParameter("PostID");
	int PostID = Integer.parseInt(sPostID);
	request.setCharacterEncoding("utf-8");
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Post Detail</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
<link rel="stylesheet" href="./css/lightbox.css" type="./css/text/css"
	media="screen" />

	<script src="js/prototype.js" type="text/javascript"></script>
	<script src="js/scriptaculous.js?load=effects" type="text/javascript"></script>
	<script src="js/lightbox.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/java.js"></script>
    
<script type="text/javascript">
	function editpost()
	{
	document.postform.action="editpost.jsp?PostID=<%=PostID%>";
	document.postform.submit();
	}
    function delpost()
	{
    	if (confirm("Are You Sure to Delete this Post?")) {
    		document.postform.action="deletepost.jsp?PostID=<%=PostID%>";
    		document.postform.submit();
		} else {
			return; //location.href = 'userindex.jsp';
		}
	}
</script>
</head>
<body>
	<div id="wrap">
	
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		
		<div class="center_content">
			<div class="left_content">
			

				 <%
		post.setPostID(PostID);
	    photo.setPostID(PostID);
	    user.setUserName(UserName);
		post.show();
		photo.show();
		user.show();%>
	
	<div id="demo" class="demolayout">
					<ul id="demo-nav" class="demolayout">
						<li><a class="active" href="#tab1">Post Detail</a></li>
						<li><a class="" href="#tab2">Comments</a></li>
						<li><a class="" href="#tab3">More</a></li>
					</ul>
					<div class="tabs-container">
					  <div style="display: block;" class="tab" id="tab1">
        
		<div class="title"><b> &nbsp;<%=post.getTitle()%></b></div>
	
	<div class="feat_prod_box_details">
	

	&nbsp;<img src="<%=photo.getURL()%>" width="425" />
	</div>
	
	<div class="feat_prod_box_details">
	<div class="prod_img">
						&nbsp;<img src="<%=user.getAvatar()%>" height="100" width="100 " alt="Avatar"
							title="" border="0" /> <br />
						<br />
					</div>
	    <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title"><%=user.toHTMLString(post.getContent())%></div>


	<p class="details">Author: <%=post.getUserName()%><br />
	Location: <%=post.getLocation()%><br />
	Post Time: <%=post.getPostTime().substring(0,16)%><br />
	</p>
	
   
	
				<div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
		<%


		if(UserName.equals(post.getUserName()))
			//show the 2 buttons
			{
	 %>
	<form method="post" action="" class="form" name="postform">
		<input type="hidden" value=<%=post.getUserName() %> name="author"/>
		<input type="submit" value="Edit Post" class="button" onclick="javascript:editpost()" />
		<input type="submit" value="Delete Post" class="button" onclick="javascript:delpost()" />
	</form>
	<%} %>
	</div>
	
	 <div style="display: none;" class="tab" id="tab2">
							
	<%
	//Commets
	comment.setPostID(PostID);
	ResultSet rs = comment.show();	
	
	while(rs.next())
	{
		
		String Content = rs.getString("content");
		String cUserName = rs.getString("username");
		//int CommID = rs.getInt("commid");
		//User.init();
%>

   <div class="feat_prod_box_details">
	<div class="prod_img">
						&nbsp;<img src="<%=user.getAvatar()%>" height="80" width="80" alt="Avatar"
							title="" border="0" /> <br />
						<br />
					</div>
	    <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
    <p class="details">User: <%=cUserName%></p>
    <p class="details">Posted at: <%=rs.getString("commtime")%></p>
    <p class="details"><b><%=user.toHTMLString(Content)%></b></p> 
   <p class="details"><a href="deletecomment.jsp?CommID=<%=rs.getInt("commid")%>">Delete this comment</a></p>
    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            <%} %>  
                   <form method="post" action="addcomment.jsp?PostID=<%=PostID%>" class="form" name="comments">
						
                               <br />
                               <textarea cols="48" rows="6" name="Content" style="overflow-y:hidden;overflow:visible"></textarea>
								<br /><br />
								
								<input type="submit" value="Comment" class="button" /> 

								<br />
							
						</form>  
							
							
							</div>
	
	  					<div style="display: none;" class="tab" id="tab3">
							<br />
							<p class="details"><a href="http://www.facebook.com/sharer.php?u=etoy.comp.polyu.edu.hk/travelsnap/postdetail.jsp%3FPostID=<%=PostID %>&t=TravelSnap">Share this Link on Facebook</a></p>
							&nbsp;&nbsp;&nbsp;<iframe src="http://www.facebook.com/plugins/like.php?href=etoy.comp.polyu.edu.hk/travelsnap/postdetail.jsp%3FPostID=<%=PostID %>&amp;layout=standard&amp;show_faces=false&amp;width=430&amp;action=like&amp;colorscheme=light" scrolling="no" frameborder="0"  style="border:none; overflow:hidden; width:430px; height:40px"></iframe>
							<iframe src="flickrsearch.jsp?Location=<%=post.getLocation()%>"  width="440" height ="440" frameborder="0"  marginwidth="0" marginheight="0"></iframe>
							
							</div>
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

<script type="text/javascript">
var tabber1 = new Yetii({
id: 'demo'
});
</script>

</html>