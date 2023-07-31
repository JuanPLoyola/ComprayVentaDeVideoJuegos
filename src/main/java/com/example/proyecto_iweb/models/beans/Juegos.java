package com.example.proyecto_iweb.models.beans;

import com.mysql.cj.jdbc.Blob;

import java.io.InputStream;

public class Juegos {

     private int idJuegos;
     private String nombre;
     private String descripcion;
     private double precio;
     private double descuento;
     private int stock;
     private String foto;
     private boolean habilitado;
     private boolean existente;
     private String consola;
     private String genero;


    /* --------------------------------------- SE AÑADIO ESTO --------------------------------------- */

    private String fotoJuego;
    private int idAdminEncargado;

    public String getFotoJuego() {
        return fotoJuego;
    }

    public void setFotoJuego(String fotoJuego) {
        this.fotoJuego = fotoJuego;
    }

    public int getIdAdminEncargado() {
        return idAdminEncargado;
    }

    public void setIdAdminEncargado(int idAdminEncargado) {
        this.idAdminEncargado = idAdminEncargado;
    }

    /* ---------------------------------------------------------------------------------------------------------------*/


    public int getIdJuegos() {
        return idJuegos;
    }

    public void setIdJuegos(int idJuegos) {
        this.idJuegos = idJuegos;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public boolean isHabilitado() {
        return habilitado;
    }

    public void setHabilitado(boolean habilitado) {
        this.habilitado = habilitado;
    }

    public boolean isExistente() {
        return existente;
    }

    public void setExistente(boolean existente) {
        this.existente = existente;
    }

    public String getConsola() {
        return consola;
    }

    public void setConsola(String consola) {
        this.consola = consola;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
}
