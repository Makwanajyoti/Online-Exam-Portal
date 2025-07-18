<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>exam page of online exam portal </title>
        <style>
            body{
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                /* background-image: url("images/exam2.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-position: center; */
                background: linear-gradient(135deg, #a4c4f9 0%, #c2e9fb 100%);
                
                height: 100vh;
            }
            h2{
                text-align: center;
                color:rgb(5, 5, 52);
                font-size: xx-large;
                text-shadow: 2px 2px 5px 5px rgba(0,0,0,0,0.5);
            }
            .exam1-1{
                background-color:#ffe0b2;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
                width: 96%;
                height: 8rem;
                margin: auto;
                border-radius: 1rem;
                background: rgba(255, 255, 255, 0.25);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.18);
                }
            .exam1-1:hover ,.exam2-1:hover{
                transform: scale(1.02);
                transition: 0.3s ease-in-out;
                }
            .exam2-1{
                background-color:#debee3;
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
                width: 96%;
                height: 8rem;
                margin: auto;
                border-radius: 1rem;
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.18);
            }
            .p1{
                font-size:xx-large;
                margin-left: 1rem;
                display: inline-block;
                margin-top: 1rem;
                font-weight: 900;
                color:rgb(5, 5, 52);
            }
            .box{
                /* display: flex;
                flex-direction: row;
                justify-content: space-between; */
                position: relative;
            }
            .p2{
                
                font-size:x-large;
                margin-top: -1rem;
                margin-left: 1rem;
                font-weight: 600;
                /* color:rgba(0,0,0,0,0.1); */
                opacity: 0.5;
            }
            .exam1-1 button, .exam2-1 button{
                margin-right: 2rem;
                padding: 0.7rem 4rem;
                position: absolute;
                display: inline-block;
                right: 1rem;
                top: -0.4rem;
                background-color:rgb(30, 98, 255);
                color:white;
                font-size: larger;
                font-weight: 500;
                border-radius: 1rem;
                border: none;
            }
        </style>
    </head>
    <body>
        <%

    if (session == null || session.getAttribute("user") == null) {
        request.setAttribute("message", "Please login or sign up first.");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
        return;
    }
    
%>
<!-- Show exam content here -->
<h2>Welcome, <%= session.getAttribute("user") %>! Ready for your exam?</h2>

<!-- exams: -->
 <div class="exam1">
    <div class="exam1-1"><p class="p1">Exam - 1 </p>
        <div class="box">
            <p class="p2">subject - core Java</p>
            <a href="exam1.jsp?exam=exam1"><button>Start Exam</button> </a>
        </div>
    </div>
<br>
 </div>
 <!-- <div class="exam2">
<a href="exam2.jsp?exam=exam2">Start Exam 2</a>
 </div> -->
 <div class="exam2">
    <div class="exam2-1"><p class="p1">Exam - 2 </p>
        <div class="box">
            <p class="p2">subject - Java-Script</p>
            <a href="exam2.jsp?exam=exam2"><button>Start Exam</button> </a>
        </div>
    </div>
<br>
 </div>
    </body>
</html>
