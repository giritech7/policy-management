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
	  
	  <!--  jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>


<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

    <title>PMS - Registration</title>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script>
$(document).ready(function() {
	var date_input=$('input[name="dob"]'); //our date input has the name "date"
    var options={
      format: 'dd-mm-yyyy',
      autoclose: true
    };
    date_input.datepicker(options);
});
</script>
</head>

<body>
<div class="container">

	<div class="page-header" align="center">
	    <h3>Policy Management System</h3>      
	</div>
	<nav class="navbar">
	  <ul class="nav navbar-nav navbar-right">
	    <li><a href="${contextPath}/login">Login</a></li>
	    <li><a href="#">About Us</a></li>
	    <li><a href="#">Contact Us</a></li>
	  </ul>
	</nav>
	<div >

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Create your account</h2>
		<c:if test="${not empty error}">
			    <div class="alert alert-danger" role="alert">${error}</div>
		</c:if>
		<spring:bind path="fname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            
                <form:input type="text" path="fname" class="form-control" placeholder="First Name"
                            autofocus="true" required="true"></form:input>
                <form:errors path="fname"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="lname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            
                <form:input type="text" path="lname" class="form-control" placeholder="Last Name"
                            autofocus="true" required="true"></form:input>
                <form:errors path="lname"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="dob">
            <div class="form-group ${status.error ? 'has-error' : ''}">
		            <div class="input-group input-append date" id="datePicker">
		            	<form:input type="text" path="dob" class="form-control" placeholder="Date Of Birth"
                            autofocus="true" required="true" readonly="true"></form:input>
		                <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
		            </div>
                <form:errors path="dob"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="address">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="address" path="address" class="form-control" placeholder="Address" required="true"></form:input>
                <form:errors path="address"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="phone">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            
                <form:input type="tel" path="phone" class="form-control" placeholder="Phone No."
                            autofocus="true" required="true"></form:input>
                <form:errors path="phone"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="emailId">
            <div class="form-group ${status.error ? 'has-error' : ''}">
            
                <form:input type="email" path="emailId" class="form-control" placeholder="Email Id"
                            autofocus="true" required="true"></form:input>
                <form:errors path="emailId"></form:errors>
            </div>
        </spring:bind>
        
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password" required="true"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="confirmPassword">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="confirmPassword" class="form-control"
                            placeholder="Confirm your password" required="true"></form:input>
                <form:errors path="confirmPassword"></form:errors>
            </div>
        </spring:bind>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
	</div>
</div>

</body>
</html>
