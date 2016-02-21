/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    
    $('.bajar').on('click',function(){
        $('.desplegable').fadeIn();
    });
    $('#disponibles').on('click',function(){
        $('.desplegable').fadeOut();
    });
    $('#asistidas').on('click',function(){
        $('.desplegable').fadeOut();
    });
    $('#salir').on('click',function(){
        $('.desplegable').fadeOut();
    });
    
});


