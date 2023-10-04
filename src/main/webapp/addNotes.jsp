<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login...");
}
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_compo/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="all_compo/navbar.jsp"%>
		<%
		String msg = (String) session.getAttribute("msg");
		if(msg !=null){
			
			%>
			<div class="alert alert-success" role="alert"><%=msg %></div>
			<%
			session.removeAttribute("msg");
		}
		%>
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="addNote" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">

							<%
							}
							%>




							<label for="exampleInputEmail1">Enter title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="8" cols="8" class="form-control" name="content"
								required="required"></textarea>

						</div>
						<div class="container text-center">
						
					<button class="btn btn-primary" type="submit">Add</button>
							
						</div>
					</form>

				</div>
			</div>
		</div>

	</div>
<div class="container-fluid bg-dark mt-5">
	<p class="text-center text-white">Note: Any Error occur then
		contact walandesneha7@gmail.com Designed and Developed by Sneha
		Walande</p>

	<p class="text-center text-white">All Rights Reserved
		@SnehaWalande-2023-24</p>



</div></body>
</html>