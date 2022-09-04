package com.svalero.amartinez.aa2.servlet;

import com.svalero.amartinez.aa2.dao.Database;
import com.svalero.amartinez.aa2.dao.ValoracionDao;
import com.svalero.amartinez.aa2.domain.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/deletevaloracion")
public class DeleteValoracionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //Comprobar login usuario
        Usuario currentUser = (Usuario) request.getSession().getAttribute("currentUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
        }
        int idUsuario = Integer.parseInt(request.getParameter("idusuario"));
        int idCoche = Integer.parseInt(request.getParameter("idcoche"));
        Database database = new Database();
        ValoracionDao valoracionDao = new ValoracionDao(database.getConnection());
        try {
            valoracionDao.delete(idUsuario, idCoche);
            response.sendRedirect("index.jsp");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}
