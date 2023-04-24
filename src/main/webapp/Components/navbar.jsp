<%@page import="entities.User" %>
<% 
User user1=(User)session.getAttribute("current-user");

%>




<nav class="navbar navbar-expand-lg navbar-dark \ custom-bg">
<div class="container">
  <a class="navbar-brand" href="index.jsp">Online Shopping</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Category
        </a>
      </li>
    </ul>
    <ul class="navbar-nav ml-auto">
    
    
     <li class="nav-item active">
    <a class="nav-link" href="#"data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:30px;"></i><span class="ml-1 card-items" style="font-size:15px;">(0)</span></a>
    </li>
    <%
    
    if(user1==null){
    %>
    <li class="nav-item active">
    <a class="nav-link" href="login.jsp">Login</a>
    </li>
    <li class="nav-item active">
    <a class="nav-link" href="register.jsp">Register</a>
    </li>
    <%}
    else{%>
    <li class="nav-item active">
    <a class="nav-link" href="<%=user1.getUser_type().equals("admin")?"admin.jsp":"index.jsp" %>"><%=user1.getUser_name() %></a>
    </li>
    <li class="nav-item active">
    <a class="nav-link" href="logout">LogOut</a>
    </li>
    
    <%} %>
    </ul>
  </div>
  </div>
</nav>