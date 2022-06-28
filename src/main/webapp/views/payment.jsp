<%@page import="com.musica.db.dao.Paymentsdbdao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.musica.db.dao.Paymentsdbdao, com.musica.web.model.* " %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Musica-Payment</title>
    <link rel="stylesheet" href="../styles/payment.css?bb9" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

	<%!
		String num = "",cvv = "",  exp_mnth = "", exp_yr = "", delete = "none" ;
	    User user;
	%>
	
	<%
		Paymentsdbdao carddb = new Paymentsdbdao();
	    user = (User) session.getAttribute("user-data");
		if(carddb.HadCard(user.getEmail())){
			Card c = (Card) carddb.getCard(user.getEmail());
			num = c.getCard_number();
			cvv = c.getCvv() + "";
			exp_mnth = c.getExp_month() + "";
			exp_yr = c.getExp_yr() + "";
			delete = "block";
		}else{
			num = "";
			cvv = "";
			exp_mnth = "";
			exp_yr = "";
			delete = "none";
		}

	%>

	<div class="msgdiv">
    	<%  
    		if(session.getAttribute("addcard") != null ){
    			session.removeAttribute("addcard");
    			out.println("<p style='color: green' class='msg'> HURRAY !!! ORDER IS OTW !</p>");
    		}else if(session.getAttribute("removedcard") != null ){
    			session.removeAttribute("removedcard");
    			out.println("<p style='color: green' class='msg'> DELETED CARD SUCCESSFULLY !</p>");
    		}
    	
    	%>
    </div>
    <nav>
	    <p class="name"><a href="home.jsp">MUSICA</a></p>
	    <div style="margin-right: 24px; z-index: 2">
	        <a href="./cart.jsp"><i style="font-size: 32px;" class="material-icons cart-icon">shopping_cart</i></a>
	        <a href="./logout"><i style="font-size: 32px;" class="material-icons auth-icon">logout</i></a>
	    </div>
	</nav>
	
	 <a style="display: <%=delete %>" class="deletecard" href="./removecard"> 
	 	<i style="font-size: 21px; color: red; position: relative; top: 5px; margin-right: 4px;" class="material-icons">delete</i> Delete this card  
	 </a>
	
    <div class="main-container">
        <div class="left-section">
            <div class="circle">
                <p class="topay">TO PAY </p>
                <p class="price"> &pound; 475 !</p>
            </div>
            <a class="cancelpay" href="./cart.jsp"> &larr;&nbsp;&nbsp; cancel payment </a>
        </div>
        <div class="right-section">
            <p> PAYMENT DETAILS </p>
            <hr />
            <form id="card-details" action="payment_successful.jsp" method="post">
                <label for="name"><b>Name on Card </b></label><br/>
                <input type="text" placeholder="Name on Card" value="<%=user.getFirst_name() %>" name="name"  required/><br/><br/>

                 <label for="cardnum"><b>Card-number </b></label><br/>
                 <input style="padding-left: 54px;" value="<%=num %>" class="cardnum" pattern="[0-9-]*" title="Use only numbers" type="text" placeholder="xxxx - xxxx - xxxx - xxxx" name="card_num" required/><br/>
                 <i style="padding: 0 8px; position: relative; top: -48px; font-size: 32px;" class="material-icons">credit_card</i>
                 <br/>
                
                 <div class="exp-cvv">
                     <div class="exp-input">
                        <label for="email"><b>Expiry </b></label><br/>
                        <input type="number" value="<%=exp_mnth %>" min="1" max="12" placeholder="MM" name="exp_month" required /> / 
                        <input type="number" value="<%=exp_yr %>" min="1" max="99" placeholder="YY" name="exp_yr" required />
                     </div>
                     <div class="cvv">
                        <label for="email"><b>CVV </b></label><br/>
                        <input type="number" value="<%=cvv %>" min="0" max="999" placeholder="***" name="cvv" required />
                     </div>
                 </div><br/><br/>
                <button type="submit" >
                    <i style="font-size: 28px; margin-right: 12px;" class="material-icons">lock</i> Proceed to Pay &rarr;
                </button>
            </form>
        </div>
    </div>

    <div class="footer">
    	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
    		<path fill="#6F4C3F" fill-opacity="1" d="M0,192L48,165.3C96,139,192,85,288,69.3C384,53,480,75,576,117.3C672,160,768,224,864,218.7C960,213,1056,139,1152,117.3C1248,96,1344,128,1392,144L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
    	</svg>
    	<%@ include file="../snippets/footer.html" %>
    </div>

    <script src="../scripts/payment.js"></script>
</body>
</html>