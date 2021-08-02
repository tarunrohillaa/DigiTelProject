<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DigiTel</title>
<style>
body{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-image: url(admin-bg.jpg);
    /* background-attachment: fixed; */
    background-size: cover;
    background-repeat: no-repeat;
    font-family: sans-serif;
}


.left {
        display: inline-block;
        /* border: 2px solid red; */
        position: absolute;
        top: 0px;
        left: 34px;

    }

    .left div {
        text-align: center;
    }

    .left img {
        width: 220px;
        padding-top: 20px;
        border-radius: 20px;

    }
    .mid {
        /* border: 2px solid green; */
        display: block;
        width: 40%;
        margin: 10px auto;
    }

    .right {
        /* border: 2px solid yellow; */
        display: inline-block;
        position: absolute;
        top: 20px;
        right: 34px;
    }

    .navbar {
        display: inline-block;
    }

    .navbar li {
        display: inline-block;
        font-size: 25px;
    }

    .navbar li a {
        color: rgb(240, 240, 245);
        text-decoration: none;
        padding: 34px 23px;
    }

    .navbar li a:hover,
    .navbar li a:active {
        text-decoration: underline;
        color: rgb(138, 134, 134);
    }

 .loginbox{
     width: 320px;
     height:420px;
     background: #000;
     color:#fff;
     top:50%;
     left:50%;
     position:absolute;
     transform: translate(-50%,-50%);
     box-sizing:border-box;
     padding:70px 30px;
 }

h1{
    margin:0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 22px;
}

.loginbox p{
    margin: 0;
    padding: 0;
    font-weight: bold;
}

.AB{
    cursor: pointer;
    background-color: rgb(143, 143, 192);
    font-weight: bolder;
    font-size: 24px;
    padding: 4px 30px;
    border-radius: 15px;
    margin: 20px 44px;
}

.BB{
    cursor: pointer;
    background-color: rgb(143, 143, 192);
    font-weight: bolder;
    font-size: 24px;
    padding: 4px 30px;
    border-radius: 15px;
    margin: 20px 38px;
}

.CB{
    cursor: pointer;
    background-color: rgb(143, 143, 192);
    font-weight: bolder;
    font-size: 24px; 
    padding: 4px 30px;
    border-radius: 15px;
    margin: 20px 57px;
}

.AB:hover{background-color: rgb(214, 214, 253);}
.BB:hover{background-color: rgb(214, 214, 253);}
.CB:hover{background-color: rgb(214, 214, 253);}

</style>

</head>
<body>
    <header class="header">
        <div class="left">
            <img src="Digitel-logo.png" alt="">
        </div>
        <div class="mid">
            <ul class="navbar">
                <li><a href="./login.jsp">Home</a></li>
                <li><a href="#" target="_blank">Contact Us</a></li>
                <li><a href="#" target="_blank">About Us</a></li>
                <li><a href="#" target="_blank">Help</a></li>
            </ul>
        </div>
        <div class="right">
            <button class="btn">Call Us</button><button class="btn">Email Us</button>
        </div>
    </header>
   
    <div class="loginbox">
        <h1>Choose any option</h1>
        <div class="Abutton"><form action="./viewrequest.jsp"><button type="submit" class="AB">View Requests</button></form></div>
        <div class="Bbutton"><form action="./admindashboard.jsp"><button type="submit" class="BB">Dashboard</button></form></div>
        <div class="Cbutton"><form action="./login.jsp"><button type="submit" class="CB">Logout</button></form></div></div>

</body>
</html>