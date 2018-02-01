<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>
<spring:url var="fonts" value="/resources/fonts"/>
<spring:url var="images" value="/resources/images"/>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping</title>
</head>
<body>${contextRoot} says - ${greeting}
</body>
</html> --%>


<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Online Shopping - ${title}</title>

	<script type="text/javascript">
		window.menu = '${title}';
		window.contextRoot = '${contextRoot}';
	</script>

    <!-- Bootstrap core CSS -->
    <link href="${css}/bootstrap.min.css" rel="stylesheet">
    
    
    <!-- Bootstrap Spacelab theme CSS -->
    <link href="${css}/bootstrap-Spacelab-theme.css" rel="stylesheet">
    
    <!-- Bootstrap DataTables -->
    <link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">
    
    <!-- Font Awesome fonts for shopping-cart and eye-open -->
    <script src="https://use.fontawesome.com/c876ddf92c.js"></script>

    <!-- Custom styles for this template -->
    <link href="${css}/myapp.css" rel="stylesheet">

  </head>

  <body>
	<div class="wrapper">
    <!-- Navigation -->
    <%@include file="./shared/navbar.jsp" %>
    
    <!-- Page Content -->
    
    <div class="content mt-2">
    
    <!--Loading the home content -->
    <c:if test="${userClickHome == true }">
	<%@include file="home.jsp" %>
	</c:if>
	
	<!--Loading the About page -->
    <c:if test="${userClickAbout == true }">
	<%@include file="about.jsp" %>
	</c:if>
	
	<!--Loading the Contact page -->
    <c:if test="${userClickContact == true }">
	<%@include file="contact.jsp" %>
	</c:if>
	
	<!--Loading this page when user clicks all products or when user clicks category products -->
    <c:if test="${userClickAllProducts == true or userClickCategoryProducts == true}">
	<%@include file="listProducts.jsp" %>
	</c:if>
	
	<!--Loading the singleProduct page -->
    <c:if test="${userClickShowProduct == true }">
	<%@include file="singleProduct.jsp" %>
	</c:if>
	
	<!--Load this page when user clicks manage products-->
    <c:if test="${userClickManageProducts == true }">
	<%@include file="manageProducts.jsp" %>
	</c:if>
	
	</div>
	
    <!-- Footer -->
    <%@include file="./shared/footer.jsp" %>

    <!-- Bootstrap core JavaScript -->
    <script src="${js}/jquery.min.js"></script>
    <script src="${js}/bootstrap.bundle.min.js"></script>
    
     <!-- DataTable Plugin -->
     <script src="${js}/jquery.dataTables.js"></script>
     
     <!-- DataTable Bootstrap Sript -->
     <script src="${js}/dataTables.bootstrap4.js"></script>
    
    <!-- Self coded JavaScript -->
    <script src="${js}/myapp.js"></script>
	
	</div>
  </body>

</html>
