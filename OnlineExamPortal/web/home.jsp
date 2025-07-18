<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page of online exam portal</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" 
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" 
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            body{
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .container{
                background-color: white;
                width:100vw;
                height:100vh;
                color:black;
            }
            .navbar{
                width:100vw;
                height:15%;
                display:flex;
                justify-content: space-around;
                border-bottom:2px solid rgba(0,0,0,0.1);
            }
            .content{
                width:100vw;
                height:85%;
            }
             a {
                color:black;
                text-decoration:none;
                padding: 0.55rem 1rem 1rem 1rem;
                opacity: 0.6;
                font-weight: 400;
                box-sizing: border-box;
                    /* transition: font-weight 0.2s ease, opacity 0.2s; */

            }
            a:hover {
                /* box-shadow: 0 0 4px 4px white; */
                border-bottom:2px solid black;
                opacity: 1;
                /* font-weight: 500; */
                box-sizing: border-box;
            }
            .welcome {
                margin-left: 3.4rem;
            }
            .content p {
                margin-left: 3.4rem;
                font-size: larger;
            }
            .try-button{
                margin-left: 3.4rem;
                padding: 1rem 3rem;
                background-color:mediumblue;
                border:none;
                font-size: larger;
                color:white;
                border-radius: 1rem;
                font-weight: 600;
                box-shadow: 0px 0px 2px 2px gainsboro;
            }
            h2{
                
                display:inline-block;
                margin-top: 2rem;
                margin-left: 3.9rem;
                font-size:xx-large;
            }
            i{
                font-size: xx-large;
                margin-left: 1rem;}
            /* 
            .ul{
                display: flex;
                flex-direction: row;
                flex-wrap: wrap;
                margin-left: 3.9rem;
            }
            .li{
                width: 35rem;
                height: 14rem;
                color:black;
                margin: 2rem;
                font-size: xx-large;
                box-sizing: border-box;
                padding: 1rem;
                border-radius: 2rem;
                box-shadow: 0px 0px 2px 2px gainsboro;
            } */
            .ul {
                margin-left: 2rem;
                display: flex;
                flex: 0 0 auto;
                 overflow-x: auto;
                 padding: 1rem 3.4rem;
                 gap: 1rem;
                 scroll-snap-type: x mandatory;
                 scrollbar-width: none; /* Firefox */
                 -ms-overflow-style: none;  /* IE */
                }
                .ul::-webkit-scrollbar {
                 display: none; /* Chrome */
                    }

                .li {
                    flex: 0 0 auto;
                    width: 23rem;
                    height: 11rem;
                    border-radius: 1rem;
                    font-size:1.7rem;
                    padding: 1rem;
                    color: white;
                    scroll-snap-align: start;
                    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
                    display: flex;
                    flex-direction: column;
                    justify-content: space-between;
                    transition: transform 0.3s ease;
                    }

                    .li:hover {
                    transform: scale(1.05);
                    }

                    .one{
                        background-image:url("images/7.jpg");
                        background-size: cover;
                        background-position:center;
                        background-repeat: no-repeat;
                    }
                      .two{
                        background-image:url("images/2.jpg");
                        background-size: cover;
                        background-position:center;
                        background-repeat: no-repeat;
                    }  .three{
                        background-image:url("images/6.jpg");
                        background-size: cover;
                        background-position:center;
                        background-repeat: no-repeat;
                    }  .four{
                        background-image:url("images/1.jpg");
                        background-size: cover;
                        background-position:center;
                        background-repeat: no-repeat;
                    }  .five{
                        background-image:url("images/3.jpg");
                        background-size: cover;
                        background-position:center;
                        background-repeat: no-repeat;
                    }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <h1>BrainClick</h1>
                </div>
                <div class="online-exam">
                    <h1><a href="exam.jsp">Online exam</a></h1>
                </div>
                <div class="login">
                    <h1><a href="login.jsp">Login</a></h1>
                </div>
                <div class="sign-up">
                    <h1><a href="signup.jsp">Sign Up</a></h1>
                </div>
                <div class="logout">
                    <h1><a href="LogoutServlet">Logout</a></h1>
                </div>
            </div>
            <div class="content">
                <div class="home-content">
    <h1 class="welcome">Welcome to BrainClick </h1>
    <p>
        BrainClick is your trusted platform to practice online exams and sharpen your skills.
        Designed for modern learners, we make testing smarter, simpler, and accessible from anywhere.
    </p>
<form action="exam.jsp">
        <button class="try-button">Let's Try</button>
    </form>
    <h2>Features</h2>
    <i class="fa-solid fa-lightbulb"></i>
    <div class="ul">
        <div class="li one">Practice MCQ-based quizzes in Java, JavaScript, and more</div>
        <div class="li two">Get instant results and feedback</div>
        <div class="li three">Track your exam history and improve over time</div>
        <div class="li four">Secure platform with personalized login</div>
        <div class="li five">Accessible on laptop, tablet, or mobile</div>
        
    </div>

    <br>
    
</div>

            </div>
        </div>
        
        
    </body>
</html>
