<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.sql.ResultSet" %>
 <%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<%
String host = "jdbc:mysql://localhost:/mydb1";
Statement stmt;
ResultSet rs;
Connection con = null;
PreparedStatement ps = null;
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection(host, "root", "1@Rootpassword"); 
String Username = (String)request.getAttribute("theUserName");
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
<script type="text/javascript">
 function Validate(){
	 var nam = document.myForm.name.value;
	 var tele = document.myForm.telenumber.value;
	 var regexemail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
	 var regextele = /^\d{10}$/;
	 var regexnam =  /^[a-zA-Z ]{2,30}$/;
	 var regexpwd = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	
	 if(!nam.match(regexnam)){
		 alert("Input  a valid name");
		 document.myForm.name.focus();
		 return false;
		 }
	 
	 if(!tele.match(regextele)){
		 alert("Input an Telehone No.[xxxxxxxxxx] of 10 digits");
		 document.myForm.telenumber.focus();
		 return false;
		 }
	 
	
	 
 }
</script>    
    
</head>
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
    
    *{
        font-family: 'Inter',sans-serif;
    }
</style>
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
    <div class="container p-4">
        <div class="row mt-2">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <form name ="myForm" method="post" action="requestuser" onsubmit="return Validate()">
                
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #48e5f7;;"><b>Add New Number</b></div>
                    <div class="card-body">
                    <% 
                        stmt = con.createStatement();
                    String Username1 = (String)request.getAttribute("theUserName");
                        String query = "SELECT * FROM USERLOGIN WHERE  EMAIL ='"+Username1+"' ";
                        rs=stmt.executeQuery(query);
                        if(rs.next()){
                        %>
                           <div class="form-group mt-2">
                              <label class="mb-0"><b>Owner</b></label>
                              <input type="text" class="form-control mt-0" name="owner" required value="<%=rs.getString("email")%>" >
                            
                            </div>
                        <%} %>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name" required>
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="text" class="form-control" name="telenumber" required>
                            </div>
                            
                           
                            <div class="form-group mt-2">
                                <label class="mb-0"><b>Select Stage</b></label>
                                <select name="stage" class="form-control" required>
                                    <option value="Initial">Initial</option>
                                    <option value="Ready to Provision">Ready to Provision</option>
                                    <option value="Provisioned">Provisioned</option>
                                    <option value="Active">Active</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Deactivate">Deactivate</option>
                                </select>
                            </div>
                           
                            
                                         
                       
                      
                    </div>
                    <div class="card-footer">
                        <span class="float-left">  </span>
                        <button type="submit" class="btn btn-success float-right" style="background-color: #48e5f7;" >Add Mobile Number
                          <div>
           
           
            </div>
                        
                        </button>
                        <a href="./userlogin.jsp" class="btn btn-success float-right" style="background-color: #48e5f7;">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                </form>
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>

 
</html>