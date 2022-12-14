package com.svalero.amartinez.aa2.dao;

import com.svalero.amartinez.aa2.domain.Usuario;
import com.svalero.amartinez.aa2.exception.EmailAlreadyExistException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class UsuarioDao {
    private Connection connection;

    public UsuarioDao(Connection connection) {
        this.connection = connection;
    }

    public Optional<Usuario> login(String email, String contrasena) throws SQLException {
        String sql = "SELECT * FROM USUARIOS WHERE email = ? AND contrasena = ?";
        Usuario user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, contrasena);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = fromResultSet(resultSet);
        }

        return Optional.ofNullable(user);
    }

    public void add(Usuario user) throws SQLException, EmailAlreadyExistException {
        if (existsUser(user.getEmail()))
            throw new EmailAlreadyExistException();

        String sql = "INSERT INTO USUARIOS (nombre, contrasena, email, direccion) VALUES (?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getNombre());
        statement.setString(2, user.getContrasena());
        statement.setString(3, user.getEmail());
        statement.setString(4, user.getDireccion());
        statement.executeUpdate();
    }

    public boolean delete(String email) throws SQLException {
        String sql = "DELETE FROM USUARIOS WHERE email = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        int rows = statement.executeUpdate();
        return rows == 1;
    }

    public boolean modify(int idUsuario, Usuario user) throws SQLException {
        String sql = "UPDATE USUARIOS SET nombre = ?, contrasena = ?, email = ?, direccion = ? WHERE id_usuario = ?";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, user.getNombre());
        statement.setString(2, user.getContrasena());
        statement.setString(3, user.getEmail());
        statement.setString(4, user.getDireccion());
        statement.setInt(5, idUsuario);
        int rows = statement.executeUpdate();
        return rows == 1;
    }


    public ArrayList<Usuario> findAll() throws SQLException {
        String sql = "SELECT * FROM USUARIOS ORDER BY nombre";
        ArrayList<Usuario> users = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Usuario user = fromResultSet(resultSet);
            users.add(user);
        }

        return users;
    }

    public ArrayList<Usuario> findAll(String searchText) throws SQLException {
        String sql = "SELECT * FROM USUARIOS WHERE INSTR(nombre, ?) ORDER BY nombre";
        ArrayList<Usuario> users = new ArrayList<>();

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, searchText);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Usuario user = fromResultSet(resultSet);
            users.add(user);
        }

        return users;
    }

    public Optional<Usuario> findByUsuario(String email) throws SQLException {
        String sql = "SELECT * FROM USUARIOS WHERE email = ?";
        Usuario user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = fromResultSet(resultSet);
        }

        return Optional.ofNullable(user);
    }

    public Optional<Usuario> findById(int id) throws SQLException {
        String sql = "SELECT * FROM USUARIOS WHERE id_usuario = ?";
        Usuario user = null;

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            user = fromResultSet(resultSet);
        }

        return Optional.ofNullable(user);
    }

    private Usuario fromResultSet(ResultSet resultSet) throws SQLException {
        Usuario user = new Usuario();
        user.setIdUsuario(resultSet.getInt("id_usuario"));
        user.setContrasena(resultSet.getString("contrasena"));
        user.setNombre(resultSet.getString("nombre"));
        user.setEmail(resultSet.getString("email"));
        user.setDireccion(resultSet.getString("direccion"));
        return user;
    }

    private boolean existsUser(String email) throws SQLException {
        Optional<Usuario> user = findByUsuario(email);
        return user.isPresent();
    }
}
