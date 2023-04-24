function add_to_cart(pid,pname,price){
	let cart=localStorage.getItem("cart");
	if(cart==null){
		//no cart yet
		let products=[];
		let product={productId:pid,productQuantity:1,productName:pname,productPrice:price};
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		
		
	}else{
		//cart is already present
	  let pcart=JSON.parse(cart);
	 let oldProduct= pcart.find((item)=>item.productId==pid)
	 if(oldProduct){
		 //we have to increase the quantity
		 oldProduct.productQuantity=oldProduct.productQuantity+1;
		 pcart.map((item)=>{
			 if(item.productId==oldProduct.productId){
				 item.productQuantity=oldProduct.productQuantity;
			 }
		 })
		 localStorage.setItem("cart",JSON.stringify(pcart));
		 showToast(oldProduct.productName+" quantity added")
	 }else{
		//we have to add product
		 let product={productId:pid,productQuantity:1,productName:pname,productPrice:price};
		pcart.push(product);
		localStorage.setItem("cart",JSON.stringify(pcart));
	    showToast("Product is added to cart")
	 }
}
updatecart();
}
//update cart
function updatecart(){
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0){
		$(".card-items").html("(0)");
		$(".cart-body").html("<h3>Cart does not have any items</h3>");
	     $(".checkout-btn").attr('disabled',true)
		
	}else{
		//there is something to show
		$(".card-items").html(`(${cart.length})`);
		let table = "<table class='table'><thead class='thead-light'><tr><th>Item Name</th><th>Price</th><th>Quantity</th><th>Total Price</th><th>Action</th></tr></thead>";
        let totalprice=0;
         cart.map((item)=>{
			 table+=`
			 <tr>
			 <td>${item.productName}</td>
			 <td>${item.productPrice}</td>
			 <td>${item.productQuantity}</td>
			 <td>${item.productQuantity*item.productPrice}</td>
			 <td><button onclick=' deletedata(${item.productId})' class="btn btn-danger btn-sm">Remove</button></td>
			 
		 </tr>`
		 totalprice+=item.productPrice*item.productQuantity;
		 
		 })
        
        
        table = table + `
        <tr>
        <td colspan='5' class="text-right font-weight-bold m-5">Total Price:${totalprice}</td>
        </tr>
        
        </table>`;
        $(".cart-body").html(table);
		 $(".checkout-btn").attr('disabled',false)
		
	}
}

//delete data from cart
function deletedata(pid){
	
	let cart=JSON.parse(localStorage.getItem("cart"));
	let newcart=cart.filter((item)=>item.productId!=pid)
	localStorage.setItem("cart",JSON.stringify(newcart))
    showToast("Item has been Deleted")
    updatecart();
}


$(document).ready(function(){
	updatecart();
})
function showToast(content){
	$("#toast").addClass("display");
	$("#toast").html(content);
	setTimeout(()=>
	$("#toast").removeClass("display")
	,2000);
	
}

function gotocheckout(){
	//window.location="checkout.jsp"
  alert("hollo")
}




