<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%
    
      UserDetails user2 =(UserDetails)session.getAttribute("userD");
    
      if(user2==null){
    	  response.sendRedirect("login.jsp");
    	  session.setAttribute("login-error", "Please login...");
      }
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="all_compo/allcss.jsp" %>
</head>
<body>

<div class="container-fluid">
<%@include file="all_compo/navbar.jsp" %>

<div class="card py-3">
<div class="card-body text-center">
<img alt="" src="img/1.jpg" class="img-fluid mx-auto" style="max-width: 1000px">
<br>
<br>

<h2>START TAKING YOUR NOTES</h2>

<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>

</div>


</div>
</div>
<%@include file="all_compo/footer.jsp" %>
</body>
</html>