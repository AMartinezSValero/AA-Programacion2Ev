<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.amartinez.aa2.dao.Database" %>
<%@ page import="com.svalero.amartinez.aa2.dao.CocheDao" %>
<%@ page import="com.svalero.amartinez.aa2.domain.Coche" %>
<%@ page import="com.svalero.amartinez.aa2.domain.Usuario" %>
<%@ page import="com.svalero.amartinez.aa2.dao.ValoracionDao" %>
<%@ page import="com.svalero.amartinez.aa2.domain.Valoracion" %>
<%@ page import="java.util.function.Supplier" %><%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 04/09/2022
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <link rel="stylesheet" href="css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/cc976dc165.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("editvaloracion", formValue, function(data) {
                if ($.trim(data) == "/CarForum/index.jsp") {
                    window.location.href = data;
                } else {
                    $("#result1").html(data);
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form2").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("addvaloracion", formValue, function(data) {
                if ($.trim(data) == "/CarForum/index.jsp") {
                    window.location.href = data;
                } else {
                    $("#result2").html(data);
                }
            });
        });
    });
</script>
<jsp:include page="header.jsp" />
<%
    int cocheID = Integer.parseInt(request.getParameter("idcoche"));
    Database db = new Database();
    CocheDao cocheDao = new CocheDao(db.getConnection());
    Coche coche;
    Usuario currentUser = (Usuario) session.getAttribute("currentUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
    }
    try {
        coche = cocheDao.findById(cocheID).get();

%>
<div class="container" style="margin-top: 20px ! important">

    <div class="col-sm-6" style="width:50% ! important; padding-bottom:20px ! important;">
        <div class="card text-center">
            <div class="card-header">
                <p><%= coche.getModelo()%> - <%= coche.getColor()%></p>
            </div>
            <div class="card-body">
                <h5 class="card-title"><%= coche.getMarca().getNombre()%></h5>
                <img src="logos/<%= coche.getMarca().getLogo() %>" class="card-img-top" class="card-img-top" alt="imagen" style="margin-bottom:20px ! important; width:310px ! important; height:230px ! important">
                <h6 class="card-text">Color: <p><%= coche.getColor()%></p></h6>
                <h6 class="card-text"><%= coche.getDescripcion() %></h6>
            </div>
        </div>
    </div>

    <%
        ValoracionDao valoracionDao = new ValoracionDao(db.getConnection());
        Valoracion valoracion = null;
        try {
            valoracion = valoracionDao.findById(cocheID, currentUser.getIdUsuario()).orElseThrow(new Supplier<Throwable>() {
                @Override
                public Throwable get() {
                    return new Exception();
                }
            });
    %>
</div>
<div class="container">
    <h2>Review</h2>
    <!-- Añadir aqui modify y delete -->
    <form id="form1">
        <div class="mb-2">
            <input name="review" type="text" class="form-control w-25" id="review" value="<% out.print(valoracion.getCantidadEstrellas()); %>">
            <input name="description" type="text" class="form-control w-25" id="description" value="<% out.print(valoracion.getDescripcion()); %>">
        </div>
        <input type="hidden" name="idUsuario" value="<%=currentUser.getIdUsuario()%>">
        <input type="hidden" name="idcoche" value="<%=cocheID%>">
        <!--button type="submit" class="btn btn-warning">Modify Review</button-->
    </form>
    <div id="result1"></div>

    <a href="deletevaloracion?idusuario=<%= currentUser.getIdUsuario()%>&idcoche=<%= cocheID%>" class="btn btn-danger">Delete review</a>
</div>
<%
} catch (Exception e) {

%>
<form id="form2">
    <div class="mb-2">
        <label for="newreview" class="form-label">Review:</label>
        <input name="newreview" type="text" class="form-control w-25" id="newreview" value="">
        <input name="newdescription" type="text" class="form-control w-25" id="newdescription" value="">
    </div>
    <input type="hidden" name="idusuario" value="<%=currentUser.getIdUsuario()%>">
    <input type="hidden" name="idcoche" value="<%=cocheID%>">
    <button type="submit" class="btn btn-warning">Create Review</button>
</form>
<div id="result2"></div>
<%
    }
%>
</div>
</div>
</div>
<%
} catch (SQLException sqle) {
%>
<div class='alert alert-danger' role='alert'>Something went wrong, please try again in a few minutes.</div>
<%
    }
%>
<jsp:include page="footer.jsp" />
</body>
</html>
