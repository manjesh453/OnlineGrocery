<%@page import="entities.User" %>
<%
  User user=(User)session.getAttribute("current-user");
   if(user==null){
	   session.setAttribute("message","You are not login");
	   response.sendRedirect("login.jsp");
	   return;
   }else{
	   if(user.getUser_type().equalsIgnoreCase("normal")){
		   session.setAttribute("message","You are not admin!Dont access this page");
		   response.sendRedirect("login.jsp");
		   return;
	   }
   }
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Owner Panel</title>
<%@include file="Components/css_js.jsp" %>
</head>
<body>
<%@include file="Components/navbar.jsp" %>
<div class="container admin">
<div class="container-fluid mt-3">
<%@include file="Components/message.jsp"%>
</div>
  <div class="row mt-4">
    <div class="col-md-4">
     <div class="card">
     <div class="card-body">
     <div class="container" style="display: flex; justify-content: center; align-items: center;">
     <img style="max-width:100px;" class="img-fluid rounded-circle" alt="User_pic" src="img\customer.png">
     </div>
     <h1 class="text-center text-uppercase text-muted">Users</h1>
     </div>
     </div>
    </div>
    <div class="col-md-4">
      <div class="card">
     <div class="card-body">
     <div class="container" style="display: flex; justify-content: center; align-items: center;">
     <img style="max-width:100px;" class="img-fluid rounded-circle" alt="list_pic" src="img\options-lines.png">
     </div>
     <h1 class="text-center text-uppercase text-muted">Categories</h1>
     </div>
     </div>
    </div>
    <div class="col-md-4">
     <div class="card">
     <div class="card-body">
     <div class="container" style="display: flex; justify-content: center; align-items: center;">
     <img style="max-width:100px;" class="img-fluid rounded-circle" alt="Products_pic" src="img\dairy-products.png">
     </div>
     <h1 class="text-center text-uppercase text-muted">Products</h1>
     </div>
     </div>
    </div>
  </div>
<div class="row mt-3">
  <div class="col-md-6">
  <div class="card" data-toggle="modal" data-target="#add-category-modal">
     <div class="card-body">
     <div class="container" style="display: flex; justify-content: center; align-items: center;">
     <img style="max-width:100px;" class="img-fluid rounded-circle" alt="Products_pic" src="img\menu.png">
     </div>
     <p class="mt-3 text-center" >Click to Add Category</p>
     <h1 class="text-center text-uppercase text-muted">Add Category</h1>
     </div>
     </div>  
  </div>
  <div class="col-md-6">
  <div class="card" data-toggle="modal" data-target="#add-product-modal">
     <div class="card-body">
     <div class="container" style="display: flex; justify-content: center; align-items: center;">
     <img style="max-width:100px;" class="img-fluid rounded-circle" alt="Products_pic" src="img\plus.png">
     </div>
     <p class="mt-3 text-center">Click to Add Products</p>
     <h1 class="text-center text-uppercase text-muted">Add Products</h1>
     </div>
     </div>
  </div>
  </div>
</div>

<!-- Add category model -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="addcategory" method="post">
         <input type="hidden" name="addcate" value="addcategory">
         <div class="form-group">
         <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
         </div>
         <div class="form-group">
         <textarea style="height:300px;" placeholder="Enter category description" name="catDescription" class="form-control"required></textarea>
         </div>
        <div class="container text-center">
        <button class="btn btn-outline-success">Add Category</button>
        </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>

<!-- end of add category -->
<!-- Product model -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="addcategory" method="post">
        <div class="form-group">
         <input type="text" class="form-control"name="pName" placeholder="Enter Product Name" required> 
       </div>
       <div class="form-group">
       <textarea style="width:750px;" class="from-control" placeholder="Enter Product description" name="pDescription" required></textarea>
       </div>
       <div class="form-group">
         <input type="number" class="form-control"name="pPrice" placeholder="Enter Price of Products" required> 
       </div>
       <div class="form-group">
         <input type="number" class="form-control"name="pDiscount" placeholder="Enter Product Discount" required> 
       </div>
       <div class="form-group">
         <input type="number" class="form-control"name="pQuantity" placeholder="Enter Product Quantity" required> 
       </div>
       <!-- product category -->
       <div class="form-group">
       <label>Select Category</label>
       <select name="catId" id="">
       <option value="fruits">fruits</option>
        <option value="Vegetables">Vegetables</option>
        <option value="Drinks">Drinks</option>
       
       </select>
       
       </div>
       <div class="form-group">
       <label for="picture">Select Picture</label>
       <input type="file" name="pPic" id="picture"required/>
       
       </div>
       
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
    </div>
  </div>
</div>
<!-- end product -->

</body>
</html>








