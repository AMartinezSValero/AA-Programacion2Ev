<%@ page import="com.svalero.amartinez.aa2.domain.Usuario" %>
<%@ page import="com.svalero.amartinez.aa2.dao.Database" %>
<%@ page import="com.svalero.amartinez.aa2.dao.CocheDao" %>
<%@ page import="com.svalero.amartinez.aa2.domain.Coche" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 04/09/2022
  Time: 22:23
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
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
    <h2>All available cars of this brand.</h2>

    <ul class="list-group">
        <%
            String marcaId = request.getParameter("id");

            Database database = new Database();
            CocheDao cocheDao = new CocheDao(database.getConnection());

            try {
                List<Coche> coches = cocheDao.findAllByBrand(Integer.parseInt(marcaId));
                for (Coche coche: coches) {
        %>

        <li class="list-group-item" style="width: 50% ! important">
            <a target="_blank" href="detalleCoche.jsp?idcoche=<%= coche.getIdCoche() %>"><%= coche.getModelo() %></a>

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
            }%>

    </ul>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
