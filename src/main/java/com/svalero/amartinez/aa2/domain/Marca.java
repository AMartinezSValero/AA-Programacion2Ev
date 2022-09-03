package com.svalero.amartinez.aa2.domain;

public class Marca {

    private int idMarca;
    private String nombre;
    private String descripcion;
    private String logo;
    private String direccionSede;

    public Marca() {
    }

    public Marca(String nombre, String descripcion, String logo, String direccionSede) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.logo = logo;
        this.direccionSede = direccionSede;
    }

    public int getIdMarca() {
        return idMarca;
    }

    public void setIdMarca(int idMarca) {
        this.idMarca = idMarca;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDireccionSede() {
        return direccionSede;
    }

    public void setDireccionSede(String direccionSede) {
        this.direccionSede = direccionSede;
    }
}
