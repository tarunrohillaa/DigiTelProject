<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DigiTel</title>
<script type="text/javascript">
 function Validate(){
	 var nam = document.myForm.name.value;
	 var tele = document.myForm.telenumber.value;
	 var mail = document.myForm.email.value;
	 var step = document.myForm.stage.value;
	 var pwd = document.myForm.password.value;
	 var regexemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 var regexnam =  /^[a-zA-Z ]{2,30}$/;
	 var regexpwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	
	 if(!nam.match(regexnam)){
		 alert("Please Enter a valid name");
		 document.myForm.name.focus();
		 return false;
		 }
	 
	 if(!tele.match(regextele)){
		 alert("Please Enter a Telehone No. of 10 digits only");
		 document.myForm.telenumber.focus();
		 return false;
		 }
	 
	 if(!mail.match(regexemail)){
		 alert("Please enter valid email, example- abc@gmail.com");
		 document.myForm.email.focus();
		 return false;
		 }
	 if(!pwd.match(regexpwd)){
		 alert("Password should contain 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character");
		 document.myForm.password.focus();
		 return false;
		 }
	 
 }
</script>
    
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
     height:580px;
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

.loginbox input[type="text"], input[type="password"], input[type="email"],input[type="number"],select
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
    height: 34px;
    background: rgb(153, 153, 231);
    color:#fff;
    font-size:18px;
    border-radius: 20px;
    margin-top: 20px;
}

.loginbox input[type="submit"]:hover
{
    cursor: pointer;
    background:#ffc107;
    color:#000;
}

#stage{
    background-color: black;
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
        
        <h1>Add User</h1>
                <form name ="myForm" method="post"  action="AddUser" onsubmit="return Validate()">
            <p>Name</p>
            <input type="text" name="name" placeholder="Enter you name" required>  
            <p>Telephone Number</p>
            <input type="number" name="telenumber" placeholder="Enter your number" required>
            <p>Email</p>
            <input type="email" name="email" placeholder="Enter your email" required>
            <p class="pass">Password</p>
            <input type="password" name="password" placeholder="Enter your password" required>



            <input type="submit" name="submit" value="Add New User">
        </form>
    </div>


</body>
</html>