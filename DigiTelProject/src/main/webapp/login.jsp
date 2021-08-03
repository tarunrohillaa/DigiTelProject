<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DigiTel</title>
<script type="text/javascript">
 function validate(){
	 var uname = document.myForm.username.value;
	 var pass = document.myForm.password.value;
	 var regexmail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 
	 if(uname==""){
		 alert("please enter username");
		 document.myForm.username.focus();
		 return false;
		 }
	 if(!(uname.match(regexmail) || uname.match(regextele)))
	 {
	 alert("Please enter correct Email / Telephone Number");
	 document.myForm.username.focus();
	 return false;
	 
	 }
	 
	 if(pass==""){
		 alert("please enter password");
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
    background-image: url(Digitel-bg.jpg);
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


 .avatar{
     width:100px;
     height:100px;
     border-radius:50%;
     position:absolute;
     top:-50px;
     left:110px

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

.loginbox a{
    text-decoration: none;
    font-size: 12px;
    line-height: 20px;
    color: darkgrey;
}

.loginbox a:hover{
    color: #ffc107;
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
                <li><a href="#">Home</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="#">Help</a></li>
            </ul>
        </div>
        <div class="right">
            <button class="btn">Call Us</button><button class="btn">Email Us</button>
        </div>
    </header>
   
    <div class="loginbox">
        <img src="avatar.png" class="avatar" alt="avatar">
        <h1>Login Here</h1>
<form name ="myForm" action="login" method ="post" onsubmit="return validate()">
            <p>UserName/Telephone No.: </p>
            <input type="text" name="username" placeholder="Enter Username" required>
            <p>Password: </p>
            <input type="password" name="password" placeholder="Enter Password" required>
            <input type="submit" value="login"><br>
        </form>
    </div>
</body>
</html>