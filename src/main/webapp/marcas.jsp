<%@ page import="com.svalero.amartinez.aa2.domain.Usuario" %>
<%@ page import="com.svalero.amartinez.aa2.dao.Database" %>
<%@ page import="com.svalero.amartinez.aa2.dao.MarcaDao" %>
<%@ page import="com.svalero.amartinez.aa2.domain.Marca" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 04/09/2022
  Time: 21:22
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
<div class="container" style="text-align:center ! important">
    <h3>Navigate between the brands to choose the car you wanna rate.</h3>
    <%
        Database database = new Database();
        MarcaDao marcaDao = new MarcaDao(database.getConnection());
        try {
            List<Marca> marcas = marcaDao.findAll();
            for (Marca marca: marcas) {
    %>

    <div class="col-sm-6" style="width:33% ! important; padding-bottom:20px ! important; margin:0 auto ! important">
        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title"><%= marca.getNombre() %></h5>
                <img src="logos/<%= marca.getLogo() %>" class="card-img-top"  class="card-img-top" alt="imagen" style="margin-bottom:20px ! important; width:310px ! important; height:230px ! important">
                <h6 class="card-text"><%= marca.getDescripcion()  %></h6>
                <a href="marcasDetalle.jsp?id=<%= marca.getIdMarca() %>" class="btn btn-warning">See Cars</a>
            </div>
        </div>
    </div>
    <%
        }
    } catch (SQLException sqle) {
    %>
    <div class="alert alert-danger" role="alert">
        Something went wrong, please try again in a few minutes.
    </div>
    <%
        }
    %>
    </ul>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
