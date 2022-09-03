package com.svalero.amartinez.aa2.domain;

public class Usuario {

    private int idUsuario;

    private String nombre;

    private String contrasena;

    private String email;

    private  String direccion;

    public Usuario() {
    }

    public Usuario(String nombre, String contrasena, String email, String direccion) {
        this.nombre = nombre;
        this.contrasena = contrasena;
        this.email = email;
        this.direccion = direccion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
}
