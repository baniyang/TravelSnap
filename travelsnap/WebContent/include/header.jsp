<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" errorPage="errors/error.jsp"%>
<%@ page import="java.sql.*" import="java.io.IOException"
	import="java.io.PrintWriter" import="java.util.Vector"
	import="javax.servlet.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Header</title>
<link rel="stylesheet" type="text/css" href="../css/style_new.css" />
</head>

<body>


	<div id="wrap">
		<div class="header">
			<div class="logo">
				<a href="index.html"><img src="images/csspics/logo.gif" alt=""
					title="" border="0" /></a>
			</div>
			<div id="menu">
				<ul>
					<li>
						<div id="fb-root"></div> <script
							src="http://connect.facebook.net/en_US/all.js"></script> <fb:like
							id="fb"
							href="http://etoy.comp.polyu.edu.hk/travelsnap/userindex.jsp"
							send="false" layout="button_count" width="99" show_faces="false"
							font="segoe ui"></fb:like>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>