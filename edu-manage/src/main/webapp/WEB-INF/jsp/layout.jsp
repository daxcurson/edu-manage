<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edu-Manage</title>
<!-- Estilos para todo el sistema -->
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet">
<link type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.css" rel="stylesheet">

<!-- Scripts para todo el sistema -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js"></script>

<!-- Incluyo estilos para paginas que los definan especificamente -->
    <tiles:insertAttribute name="styles"/>
<!-- Incluyo scripts para paginas que los definan especificamente -->
    <tiles:insertAttribute name="scripts"/>
  </head>

  <body>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
    <tiles:insertAttribute name="menu"/>
    </nav>

	<tiles:insertAttribute name="flash"/>

    <div class="container" role="main">
    <tiles:insertAttribute name="content"/>
    </div>
  </body>
</html>