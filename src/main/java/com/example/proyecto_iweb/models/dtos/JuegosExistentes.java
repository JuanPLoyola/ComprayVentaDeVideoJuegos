package com.example.proyecto_iweb.models.dtos;

public class JuegosExistentes {
    private int idVenta;
    private int idJuego;
    private String nombre;
    private double precioVenta;
    private int stock;
    private int cant_ventas;
    private String fotojuego;

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getCant_ventas() {
        return cant_ventas;
    }

    public void setCant_ventas(int cant_ventas) {
        this.cant_ventas = cant_ventas;
    }

    public String getFotojuego() {
        return fotojuego;
    }

    public void setFotojuego(String fotojuego) {
        this.fotojuego = fotojuego;
    }
}
