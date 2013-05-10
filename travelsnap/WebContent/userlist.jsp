<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
	errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*"%>
<jsp:useBean scope="page" id="user" class="jsp.travelsnap.user" />

<%
	//get username
	String UserName = (String) session.getAttribute("user");

	if (UserName == null || UserName.equals(""))
		throw new Exception("not valid user!");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>User List</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />

</head>
<body>
	<div id="wrap">
	
		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>
		
			<div class="center_content">
			<div class="left_content">
             <div class="title">
					<span class="title_icon"><img
						src="images/csspics/bullet1.gif" alt="" title="" /></span>User List
				</div>

									<%
										ResultSet rs = user.showall(); 
									
										while (rs.next()) {
										    if (!(UserName.equals(rs.getString("username")))){
									%>
									
	 <div class="feat_prod_box_details">
	<div class="prod_img">
						&nbsp;<img src="<%=user.getAvatar()%>" height="45" width="45" alt="Avatar"
							title="" border="0" />
					</div>
	    <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
    <p class="details">Username: <a href="friendindex.jsp?FriendName=<%=rs.getString("username")%>"><%=rs.getString("username")%></a></p>
  
  <div class="clear"></div>
  
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	

									<%
										    }
										}
									%>
								
	    
				

				<div class="clear"></div>
				
			</div>
			<!--end of left content-->
			
						<div class="right_content">
				<%@include file="include/rightMenu.jsp"%>
			</div>
			

			<div class="clear"></div>
			</div>
			
			<div class="footer"></div>
			</div>

</body>
</html>