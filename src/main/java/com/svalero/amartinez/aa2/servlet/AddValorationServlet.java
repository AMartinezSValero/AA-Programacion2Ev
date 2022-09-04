package com.svalero.amartinez.aa2.servlet;

import com.svalero.amartinez.aa2.dao.Database;
import com.svalero.amartinez.aa2.dao.ValoracionDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/addvaloracion")
public class AddValorationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int cantidadEstrellas = Integer.parseInt(request.getParameter("newreview"));
        String descripcion = request.getParameter("newdescription");
        Date date = new Date(System.currentTimeMillis());
        int idUsuario = Integer.parseInt(request.getParameter("idusuario"));
        int idCoche = Integer.parseInt(request.getParameter("idcoche"));
        System.out.println("pasa por aqui");

        Database database = new Database();
        ValoracionDao valDao = new ValoracionDao(database.getConnection());
        try {
            valDao.add(date, cantidadEstrellas, descripcion, idUsuario, idCoche);
            out.println("/CarForum/index.jsp");
        } catch (SQLException sqle) {
            out.println("<br><div class='alert alert-danger' role='alert'>Something wrong happened. Please check again in a few minutes.</div>");
            sqle.printStackTrace();
        }
    }
}
