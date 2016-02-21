/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.listas;

import java.util.ArrayList;
import modelo.entidades.Competicion;

/**
 *
 * @author joseba
 */
public class ListaCompeticiones {
    
    private ArrayList<Competicion> competiciones;
    
    public ListaCompeticiones(){
        competiciones = new ArrayList<Competicion>();
    }

    public ArrayList<Competicion> getCompeticiones() {
        return competiciones;
    }

    public void setCompeticiones(ArrayList<Competicion> competiciones) {
        this.competiciones = competiciones;
    }
    
    public void añadirCompeticion(Competicion cm)
    {
        getCompeticiones().add(cm);
    }
    
    public int tamanioLista(){
        return getCompeticiones().size();
    }
    
    
}
