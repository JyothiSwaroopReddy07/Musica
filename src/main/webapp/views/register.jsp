<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Musica-register</title>
	<link rel="stylesheet" href="../styles/auth.css?v=199" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
	<%
    	if(session.getAttribute("authStatus") == "true"){
    		response.sendRedirect("home.jsp");
    	}
    %>
    
   <div class="msgdiv">
   	<%
   		if(session.getAttribute("user-exists") != null){
   			session.removeAttribute("user-exists");
   			out.println("<p class='msg'> THE EMAIL IS ALREADY REGISTERED. TRY A DIFFFERENT EMAIL OR LOGIN ! </p>");
   		}
   	%>
   </div>
    
   <div class="main-container">
	<div class="logo">
        <div class="buttons">
          <div class="register_button">
            <p>Already have an account ?</p>
            <a href="login.jsp"><button class="butt">Log in</button> </a>
          </div>
        </div>
        <img src="../images/logo.png" alt="Musica Logo" />
        <p class="brand">MUSICA</p>
        <p class="brand_tagline">Our music - Your melody !</p>
      </div>
      
      <div class="register">
        <div class="register-bg" ></div>
        <div class="register-bg-effect"></div>
        
        <form class="register-form" action="register" method="post" >
            <p class="form_header">SIGN UP </p>
            <hr /><br/>
                <div class="input-div">
                  <div class="input-div-left">
                    <label for="fname">First name </label> <br />
                    <input  type="text" class="inputbox" name="fname" id="fname" placeholder="Enter First name" required >
                  </div>
                  <div class="input-div-right">
                    <label for="lname">Last name </label> <br />
                    <input type="text" class="inputbox" name="lname" id="lname" placeholder="Enter Last name" required >
                   </div>
                </div>

                <div class="input-div">
                  <div class="input-div-left">
                    <label for="dob">Date of Birth</label><br/>
                    <input type="date" class="inputbox" name="dob" id="dob" required><br/>
                  </div>
                  <div class="input-div-right">
                    <label for="gender">Gender</label><br /><br/>
                    <input type="radio"class="inputbox" name="gender" id="gender" value="male" >&nbsp;male &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio"class="inputbox" name="gender" id="gender" value="female" >&nbsp;female<br/><br />
                  </div>
                 </div>
            
                <label for="email_or_mobile">Email </label> <br/>
                <input type="email" class="inputbox" name="email" id="email" required placeholder="@gmail.com" ><br/>

                <label for="pwd">Password </label> <i style="font-size: 16px; position: relative; top: 3px; right: 16px;" class="material-icons info-icon">info</i></a> 
                   <span class="pwdvisibility" style="float: right; font-size: 12px; position: relative; top: 8px; right: 16px;">SHOW</span> <br/>
                <input type="password" class="inputbox" name="pwd" id="pwd" required ><br/>

                <div class="pwdvalidation">
                  <ul>
                    <li> must contain atleast 6 characters. </li>
                    <li> must contain atleast one special character. </li>
                    <li> must contain atleast one digit. </li>
                  </ul>
                </div>
            
                <div class="tandc">
                  <input type="checkbox" class="inputbox" >
                  <label for="x">I agree to all the <a href="t_and_c.html">terms and conditions</a> of Musica</label>
                </div>
                
            
            <br>
            <div class="butt-anim-div"></div>
            <div class="register_butt_div">
            	 <input type="submit" value="Create an Account" class="registerbtn" />
            </div>
        </form>
        
      </div>
   </div>
   
   <div class="alert-container">
       <div class="alert">
         <p class="alertcontent"> </p>
         <div class="progress"></div>
       </div>
    </div>
   
    <script src="../scripts/register.js?v=08"></script> 
</body>
</html>