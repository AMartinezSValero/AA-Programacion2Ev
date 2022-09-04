<%@ page import="com.svalero.amartinez.aa2.domain.Usuario" %>
<%@ page import="com.svalero.amartinez.aa2.dao.Database" %>
<%@ page import="com.svalero.amartinez.aa2.dao.CocheDao" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.svalero.amartinez.aa2.domain.Coche" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 04/09/2022
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%
  Usuario currentUser = (Usuario) session.getAttribute("currentUser");
  if (currentUser == null) {
    response.sendRedirect("login.jsp");
  }
%>

<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="css/ada.css">
  <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
  <h2>All available cars currently on the forum.</h2>

  <!-- Buscador de coches -->
  <div class="container-fluid" style="margin:0 auto; margin-bottom:30px ! important">
    <form class="d-flex" method="post" action="coches.jsp">
      <input class="form-control me-2" name="searchtext" id="searchtext" type="search" placeholder="Buscar coches por nombre, color..." aria-label="Search">
      <a class="btn btn-warning" type="submit">Search</a>
    </form>
  </div>
  <div class="row">

    <ul class="list-group">
      <%
        String searchText = request.getParameter("searchtext");
        searchText = StringUtils.lowerCase(searchText);

        Database database = new Database();
        CocheDao cocheDao = new CocheDao(database.getConnection());

        // Si no hay nada en el buscador, acceder a la bbdd y recuperar todos los coches
        if (searchText == null) {
          try {
            List<Coche> coches = cocheDao.findAll();
            for (Coche coche: coches) {
      %>
      <!--TODO arreglar listado-->
      <li class="list-group-item" style="width: 50% ! important">
        <a target="_blank" href="coche.jsp?idcoche=<%= coche.getIdCoche() %>"><%= coche.getModelo() %></a>
        <p><%= coche.getMarca().getNombre() %> - <%= coche.getColor() %> | <%= coche.getPrecio() %> </p>
      </li>
      <%
        }
      } catch (SQLException sqle) {
      %>
      <div class="alert alert-danger" role="alert">
        Something went wrong, please try again in a few minutes.
      </div>
      <%
        }
      } else {

        // Acceder a la bbdd y recuperar todos los coches filtrados por buscador
        try {
          List<Coche> coches = cocheDao.findAll(searchText);
          for (Coche coche: coches) {
      %>
      <li class="list-group-item" style="width: 50% ! important">
        <a target="_blank" href="coche.jsp?idcoche=<%= coche.getIdCoche() %>"><%= coche.getModelo() %></a>
        <p><%= coche.getMarca().getNombre() %> - <%= coche.getColor() %> | <%= coche.getPrecio() %> </p>
      </li>
      <%
        }
      } catch (SQLException sqle) {
      %>
      <div class="alert alert-danger" role="alert">
        Something went wrong, please try again in a few minutes.
      </div>
      <%
          }
        }
      %>
    </ul>
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
