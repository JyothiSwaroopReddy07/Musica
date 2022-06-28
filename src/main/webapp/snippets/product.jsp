<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.musica.db.dao.*, com.musica.web.model.*, java.util.* " %>
   
<!DOCTYPE html>
<html>

<body>
	 <%! 
    	Productsdbdao prods = new Productsdbdao(); 
	    String searchText = "all"; 
    	ArrayList<Product> products =  null;
    	String categories[] = { "guitar", "keyboard","traditional","drums","supplies" } ;
        String email;
    %>
    <%
    	if(request.getParameter("category") != null) {
    		searchText = request.getParameter("category").toString();
    	}
    	
    	if(session.getAttribute("user-data") == null){
    		email = null;
    	}else{
    		email =(String) session.getAttribute("email"); 
    	}

 		  for( String c: categories){ 
 			if(c.equals(searchText) || searchText.equals("all")) { 
 				products = prods.getProductsByCategory(c);
     %>
    
	    <p class="product-heading"> 
		   <img style="transform: scale(0.7)" width="120px" src="../images/leaf-line1.png"/> <span style="text-transform: uppercase; padding: 0 12px"> <%= c %> </span>   <img style="transform: scale(0.7)" width="120px" src="../images/leaf-line2.png"/>
		</p>
	    
	    <div class="products">
	        <%! String url; %>
	    	    
	    	<%
	    		for(Product p: products){  
	    		  url = "./addtocart?productid=" + p.getPid() +"";
	    		  
	    	%>
	    		<div class="grid-item">
		            <div class="prod-img">
		            	<%String srcd="../images/p"+p.getPid()+".jpg";
		            	if(p.getPid()==3)
                    	{
                    		srcd="../images/p"+p.getPid()+".jpeg";
                    	}
		            	%>
		                <img width="100%" height="100%"  src=<%=srcd %> />
		              </div>
		            <div class="desc">
		                <p class="pname"><%= p.getName() %></p>
		                <p class="pprice">&pound; <%= p.getPrice() + "" %></p>
		                <% 
		                	Cartdbdao cart = new Cartdbdao();
		                	boolean alreadyInCart = cart.inCart(email,p.getPid()); 
		                	
		                	if(alreadyInCart) {
		                %>
		                <button class="added" disabled > ADDED TO CART </button>
		                <% }else {%>
		                <button class="addtocartbtn"><a href=<%=url %>>ADD TO CART</a></button>
		             	<%} %>
		            </div>
	       		 </div>  
	    	<% } %>
    	</div>
    
    	<div class="divider" > </div>
    
     <% } } %>
</body>
</html>