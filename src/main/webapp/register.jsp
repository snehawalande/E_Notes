<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register here</title>
<%@include file="all_compo/allcss.jsp"%>
</head>
<body>
	<%@include file="all_compo/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Registration</h4>
					</div>


					<%
					String regmsg = (String) session.getAttribute("reg-sucess");

					if (regmsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regmsg%><a href="login.jsp"> Go to Login Page</a></div>

					<%
					session.removeAttribute("reg-sucess");
					}
					%>


					<%
					String failmsg = (String) session.getAttribute("reg-fail");

					if (failmsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%= failmsg %></div>
					<%
					session.removeAttribute("reg-fail");
					}
					%>

					<div class="card-body">
						<form action="UserServlet" method="post">

							<div class="form-group">
								<label>Enter FULL Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fname">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="upassword">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<%@include file="all_compo/footer.jsp"%>
</body>
</html>