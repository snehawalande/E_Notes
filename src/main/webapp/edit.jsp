<%@page import="com.User.Post"%>
<%@page import="com.DAO.postDAO"%>
<%@page import="com.Db.DBConnect"%>
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
<title>Edit Notes</title>
<%@include file="all_compo/allcss.jsp"%>
</head>
<body>

	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	
	postDAO post = new postDAO(DBConnect.getConn());
	Post p = post.getDataById(noteid);
	
	
	%>

	<div class="container-fluid">
		<%@include file="all_compo/navbar.jsp"%>
		<h1 class="text-center">Edit Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="NoteEditServlet" method="post">

						<input type="hidden" value="<%=noteid%>" name="noteid">

						<div class="form-group">



							<label for="exampleInputEmail1">Enter title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="8" cols="8" class="form-control" name="content"
								required="required"><%=p.getContent() %></textarea>

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">Edit and Save</button>
						</div>
					</form>

				</div>
			</div>
		</div>

	</div>
	<%@include file="all_compo/footer.jsp"%>
</body>
</html>