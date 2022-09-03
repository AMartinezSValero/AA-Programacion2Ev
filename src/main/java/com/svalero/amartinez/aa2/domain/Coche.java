package com.svalero.amartinez.aa2.domain;

public class Coche {

    private int idCoche;
    private String modelo;
    private double potencia;
    private String color;
    private String descripcion;
    private double precio;
    private Marca marca;

    public Coche() {
    }

    public Coche(String modelo, double potencia, String color, String descripcion, double precio, Marca marca) {
        this.modelo = modelo;
        this.potencia = potencia;
        this.color = color;
        this.descripcion = descripcion;
        this.precio = precio;
        this.marca = marca;
    }

    public int getIdCoche() {
        return idCoche;
    }

    public void setIdCoche(int idCoche) {
        this.idCoche = idCoche;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public double getPotencia() {
        return potencia;
    }

    public void setPotencia(double potencia) {
        this.potencia = potencia;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }
}
