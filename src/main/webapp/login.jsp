<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="all_compo/allcss.jsp"%>

</head>
<body>
	<%@include file="all_compo/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>

					
						
						<%
						  String invalidmsg = (String)session.getAttribute("login-fail");
						
						if(invalidmsg!=null){
							%>
							<div class="alert alert-danger" role="alert"><%=invalidmsg %></div>
							
							<% 
							session.removeAttribute("login-fail");
						}
						%>
						
						<%
						 	String withoutlogin = (String)session.getAttribute("login-error");
						    if(withoutlogin!=null)
						    {%>
						       <div class="alert alert-danger" role="alert"><%=withoutlogin%></div>
						    	
						    <%
						    session.removeAttribute("login-error");
						    }
						%>

                     <%
                     
                     String lgmsg = (String)session.getAttribute("logoutmsg");
                     if(lgmsg!=null)
                     {%>
                     <div class="alert alert-success" role="alert"><%=lgmsg%></div>
                    	 
                     <% 
                     
                     session.removeAttribute("logoutmsg");
                     }
                   
                     
                     %>
                     
                     
                     
                     
                     
                     
                     
					<div class="card-body">
						<form action="loginServlet" method="post">
							<form>

								<div class="form-group">
									<label>Enter Email</label> <input type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="uemail">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Enter Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" name="upassword">
								</div>

								<button type="submit"
									class="btn btn-primary badge-pill btn-block">Login</button>
							</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<%@include file="all_compo/footer.jsp"%>


</body>
</html>