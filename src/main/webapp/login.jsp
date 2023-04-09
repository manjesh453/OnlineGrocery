
<html>
<head>
<title>Login</title></head>
<body></body>
<div class="container text-center">
<%@include file="Components/message.jsp" %>
</div>

<%@include file="Components/css_js.jsp" %>
<%@include file="Components/navbar.jsp" %>
<div class="container">
<div class="row">
<div class="col-md-6 offset-md-3">
<div class="card mt-3">
<div class="card-header custom-bg text-white">

<h3>Login</h3>
</div>
<div class="card-body">
<form action="login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <a href="register.jsp">If not register click here!!</a>
  <div class="container text-center">
  <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
  <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
  
   </div>
</form>

</div>
</div>
</div>
</div>
</div>
</div>



</body>
</html>
