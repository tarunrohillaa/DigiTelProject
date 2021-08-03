<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
           
                <form method="get"  name="myForm">
                
                 <% 
						     String id =request.getParameter("id");
						    
						    	 

						    	 stmt=con.createStatement();
						    	 
						    	 String data;
						    	 
						    	  data = "SELECT * FROM USERREQUEST WHERE ID ='"+id+"'";
						    	 
						    	 
						    	 rs=stmt.executeQuery(data);
						    	 while(rs.next())
						    	 {
						          %>
                
                
                <div class="card">
                    <div class="card-header text-white h3" style="background-color: #48e5f7;"><b>Make New Request</b></div>
                    
                    <div class="card-body">
                           
                             
						     <input type = "hidden" name="id" value="<%=rs.getString("id")%>"/>
                           
                             <div class="form-group mt-2">
                              <label class="mb-0"><b>Name</b></label>
                              <input type="text" class="form-control mt-0" name="name"  required value="<%=rs.getString("name")%>" readonly >
                            
                            </div>
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Telephone number</b></label>
                              <input type="text" class="form-control" name="telenumber"  required value="<%=rs.getString("telenumber")%>" readonly>
                            </div>
                            
                            <div class="form-group mt-2">
                              <label class="mb-0"><b>Current Stage</b></label>
                              <input type="text" class="form-control" name="stage"  required value="<%=rs.getString("stage")%>" readonly>
                            </div>
                             
                           
                            <div class="form-group mt-2">
                                <label class="mb-0"><b>Select Stage</b></label>
                                <select name="requestedstage" class="form-control" required>
                                    <option value="Initial">Initial</option>
                                    <option value="Ready to Provision">Ready to Provision</option>
                                    <option value="Provisioned">Provisioned</option>
                                    <option value="Active">Active</option>
                                    <option value="Suspended">Suspended</option>
                                    <option value="Deactivate">Deactivate</option>
                                </select>
                            </div>
                            

                                               
                    </div>
                       <%           
				 }
				%>
                   
                    <div class="card-footer">
                        <span class="float-left">  </span>
                        <button type="submit" class="btn btn-success float-right" style="background-color: #color: #48e5f7;" >Make request</button>
                        <a href="./userlogin.jsp" class="btn btn-success float-right" style="background-color: #color: #48e5f7;">Back</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                </div>
                
                </form>
                
            </div>
            <div class="col-md-1"></div>
        </div>
        
    </div>
</body>

                <%
String b = request.getParameter("name");
String c = request.getParameter("telenumber");
String d = request.getParameter("stage");
String e = request.getParameter("requestedstage");
if(b!=null && c!=null  && d!=null && e!=null)
{
	String query2 = " INSERT INTO REQUESTUSER " + " (NAME, TELENUMBER, CURRENTSTAGE, REQUESTEDSTAGE) VALUES " + " (?,?, ?, ?) ";
	//String query2 = "update USERLOGIN set NAME=?, TELENUMBER=?,EMAIL=?, STAGE=?, PASSWORD=? where ID=? ";
	ps = con.prepareStatement(query2);
	
	ps.setString(1, b.toUpperCase());
	ps.setString(2, c);
	ps.setString(3, d);
	ps.setString(4, e);
	
	
	
	
	
	 int i = ps.executeUpdate();
	 
	 if(i>0){
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('Request Submitted successfully!');");
		    out.println("window.location.href = \"userlogin.jsp\";");
		    out.println("</script>");
			//response.sendRedirect("./Dashboard.jsp");
		}
		else{
			out.println("Error occured");
		}
	 
}
%>
</html>
