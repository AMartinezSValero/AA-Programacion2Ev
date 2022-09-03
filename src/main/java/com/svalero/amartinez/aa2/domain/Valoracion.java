package com.svalero.amartinez.aa2.domain;

import java.util.Date;

public class Valoracion {

    private int cantidadEstrellas;
    private Date fechaValoracion;
    private String descripcion;
    private Usuario usuario;
    private Coche coche;

    public Valoracion() {
    }

    public Valoracion(int cantidadEstrellas, Date fechaValoracion, String descripcion, Usuario usuario, Coche coche) {
        this.cantidadEstrellas = cantidadEstrellas;
        this.fechaValoracion = fechaValoracion;
        this.descripcion = descripcion;
        this.usuario = usuario;
        this.coche = coche;
    }

    public Valoracion(Usuario usuario, Coche coche) {
        this.usuario = usuario;
        this.coche = coche;
    }

    public int getCantidadEstrellas() {
        return cantidadEstrellas;
    }

    public void setCantidadEstrellas(int cantidadEstrellas) {
        this.cantidadEstrellas = cantidadEstrellas;
    }

    public Date getFechaValoracion() {
        return fechaValoracion;
    }

    public void setFechaValoracion(Date fechaValoracion) {
        this.fechaValoracion = fechaValoracion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Coche getCoche() {
        return coche;
    }

    public void setCoche(Coche coche) {
        this.coche = coche;
    }
}
