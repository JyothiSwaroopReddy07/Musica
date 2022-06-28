<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Musica-display</title>
    <link rel="stylesheet" href="../styles/shop.css?v=918" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<%
		response.setHeader("Cache-Control","no-cache"); 
		response.setHeader("Pragma","no-cache"); 
		response.setDateHeader ("Expires", 0); 
	%>
    <div class="header">
        <div class="searchdiv">
            <i style="font-size: 32px; color:#6F4C3F ;" class="material-icons search-icon">search</i>
            <input class="searchbar" type="text" placeholder="Search for any musical intrument"  />
            <button class="searchbtn"> SEARCH</button>
        </div>
         <div class="msgdiv">
		    	<%  
		    		if(session.getAttribute("addtocart") != null ){
		    			session.removeAttribute("addtocart");
		    			out.println("<p class='msg'> LOG IN TO ADD PRODUCTS TO CART !  </p>");
		    		}
		    	%>
    	   </div>
    </div>
    <div class="head-content">
    
        <%@include file="../snippets/unauth-nav.html" %>
        
        <div class="shop-head-content">
            <p class="line">SHOP WORLD-CLASS MUSIC INSTRUMENTS</p>
            <div class="list-instruments">
                <p class="sub-line">Best Deals on </p>
                <div class="in-list list-anim">
                    <p>Guitars</p>
                    <p>Pianos</p>
                    <p>Sound system</p>
                    <p>Trumpets</p>
                </div>
            </div>
        </div>
    </div>
    <p class="subheadshop">
       <img width="120px" src="../images/fancy-line.png"/> <span> SHOP </span>   <img  width="120px" src="../images/fancy-line2.png"/>
    </p>
    <div class="features">
        <div class="item">
           <img width="100%" height="100%" src="../images/f2.gif" />
           <p>Free & Fast Delivery</p>
        </div>
        <div class="item">
            <img width="50%" height="50%" src="../images/f1.gif" />
           <p>Upto 80% Off on first order </p>

        </div>
        <div class="item">
            <img width="80%" height="80%" src="../images/f3.gif" />
            <p>Free Warranty</p>
        </div>
    </div>

    <div class="filters">

    </div>

	<%@ include file="../snippets/product.jsp" %>
	
	<%@ include file="../snippets/footer.html" %>

    <script src="../scripts/shop.js"></script> 
    <script>
    
    	const performSearchBtn  = document.querySelector(".searchdiv .searchbtn");
    	const search_bar = document.querySelector(".searchdiv .searchbar");
    	
    	
    	performSearchBtn.addEventListener("click", () => window.location.href="http://localhost:8080/musica/views/unauth-shop.jsp?category="+search_bar.value);
    	
    </script>

</body>
</html>