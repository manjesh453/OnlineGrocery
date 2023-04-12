<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.ProductDao" %>
<%@page import="dao.CategoryDao" %>
<%@page import="helper.Helper" %>
<%@page import="helper.FactoryProvider" %>
<%@page import="entities.Product" %> 
<%@page import="java.io.PrintWriter" %>
<%@page import="entities.Category" %> 
<%@ page import="java.util.List" %>      

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="Components/css_js.jsp"%>
<title>OnlineShopping</title>
</head>
<body>
<%@include file="Components/message.jsp" %>
<%@include file="Components/navbar.jsp"%>
<div class="container-fluid">
<div class="row mt-3 mx-2">
<%
String cat=request.getParameter("category");
if(cat==null){
	cat="all";
}
ProductDao dao=new ProductDao(FactoryProvider.getFactory());
List<Product>list=null;
if(cat.equals("all"))
{
	list = dao.getAllProducts();
}else if (cat.trim().equals("all")) {
    list = dao.getAllProducts();
	}
else{
		int cid=Integer.parseInt(cat.trim());
		list=dao.getAllProductsById(cid);
	}
CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
List<Category> clist=cdao.getCategory();
PrintWriter writer = response.getWriter();
%>
<!-- show category -->
<div class="col-md-2">
<div class="list-group mt-4">
 <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Products</a>
  <%
  for(Category c:clist){
	  %>
	  <a href="index.jsp?category=<%=c.getCategoryid() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
	<%  
	 }
  %>
  </div>
</div>
<!-- show products -->
<div class="col-md-10">
<div class="container">
<div class="row mt-4">
<div class="col-md-12">
<div class="card-columns">

<%
for(Product p:list){
%>
<div class="card">
<div class="container text-center">
<img class="card-img-top m-2" style="max-height:200px;max-width:100px;width:auto;" src="img/products/<%=p.getpPhoto() %>" alt="Card image cap">

</div>
<div class="card-body">
<h1 class="card-title"><%=p.getpName()%></h1>
<p class="card-text"><%=Helper.get10Words(p.getpDesc()) %></p>

</div>
<div class="card-footer text-center">
<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getPid()%>,'<%=p.getpName()%>',<%=p.getPriceAfterDiscount()%>)">Add to cart</button>
<button  class="btn btn-outline-success">Rs <%=p.getPriceAfterDiscount()%>/-<span style="font-size:10px; font-style:italic;">Rs<%=p.getpPrice()%>  (<%=p.getpDiscount()%>% off)</span></button>
</div>
</div>
<%}
%> 
</div>
</div>
</div>
	</div>
</div>
</div>
</div>
</body>
</html>