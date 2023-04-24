<%
User user=(User)session.getAttribute("current-user");
if(user==null){
	   session.setAttribute("message","You are not login");
	   response.sendRedirect("login.jsp");
	   return;
}


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CkeckOut Page</title>
<%@include file="Components/css_js.jsp"%>

</head>
<body>
<%@include file="Components/navbar.jsp"%>
<div class="container">
<div class="row mt-5">
<div class="col-md-6">
<div class="cart">
<div class="cart-body"></div>
</div>
</div>
<!-- data enter -->
<div class="col-md-6">

</div>
</div>

</div>
<%@include file="Components/common_modal.jsp" %>

</body>
</html>