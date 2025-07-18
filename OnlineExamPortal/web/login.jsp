<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page of Online exam portal </title>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body{
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-image: url("images/exam2.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .login{
                width:21rem;
                height:23rem;
                margin:auto;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
                margin-top: 4rem;
                box-sizing: border-box;
                padding: 1rem 2rem;
                text-align: center;
                color:rgb(30, 98, 255);
                padding-top: 3rem;
                background-color: white;
            }
            
            .login input{
                width:14rem;
                height: 2rem;
                margin-bottom: 2rem;
                border:none;
                border-bottom: 2px solid rgba(0,0,0,0.2);
                font-size:medium;
            }
            .login input:active{
                outline: none;
                border: none;
            }
            .login-btn{
                padding: 0.65rem 6.5rem;
                border-radius: 10px;
                border: none;
                background-color:rgb(30, 98, 255);
                box-sizing: border-box;
                color:white;
                font-size: larger;
                margin: 1.5rem 0rem;
            }
            i{
                color:rgba(0,0,0,0.4);
                font-size: larger;
                margin-right: 0.6rem;
            }
            p{
                color:rgba(0,0,0,0.6);
            }
            span{
                color:rgb(30, 98, 255);
            }
            a{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <% String msg2= (String) request.getAttribute("errorMsg"); %>
<% if(msg2 != null) { %>
    <p style="color:red;"><%= msg2 %></p>
<% } %>

        <%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
%>
    <div style="color: red; text-align: center;"><%= msg %></div>
<%
    }
%>

        <div class="login">
            <form action="login_s" method="post">
                <i class="fa-solid fa-address-card"></i>
                <input type="text" name="username" placeholder="Username"><br>
                <i class="fa-solid fa-lock"></i>
                <input type="text" name="password" placeholder="Password"><br>
                <button class="login-btn">Login</button>
                <p>are you new user ? <a href="signup.jsp"><span>Sign Up</span></a></p>
            </form>
        </div>
<script>
    
    </script>
    </body>
</html>
