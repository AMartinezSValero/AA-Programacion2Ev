<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 04/09/2022
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="com.svalero.amartinez.aa2.domain.Usuario"

%>

<%
    Usuario currentUser = (Usuario) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html lang="en">
<!--"estilos bootstrap"-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="css/styles.css">
<script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">

<body>
<jsp:include page="header.jsp" />
<section class="contenedor">
    <h2>CarForum - The most beautiful car is the one that we still have to do</h2>

    <div class="card">
        <div class="card-header">
            Cars
        </div>
        <div class="card-body">
            <h5 class="card-title">Display all registered cars</h5>
            <p class="card-text">All your favorite cars from the most prestigious brands are available here to rate.</p>
            <a href="coches.jsp" class="btn btn-warning">See Cars</a>
        </div>
    </div>

    <div class="card">
        <div class="card-header">
            Brands
        </div>
        <div class="card-body">
            <h5 class="card-title">Display all available brands</h5>
            <p class="card-text">All your favorite car brands all around the world are available for you.</p>
            <a href="marcas.jsp" class="btn btn-warning">See brands</a>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
