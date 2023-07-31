package com.example.proyecto_iweb.models.dtos;

import com.example.proyecto_iweb.models.beans.Cuentas;
import com.example.proyecto_iweb.models.beans.Estados;
import com.example.proyecto_iweb.models.beans.Juegos;

import java.sql.Date;

public class Raiting {
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

    private int idCompra;
    private int idUsuario;
    private int idJuego;
    private int cantidad;
    private Date fechaCompra;
    private String direccion;
    private int idAdmin;
    private Estados estados;
    private int idEstados;
    private Juegos juegos;
    private double precioCompra;
    private Cuentas usuario;
    private Cuentas admin;
    private String fotoJuego;

    private Date fechaEntrega;
    private int raiting;

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public int getRaiting() {
        return raiting;
    }

    public void setRaiting(int raiting) {
        this.raiting = raiting;
    }

    public String getFotoJuego() {
        return fotoJuego;
    }

    public void setFotoJuego(String fotoJuego) {
        this.fotoJuego = fotoJuego;
    }
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

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(int idJuego) {
        this.idJuego = idJuego;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public Estados getEstados() {
        return estados;
    }

    public void setEstados(Estados estados) {
        this.estados = estados;
    }

    public int getIdEstados() {
        return idEstados;
    }

    public void setIdEstados(int idEstados) {
        this.idEstados = idEstados;
    }

    public Juegos getJuegos() {
        return juegos;
    }

    public void setJuegos(Juegos juegos) {
        this.juegos = juegos;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public Cuentas getUsuario() {
        return usuario;
    }

    public void setUsuario(Cuentas usuario) {
        this.usuario = usuario;
    }

    public Cuentas getAdmin() {
        return admin;
    }

    public void setAdmin(Cuentas admin) {
        this.admin = admin;
    }
}
