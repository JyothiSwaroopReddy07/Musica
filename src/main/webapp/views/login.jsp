<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="ISO-8859-1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Musica-login</title>
    <link rel="stylesheet" href="../styles/auth.css?v=2190" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  </head>
  <body>
    <%
    
    	if(session.getAttribute("authStatus") == "true"){
    		response.sendRedirect("home.jsp");
    	}else if(session.getAttribute("authStatus") != "false"){
    		session.setAttribute("authStatus", "null");
    	}
    %>
    <div class="msgdiv">
    	<%
    		if(session.getAttribute("authStatus").equals("false")){
    			session.setAttribute("authStatus", "null");
    			out.println("<p class='msg'> Wrong credentials ! Please Try again !! </p>");
    		}
    	%>
    </div>
  
    <div class="main-container">
      <div class="login">
        <div class="login-bg" ></div>
        <div class="login-bg-effect"></div>
        
        <form action="login" method="post" class="login-form">
          <p class="form_header">LOG IN </p>
          <hr /><br/><br />

          <label for="email"><b>Email</b></label><br/>
          <input type="text" placeholder="Enter Email address" name="email" required/><br/><br/>

          <label for="pwd"><b>Password</b></label><br/>
          <input
            type="password"
            placeholder="Enter Password"
            name="pwd"
            required
          /><br /><br/>
            <p class="tc">
              By creating an account you agree to our
              <a href="" style="color: dodgerblue">Terms & Privacy</a>.
            </p>
            <div class="butt-anim-div"></div>
            <div class="login_butt_div">
              	<input type="submit" value="Login" class="loginbtn" />
            </div>
            
        </form>
        
      </div>

      <div class="logo">
        <div class="buttons">
          <div class="login_button">
            <p>New to Musica ?</p>
            <a href="register.jsp"><button class="butt">Sign up</button></a>
          </div>
        </div>
        <img src="../images/logo.png" alt="Musica Logo" />
        <p class="brand">MUSICA</p>
        <p class="brand_tagline">Our music - Your melody !</p>
      </div>
    </div>
    
   
    <script src="../scripts/login.js?v-=7"></script> 
  </body>
</html>