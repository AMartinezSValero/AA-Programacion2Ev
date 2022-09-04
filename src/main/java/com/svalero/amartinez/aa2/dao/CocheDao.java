package com.svalero.amartinez.aa2.dao;

import com.svalero.amartinez.aa2.domain.Coche;
import com.svalero.amartinez.aa2.domain.Marca;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class CocheDao {

    private Connection connection;

    public CocheDao(Connection connection) {
        this.connection = connection;
    }

    public ArrayList<Coche> findAll(String searchText) throws SQLException {
        //TODO arreglar consulta
        String sql = "SELECT * FROM COCHES CO INNER JOIN MARCAS MA ON CO.id_marca = MA.id_marca WHERE lower(MA.nombre) LIKE ? OR lower(CO.modelo) LIKE ? ORDER BY nombre";
        ArrayList<Coche> coches = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, "%" + searchText + "%" );
        statement.setString(2, "%" + searchText + "%" );
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Coche coche = fromResultSet(resultSet);
            coches.add(coche);
        }

        return coches;
    }

    public ArrayList<Coche> findAllByBrand(int idMarca) throws SQLException {
        //TODO arreglar consulta
        String sql = "SELECT * FROM COCHES WHERE id_marca = ?";
        ArrayList<Coche> coches = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, idMarca);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Coche coche = fromResultSet(resultSet);
            coches.add(coche);
        }

        return coches;
    }

    private Coche fromResultSet(ResultSet resultSet) throws SQLException {
        Coche coche = new Coche();
        coche.setIdCoche(resultSet.getInt("id_coche"));
        coche.setModelo(resultSet.getString("modelo"));
        coche.setPotencia(resultSet.getDouble("potencia"));
        coche.setColor(resultSet.getString("color"));
        coche.setDescripcion(resultSet.getString("descripcion"));
        coche.setPrecio(resultSet.getDouble("precio"));
        MarcaDao marcaDao = new MarcaDao(connection);
        int idMarca = resultSet.getInt("id_marca");
        Marca marca = marcaDao.findById(idMarca).get();
        coche.setMarca(marca);
        return coche;

    }
    public Optional<Coche> findById(int id) throws SQLException {
        String sql = "SELECT * FROM COCHES WHERE id_coche = ?";
        Coche coche = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            coche = fromResultSet(resultSet);
        }

        return Optional.ofNullable(coche);
    }


}
