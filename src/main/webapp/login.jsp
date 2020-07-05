<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
	  <meta charset="utf-8" />
	  <meta name="viewport" content="width=device-width, initial-scale=1" />
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>PMS - Login</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>


<div class="container">

	<div class="page-header" align="center">
	    <h3>Policy Management System</h3>      
	</div>
	<nav class="navbar">
	  <ul class="nav navbar-nav navbar-right">
	    <li><a href="${contextPath}/registration">Register</a></li>
	    <li><a href="#">About Us</a></li>
	    <li><a href="#">Contact Us</a></li>
	  </ul>
	</nav>
	<div >
		<form method="POST" action="${contextPath}/login" class="form-horizontal">
        <h2 class="form-heading">Log in</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
           <c:if test="${not empty message}">
			    <div class="alert alert-info" role="alert">${message}</div>
		   </c:if>
        	
           <div class="form-group">
				<label class="control-label col-sm-2" for="userId">User ID:</label>
				<div class="col-sm-5">
		            <input name="username" type="text" class="form-control" placeholder="Username"
		                   autofocus="true"/>
		     </div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">Password:</label>
				<div class="col-sm-5">
            	<input name="password" type="password" class="form-control" placeholder="Password"/>
            </div>
			</div>            
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-5">
					<button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
				</div>
			</div>
			<c:if test="${not empty error}">
			    <div class="alert alert-danger" role="alert">${error}</div>
		    </c:if>
			
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </div>

    </form>
    
	</div>
	
	
</div>
</body>
</html>
