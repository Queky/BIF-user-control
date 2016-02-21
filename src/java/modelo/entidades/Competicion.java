/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.entidades;
import java.util.Date;

/**
 *
 * @author joseba
 */
public class Competicion {
    
    private int id;
    private String nombre;
    private Date fechaFin;
    
    public Competicion(int id, String nombre,Date fechaFin){
        this.id = id;
        this.nombre = nombre;
        this.fechaFin = fechaFin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    
    
    
    
    
    
}
