package com.svalero.amartinez.aa2.dao;

import com.svalero.amartinez.aa2.domain.Coche;
import com.svalero.amartinez.aa2.domain.Usuario;
import com.svalero.amartinez.aa2.domain.Valoracion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Optional;

public class ValoracionDao {
    private Connection connection;

    public ValoracionDao(Connection connection) {
        this.connection = connection;
    }

    public void add(Date date, int cantidadEstrellas, String descripcion, int idUsuario, int idCoche) throws SQLException {
        String sql = "INSERT INTO VALORACIONES (fecha_valoracion, cantidad_estrellas, descripcion, id_coche, id_usuario) VALUES (?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setDate(1, new java.sql.Date(date.getTime()));
        statement.setInt(2, cantidadEstrellas);
        statement.setString(3, descripcion);
        statement.setInt(4, idCoche);
        statement.setInt(5, idUsuario);
        statement.executeUpdate();
    }
    public Optional<Valoracion> findById(int idCoche, int idUsuario) throws SQLException {
        String sql = "SELECT * FROM VALORACIONES WHERE id_coche = ? AND id_usuario = ?";
        Valoracion valoracion = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idCoche);
        statement.setInt(2, idUsuario);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            valoracion = fromResultSet(resultSet);
        }

        return Optional.ofNullable(valoracion);
    }

    public boolean delete(int idUsuario, int idCoche) throws SQLException {
        String sql = "DELETE FROM VALORACIONES WHERE id_usuario = ? AND id_coche = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idUsuario);
        statement.setInt(2, idCoche);
        int rows = statement.executeUpdate();
        return rows == 1;
    }

    private Valoracion fromResultSet(ResultSet resulset) throws SQLException {
        Valoracion valoracion = new Valoracion();

        valoracion.setFechaValoracion(resulset.getDate("fecha_valoracion"));
        valoracion.setCantidadEstrellas(resulset.getInt("cantidad_estrellas"));
        valoracion.setDescripcion(resulset.getString("descripcion"));

        CocheDao cocheDao = new CocheDao(connection);
        int idCoche = resulset.getInt("id_coche");
        Coche coche = cocheDao.findById(idCoche).get();
        valoracion.setCoche(coche);

        UsuarioDao usuarioDao = new UsuarioDao(connection);
        int idUsuario = resulset.getInt("id_usuario");
        Usuario usuario = usuarioDao.findById(idUsuario).get();
        valoracion.setUsuario(usuario);
        return valoracion;

    }
}
