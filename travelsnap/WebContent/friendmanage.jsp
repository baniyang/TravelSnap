<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*"%>
<%
    String UserName = (String) session.getAttribute("user");

			if (UserName == null || UserName.equals(""))
				throw new Exception("not valid user!");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>Manage Your Friends</title>
<link rel="stylesheet" type="text/css" href="./css/style_new.css" />
<jsp:useBean scope="page" id="friend" class="jsp.travelsnap.friend" />
<jsp:useBean scope="page" id="user" class="jsp.travelsnap.user" />

</head>
<body>

	<script type="text/javascript">
		function deleteconfirm() {
			if (confirm("Are You Sure to Delete These friends?")) {
				friendform.action = 'frienddelete.jsp';
				formname.submit();
			} else {
				return;
			}
			;
		};
	</script>

	<%
	    friend.setUserName(UserName);
	%>

	<div id="wrap">

		<div class="header">
			<%@include file="include/header.jsp"%>
		</div>


		<div class="center_content">
			<div class="left_content">

				<div class="title">
					<span class="title_icon"><img
						src="../images/csspics/bullet1.gif" alt="" title="" /></span>Friend List<br />
				</div>


				<form name="friendform" action="" method="post">
					<%
					    ResultSet rs = friend.show();
					    while (rs.next()) {

							String fname = rs.getString("flist");
							//System.out.println(fname);
							user.setUserName(fname);
							user.show();
					%>

					<div class="feat_prod_box_details">
						<div class="prod_img">
							<img src="<%=user.getAvatar()%>" height="100" width="100 "
								alt="Avatar" title="" border="0" /> <br /> <br />
						</div>
						<div class="prod_det_box">
							<div class="box_top"></div>
							<div class="box_center">
								<div class="prod_title">Friend Information</div>
								<p class="details">
									Username：<a
										href="friendindex.jsp?FriendName=<%=rs.getString("flist")%>"><%=rs.getString("flist")%></a>
								</p>
								<p class="details">
									Add Time:
									<%=rs.getString("addtime")%></p>
								<p class="details">
									<input type="checkbox" name="DeleteID"
										value='<%=rs.getString("friendid")%>' />
								</p>

								<div class="clear"></div>
							</div>

							<div class="box_bottom"></div>
						</div>
					</div>

					<%
					    }
					%>
					<div class="feat_prod_box_details">
						<input type="submit" value="Delete Selected Friends"
							class="button" onclick="javascript:deleteconfirm()" />
					</div>

				</form>





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