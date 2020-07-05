<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="_csrf_parameter" content="_csrf" />
<meta name="_csrf_header" content="X-CSRF-TOKEN" />
<meta name="_csrf" content="${_csrf.token}" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css" />
<link rel="stylesheet" type="text/css" href="css/editablegrid.css" />
<link rel="stylesheet" type="text/css" href="css/simple.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script src="js/editablegrid.js"></script>
<!-- [DO NOT DEPLOY] -->
<script src="js/editablegrid_renderers.js"></script>
<!-- [DO NOT DEPLOY] -->
<script src="js/editablegrid_editors.js"></script>
<!-- [DO NOT DEPLOY] -->
<script src="js/editablegrid_validators.js"></script>
<!-- [DO NOT DEPLOY] -->
<script src="js/editablegrid_utils.js"></script>
<!-- [DO NOT DEPLOY] -->
<script src="js/editablegrid_charts.js"></script>
<script src="js/home.js"></script>

<title>PMS - Home</title>

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
				<li><a onclick="document.forms['logoutForm'].submit()" href="javascript:void(0)">Logout</a></li>
			</ul>
		</nav>
		<div>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<h4>Welcome ${pageContext.request.userPrincipal.name}</h4>

			</c:if>

			<div class="panel panel-info">
				<div class="panel-heading">
					Available Policy <span id="message"></span>
				</div>
				<div>
					<!-- Grid contents -->
					<div id="tablecontent"></div>

					<!-- <table id="policy" class="display" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>SL No.</th>
	                <th>Policy Name</th>
	                <th>Policy Details</th>
	            </tr>
	        </thead>
		     </table> -->
				</div>
			</div>
		</div>

		<sec:authorize access="hasAuthority('admin')" var="hasRights">
			<input id="hasAuthority" type="hidden" value="${hasRights}" />
		</sec:authorize>
		

		<sec:authorize access="hasAuthority('user')">

			<div class="panel panel-info">
				<div class="panel-heading">${pageContext.request.userPrincipal.name}
					Policy Details</div>
				<div>
					<table id="policydet" class="display" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>Policy No.</th>
								<th>Policy Name</th>
								<th>Amount Paid</th>
								<th>Policy End Date</th>
								<th>Valid</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</sec:authorize>


	</div>
</body>
</html>


