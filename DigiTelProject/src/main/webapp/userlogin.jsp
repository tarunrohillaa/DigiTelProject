<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    
   <script type="text/javascript">
 function Validate(){
	 var nam = document.myForm.name.value;
	 var telenumber = document.myForm.telenumber.value;
	
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
p{
font-size: 18px;
color: white;
}
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
    
h1{
text-align: center;
color: #48e5f7;
font-size: 50px;
margin-bottom: 5%;
}
.bot{
margin-left: 80%;
width: 20%;
height:10%;
background-color: #48e5f7;
}
.aaa{
}
    *{
        font-family: 'Inter',sans-serif;
    }
</style>

<body >
<%
long current_time = System.currentTimeMillis();
Timestamp timestamp = new Timestamp(System.currentTimeMillis());
Connection con;
Statement stmt;
Statement stmt1;
ResultSet rs;
ResultSet rs1;
ResultSet Rs;
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:/mydb1", "root", "1@Rootpassword");
String Uname = (String)request.getAttribute("uname");
String Username = (String)request.getAttribute("theUserName");
%>
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
    
    <div id= "content" class="bot">
                                
                                 
                                
                                
                                <%

                               
                               
                                stmt=con.createStatement();
                                 
                              
                                String data = "SELECT * FROM LASTLOGIN WHERE username like'%"+Username+"%'";
                                rs=stmt.executeQuery(data);
                                
                                %>
                                <div class= "login">
                               <%
                                 if(rs.next()){
                                	 
                                 
                                %>
                                
                                <p>Last Logged In-
                                <%=rs.getString("lastlogindate")
                                 
                                %>
                                </p>
                               
                                <% 
                                 }
                                else{
                                	%>
                                <p>You logged in First time</p>
                               
                                <%} %>
                                 </div>
                                </div>
    
        <div class="row mt-2">
           
            <div class="col-md-12">
               
                <div class="card">
                
                    <div class="card-header text-white h3" style="background-color: #48e5f7;">
                     
                     <div class="row">
                            <div class="col-6">
                                <b>Enter Name or telephone number</b>
                            </div>
                            <div class="col-6">
                                <form action="" method="get">
                                    <input type="text" name="search" placeholder="Search..." class="form-control"/>
                                </form> 
                            </div>
                        </div>
                    </div>
                    <div class="card-body overflow-scroll" style="max-height:480px;overflow-y:scroll">
                        
                        <table class="table table-bordered">
                            <thead>
                              <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Telephone Number</th>
                                
                                <th scope="col">Stage</th>
                                
                                <th scope="col">Action</th>
                              </tr>
                            </thead>
                            <tbody>
                            <%
                             Connection cons;
						     Statement stmts;
						     ResultSet rss;
						     try
						     {
						    	 
                                 Class.forName("com.mysql.cj.jdbc.Driver");
                                 cons=DriverManager.getConnection("jdbc:mysql://localhost:/mydb1", "root", "1@Rootpassword");
						    	 stmts=cons.createStatement();
						    	 String search=request.getParameter("search");
						    	 String query;
						    	 if(search!=null){
						    	  query = "SELECT * FROM USERREQUEST WHERE ID like '%"+search+"%' OR NAME like '%"+search.toUpperCase()+"%' OR NAME like '%"+search+"%' OR TELENUM like'%"+search+"%' ";
						    	 }
						    	 else{
						    	   query="SELECT ID, NAME, TELENUMBER, STAGE FROM USERREQUEST WHERE OWNER like'%"+Username+"%'";
						    	 }
						    	 rss=stmts.executeQuery(query);
						    	 while(rss.next())
						    	 {
						          %>
						              <tr>
						                <td scope="row"> <%=Integer.parseInt(rss.getString("id"))%></td>
						                <td> <%=rss.getString("name") %></td>
						                <td> <%=Long.parseLong(rss.getString("telenumber")) %></td>
						                
						                
						                <td style="text-transform:uppercase"> <%=rss.getString("stage") %></td>
						                <td>
		                                   <a href="./requestuser.jsp?id=<%=rss.getInt("id")%>" class="btn btn-sm bg-warning text-dark">Request to change stage?</a>
		                                   
		                                </td>
						               </tr>
						        <% 
						    	 }
						    	 con.close();   		 
						    	 }
						    	 catch(Exception e)
						    	 {
						    	 out.print(e);
						    	 }
						         %>
                              
                          </table>
                          
                    </div>
                    
                    <div class="card-footer">
                    
                         
                    <a href="./login.jsp">
                    
                                    <button class="btn btn-success float-right" onclick="return Validate()" style="background-color: #48e5f7;">
                                       <p>Logout</p>
                                       
             <div>
            <%
            
           
    		PreparedStatement ps;
    		PreparedStatement ps1;
    		String sql2;
    		String datas = "Select * from lastlogin where USERNAME='"+Username+"'";
    		
    		try {
    			ps = con.prepareStatement(datas);
    			 Rs= ps.executeQuery(datas);
    			 
    			 if(Rs.next()) {
    					sql2= "UPDATE LASTLOGIN set LASTLOGINDATE = SYSTIMESTAMP where USERNAME=?";
    				}
    				else {
    					
    					sql2 = "INSERT INTO LASTLOGIN (USERNAME, LASTLOGINDATE) VALUES(?, SYSTIMESTAMP) ";
    				}
    			 ps1 = con.prepareStatement(sql2);
    				ps1.setString(1, Username);
    				int r1 = ps1.executeUpdate();
    		} catch (SQLException e1) {
    			// TODO Auto-generated catch block
    			e1.printStackTrace();
    		}
            
            %>
            </div>
                                       
                                  
                                       
                                       
                        </button>
                        </a>
                        
                         <a href="./resetpassword.jsp">
                                    <button class="btn btn-success float-right" onclick="return Validate()" style="background-color: #48e5f7;">
                                       Reset Password
                        </button>
                        </a>
                        
                         
                        <a href="./adduserrequest.jsp"><button class="btn btn-success float-right" style="background-color: #48e5f7;">Add New Number</button></a>
                        
                    </div>
                </div>
                
            </div>
           
        </div>
        </div>
        
    
</body>
</html>