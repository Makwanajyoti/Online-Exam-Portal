<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sign up page of online exam portal </title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body{
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-image: url("images/exam1.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center;
            }
            .signup{
                background-color: white;
                width:25rem;
                height:30rem;
                margin:auto;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
                margin-top: 4rem;
                box-sizing: border-box;
                padding: 1rem 2rem;
                text-align: center;
                color:rgb(30, 98, 255);
            }
            .signup .p1{
                margin-bottom: 2rem;
            }
            .signup .p2{
                color:rgba(0,0,0,0.6);
            }
            a{
                text-decoration: none;
                color:rgb(30, 98, 255);

            }
            .signup input{
                width:16rem;
                height: 2rem;
                margin-bottom: 1rem;
                border:none;
                border-bottom: 2px solid rgba(0,0,0,0.2);
                font-size:medium;
            }
            .signup input:active{
                outline: none;
                border: none;
            }
            .signup_btn{
                padding: 0.65rem 7.5rem;
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
        </style>
    </head>
    <body>
        <div class="signup">
            <form action="signup_s" method="post">
                <p class="p1">Create Exams for Students or <br> Candidates in my Organization</p>
                <i class="fa-solid fa-address-card"></i>
                <input type="text" name="username" placeholder="Username"><br>
                <i class="fa-solid fa-envelope"></i>
                <input type="email" name="email" placeholder="Email id"><br>
                <i class="fa-solid fa-lock"></i>
                <input type="text" name="password" placeholder="Password"><br>
                <button class="signup_btn">sign up</button>
                <p class="p2">By creating an account, I accept the Terms of Service and Privacy & Security Policy.</p>
                <a href="login.jsp">sign up already ? let's go for Login </a>
            </form>
        </div>
    </body>
</html>
