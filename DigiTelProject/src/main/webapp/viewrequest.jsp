<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Requests</title>
    <!--Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
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

    *{
        font-family: 'Inter',sans-serif;
    }
</style>

<body >
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
           
            <div class="col-md-12">
               
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #48e5f7;">
                     <div class="row">
                            <div class="col-6">
                                <b>Request List</b>
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
                               
                                <th scope="col">Current Stage</th>
                                <th scope="col">Requested Stage</th>
                                <th scope="col">Action</th>
                              </tr>
                            </thead>
                            <tbody>
                            <%
                             Connection con;
						     Statement stmt;
						     ResultSet rs;
						     try
						     {
						    	 Class.forName("com.mysql.cj.jdbc.Driver");
						    	 con=DriverManager.getConnection("jdbc:mysql://localhost:/mydb1", "root", "1@Rootpassword");
						    	 stmt=con.createStatement();
						    	 String search=request.getParameter("search");
						    	 String query;
						    	 if(search!=null){
						    	  query = "SELECT * FROM REQUESTUSER WHERE ID like '%"+search+"%' OR NAME like '%"+search+"%' OR TELENUMBER like'%"+search+"%' OR CURRENTSTAGE like'%"+search+"%' OR REQUESTEDSTAGE like'%"+search+"%' ";
						    	 }
						    	 else{
						    	   query="SELECT * FROM REQUESTUSER";
						    	 }
						    	 rs=stmt.executeQuery(query);
						    	 while(rs.next())
						    	 {
						          %>
						              <tr>
						                <td scope="row"> <%=Integer.parseInt(rs.getString("id"))%></td>
						                <td> <%=rs.getString("name") %></td>
						                <td> <%=Long.parseLong(rs.getString("telenumber")) %></td>
						                 
						                 <td> <%=rs.getString("currentstage") %></td>
						               
						                <td style="text-transform:uppercase"> <%=rs.getString("requestedstage") %></td>
						                <td>
		                                    <a href="./approverequest.jsp?id=<%=rs.getInt("id")%>" class="btn btn-sm bg-warning text-dark">Make Approve</a>
		                                    <a href="./deluser.jsp?id=<%=rs.getInt("id")%>" class="btn btn-sm bg-danger text-white">Delete</a>
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
                    
                         <a href="./loginSuccess.jsp" class="btn btn-success float-right" style="background-color: #48e5f7;">Home</a>
                        
                        
                    </div>
                </div>
                
            </div>
           
        </div>
        
    </div>
</body>
</html>