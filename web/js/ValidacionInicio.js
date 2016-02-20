/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

window.onload = revisar;

function revisionGeneral () {
    var correcto = true;
    var email = document.getElementById("email");
    if(!revisarEmail(email)){
        correcto=false;
        email.className='error';
    }
    if(correcto)
        document.getElementById("formInicio").submit();
    correcto=true;
    var email2 = document.getElementById("email2");
    if(!revisarEmail(email2)){
        correcto=false;
        email2.className='error';
    }
    if(correcto)
        document.getElementById("formInicio").submit();
    
}


function revisarEmail (email) {
    var ex = /\S+@\S+\.\S+/;
    if((!ex.test(email.value) || email.value===""))
        return false;
    else
        return true;
}

function revisar(){
    document.getElementById("btnEnviar").addEventListener("click", revisionGeneral, false);
    document.getElementById("btnEnviar2").addEventListener("click", revisionGeneral, false);
    var email = document.getElementById("email");
    email.oninput = function() {
        if(!revisarEmail(email)){
            email.className='error';
        }
        else
            email.className='boxes';
    }
    
    var email2 = document.getElementById("email2");
    email2.oninput = function() {
        if(!revisarEmail(email2)){
            email2.className='error';
        }
        else
            email2.className='boxes';
    }
    
}
