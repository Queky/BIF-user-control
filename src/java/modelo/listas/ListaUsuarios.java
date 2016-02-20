/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.listas;

import java.util.ArrayList;
import modelo.entidades.Usuario;

/**
 *
 * @author joseba
 */
public class ListaUsuarios {
    private ArrayList<Usuario> usuarios;
    
    
    public ListaUsuarios(){
<<<<<<< HEAD
        usuarios = new ArrayList<>();
=======
        usuarios = new ArrayList<Usuario>();
        
>>>>>>> origin/joseba
    }

    public ArrayList<Usuario> getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(ArrayList<Usuario> usuarios) {
        this.usuarios = usuarios;
    }
    
    public void añadirUsuario (Usuario usuario){
        usuarios.add(usuario);
    }
    
    
}
