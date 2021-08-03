<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DigiTel</title>
    
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
    <script type="text/javascript">
 function Validate(){
	 var tele = document.myForm.telenumber.value;
	 var mail = document.myForm.email.value;
	 var pwd = document.myForm.password.value;
	 var newpwd = document.myForm.newpassword.value;
	 var regexemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 
	 var regexpwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	 
	 if(!mail.match(regexemail)){
		 alert("please enter correct email format, example- xyz@gmail.com");
		 document.myForm.email.focus();
		 return false;
		 }
	 if(!tele.match(regextele)){
		 alert("Input an Phone No.[xxxxxxxxxx] of 10 digits");
		 document.myForm.telenumber.focus();
		 return false;
		 }
	 
	 if(!pwd.match(regexpwd)){
		 alert("this not a correct format of password, rite correct format");
		 document.myForm.password.focus();
		 return false;
		 }
	 if(!newpwd.match(regexpwd)){
		 alert("password should contain 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
		 document.myForm.newpassword.focus();
		 return false;
		 }
	 
 }
</script> 
<style>
body{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-image: url(user-bg.jpg);
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

.loginbox input{
    width:100%;
    margin-bottom:20px;
}

.loginbox input[type="text"], input[type="password"]
{
    border:none;
    border-bottom: 1px solid #fff;
    background: transparent;
    outline: none;
    height:40px;
    color:#fff;
    font-size:16px;
}

.loginbox input[type="submit"]
{
    border:none;
    outline:none;
    height: 40px;
    background: rgb(153, 153, 231);
    color:#fff;
    font-size:18px;
    border-radius: 20px;
}

.loginbox input[type="submit"]:hover
{
    cursor: pointer;
    background:#ffc107;
    color:#000;
}

.btn{
cursor: pointer;
background-color: rgb(143, 143, 192);
font-weight: bolder;
}

.btn:hover{
    background-color:silver;
}

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
        
        <h1>Reset Password</h1>
                <form method="post" name="myForm" action="Reset" onsubmit="return Validate()">
            <p>EMAIL</p>
            <input type="text" name="email" placeholder="Enter Username" required>
            <p>Old Password</p>
            <input type="password" name="password" placeholder="Enter your old password" required>
            <p>New Password</p>
            <input type="password" name="newpassword" placeholder="Enter your new password" required>
            <button type="submit" class="btn">Reset Password</button>            
        </form>
    </div>


</body>
</html>