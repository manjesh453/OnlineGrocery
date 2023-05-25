<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<%@include file="Components/css_js.jsp"%>

</head>
<body>
<%@include file="Components/navbar.jsp"%>
<%@include file="Components/message.jsp" %>
<div class="container-fluid">
<div class="row mt-3">
<div class="col-md-3 offset-md-5">
<div class="card">
<div class="card-body px-5">
<h3 class="text-center my-3">Sign Up Here!! </h3>

<form action="register" method="Post">
  <div class="form-group">
    <label for="name">FullName</label>
    <input type="text" class="form-control" id="name" name="user_name">
   </div>
   <div class="form-group">
    <label for="email">E-mail</label>
    <input type="email" class="form-control" id="email" name="email">
   </div>
   <div class="form-group">
    <label for="password">Password</label>
    <input type="password" class="form-control" id="password" name="password">
   </div>
   <div class="form-group">
    <label for="phone">Phone Number</label>
    <input type="number" class="form-control" id="phone" name="phone">
   </div>
   <div class="form-group">
    <label for="address">Address</label>
   <textarea name="address"style="height:200px;" class="form-control"></textarea>
    </div>
   <div class="container text-center">
   <button type="submit" class="btn btn-outline-success">Register</button>
   <button class="btn btn-outline-warning">Reset</button>
   
   </div>
   </form>
   </div>
</div>
</div>
</div>
</div>

</body>
</html>