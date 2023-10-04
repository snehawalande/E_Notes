<%@page import="java.util.List"%>
<%@page import="com.User.Post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.postDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login...");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_compo/allcss.jsp"%>
</head>
<body>
	<%@include file="all_compo/navbar.jsp"%>

     <%
     String updateMsg = (String)session.getAttribute("updateMsg");
     if(updateMsg != null)
     {%>
    	  <div class="alert alert-success" role="alert"><%=updateMsg%></div>
     <%
     session.removeAttribute("updateMsg");
     }
     
     %>
     
     <%
     String wrongMsg = (String)session.getAttribute("wrongMsg");
     if(wrongMsg != null)
     {%>
    	  <div class="alert alert-alert" role="alert"><%=updateMsg%></div>
     <%
     session.removeAttribute("wrongMsg");
     }
     
     %>


	<div class="container">
		<h2 class="text-center">All Notes</h2>

		<div class="row">
			<div class="col-md-12">

				<%
				if (user3 != null) {
					postDAO ob = new postDAO(DBConnect.getConn());
					List<Post> post = ob.getData(user3.getId());
					for (Post po : post) {
				%>

				<div class="card mt-3">

					<img alt="" src="img/1.jpg" class="card-img-top mt-2 mx-auto"
						style="max-width: 200px;">

					<div class="card-body p-4">


						<h5 class="card-title"><%=po.getTitle()%></h5>
						<p><%=po.getContent()%>.
						</p>

						<p>
							<b class="text-success">Published by:<%=user3.getName()%></b></br> <b
								class="text-primary"> </b>
						</p>

						<p>
							<b class="text-success">Published Date:<%=po.getPdate()%></b></br> <b
								class="text-success"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a> 

								<a href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>

						</div>
					</div>
				</div>

				<%
				}
				}
				%>


			</div>
		</div>
	</div>

</body>
</html>