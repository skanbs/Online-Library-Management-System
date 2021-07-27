
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:useBean id="admin" class="Model.Admin" scope="session" />



<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="../Template/img/favicon.png">

<title>BiB|ViSiT</title>

<!-- Bootstrap core CSS -->
<link href="../Template/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../Template/css/theme.css" rel="stylesheet">
<link href="../Template/css/bootstrap-reset.css"
	rel="stylesheet">
<!--external css-->
<link
	href="../Template/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="../Template/css/flexslider.css">
<link href="../Template/assets/bxslider/jquery.bxslider.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../View/Template/css/animate.css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">


<!-- Custom styles for this template -->
<link href="../Template/css/style.css" rel="stylesheet">
<link href="../Template/css/style-responsive.css"
	rel="stylesheet">


<style type="text/css">
.dropdown-submenu:hover>.dropdown-menu {
	display: none
}
</style>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/2/common.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/2/util.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/2/map.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/2/marker.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/2/controls.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="https://maps.googleapis.com/maps-api-v3/api/js/44/2/onion.js"></script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();">