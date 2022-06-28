<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Musica-shop</title>
    <link rel="stylesheet" href="../styles/shop.css?v=8008" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<%
		try{
			response.setHeader("Cache-Control","no-cache"); 
			response.setHeader("Pragma","no-cache"); 
			response.setDateHeader ("Expires", 0); 
		
			if(session.getAttribute("authStatus") != "true"){
				response.sendRedirect("./");
			}
		}catch(Exception e){ out.println(e); }
		
	%>
    <div class="header">
        <div class="searchdiv">
            <i style="font-size: 32px; color:#6F4C3F ;" class="material-icons search-icon">search</i>
            <input class="searchbar" type="text" placeholder="Search for any musical intrument"  />
            <button class="searchbtn"> SEARCH</button>
        </div>
         <div class="msgdiv">
		    	<%  
		    		if(session.getAttribute("addedtocart") != null ){
		    			session.removeAttribute("addedtocart");
		    			out.println("<p style='color: green' class='msg'> ADDED TO CART SUCCESSFULLY !  </p>");
		    		}
		    	%>
    	 </div>
    </div>
    <div class="head-content">
    
        <%@include file="../snippets/nav.html" %>
        
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
    	const addtocartbtn = document.querySelector(".addtocartbtn");
    	
    	performSearchBtn.addEventListener("click", () => window.location.href="http://localhost:8080/musica/views/shop.jsp?category="+search_bar.value);
    	
    


    </script>

</body>
</html>