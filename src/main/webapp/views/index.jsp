<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Musica</title>
	    <link rel="stylesheet" href="../styles/home.css?v=521" />
	    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%
			response.setHeader("Cache-Control","no-cache"); 
			response.setHeader("Pragma","no-cache"); 
			response.setDateHeader ("Expires", 0); 
			session.setMaxInactiveInterval(-1);
			if(session.getAttribute("authStatus") != null){
				if(session.getAttribute("authStatus").equals("true")) response.sendRedirect("home.jsp");
			}
			
		%>
		<div class="header">
	        <div class="searchdiv">
	            <i style="font-size: 32px; color:#6F4C3F ;" class="material-icons search-icon">search</i>
	            <input class="searchbar" type="text" placeholder="Search for any musical intrument"  />
	            <button class="searchbtn"> SEARCH</button>
	        </div>
	        
	        <div class="msgdiv">
		    	<%  
		    	 	
		    		if(session.getAttribute("logout") != null){
		    			session.invalidate();
		    			out.println("<p class='msg'> LOGGED OUT SUCCESSFULLY ! </p>");
		    		}
		    	%>
    	   </div>
    	   
	        <div class="bg">
	            <img width="100%" height="100%" src="../images/homebg.jpg" />
	            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="white" fill-opacity="1" d="M0,128L48,133.3C96,139,192,149,288,128C384,107,480,53,576,64C672,75,768,149,864,181.3C960,213,1056,203,1152,192C1248,181,1344,171,1392,165.3L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>
	        </div>
    	</div>
    	<div class="head-content">
        
        <%@include file="../snippets/unauth-nav.html" %>
        
        <p class="line">LEGACY-GRADE MUSICAL INSTRUMENTS</p>
        <p class="sub-line">Experience the best Quality !</p>
        <a href="unauth-shop.jsp?category=all"><button class="shopbtn"> SHOP  &nbsp;&nbsp;&rarr;</button></a>
    </div>
    
    <%@ include file="../snippets/dotd.html" %> 
     
    <%@ include file="../snippets/about.html" %>

    <%@ include file="../snippets/footer.html" %>
    
    <script src="../scripts/home.js"></script> 
    <script>
    
    	const performSearchBtn  = document.querySelector(".searchdiv .searchbtn");
    	const search_bar = document.querySelector(".searchdiv .searchbar");
    	
    	
    	performSearchBtn.addEventListener("click", () => window.location.href="./unauth-shop.jsp?category="+search_bar.value);
    	
    </script>
	</body>
</html>