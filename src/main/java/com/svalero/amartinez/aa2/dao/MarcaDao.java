package com.svalero.amartinez.aa2.dao;

import com.svalero.amartinez.aa2.domain.Marca;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MarcaDao {
    private Connection connection;

    public MarcaDao(Connection connection) {
        this.connection = connection;
    }

    public void add(Marca marca) throws SQLException {

        String sql = "INSERT INTO MARCAS (nombre, descripcion, logo, direccion) VALUES (?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, marca.getNombre());
        statement.setString(2, marca.getDescripcion());
        statement.setString(3, marca.getLogo());
        statement.setString(4, marca.getDireccionSede());
        statement.executeUpdate();
    }

    public List<Marca> findAll() throws SQLException {
        String sql = "SELECT * FROM MARCAS ORDER BY nombre";
        ArrayList<Marca> marcas = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Marca marca = fromResultSet(resultSet);
            marcas.add(marca);
        }

        return marcas;
    }
    public ArrayList<Marca> findAll(String searchText) throws SQLException {
        String sql = "SELECT * FROM MARCAS WHERE INSTR(nombre, ?) ORDER BY nombre";
        ArrayList<Marca> marcas = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, searchText);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Marca marca = fromResultSet(resultSet);
            marcas.add(marca);
        }

        return marcas;
    }

    public Optional<Marca> findById(int id) throws SQLException {
        String sql = "SELECT * FROM MARCAS WHERE id_marca = ?";
        Marca marcas = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            marcas = fromResultSet(resultSet);
        }

        return Optional.ofNullable(marcas);
    }


    private Marca fromResultSet(ResultSet resultSet) throws SQLException {
        Marca marca = new Marca();
        marca.setIdMarca(resultSet.getInt("id_marca"));
        marca.setNombre(resultSet.getString("nombre"));
        marca.setDescripcion(resultSet.getString("descripcion"));
        marca.setLogo(resultSet.getString("logo"));
        marca.setDireccionSede(resultSet.getString("direccion"));
        return marca;
    }
}
