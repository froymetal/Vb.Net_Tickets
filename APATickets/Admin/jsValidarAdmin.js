function CaracterPermitido(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz.0123456789@,?";

    if (letras.indexOf(tecla) == -1 && key != 13) {
        return false;
    }
}

function SoloNumeros(evt) {
    //asignamos el valor de la tecla a keynum
    if (window.event) {// IE
        keynum = evt.keyCode;
    } else {
        keynum = evt.which;
    }
    //comprobamos si se encuentra en el rango
    if ((keynum > 47 && keynum < 58) || keynum == 46 || keynum == 40 || keynum == 41) {
        return true;
    } else {
        return false;
    }

}

function SoloEmail(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = "abcdefghijklmnopqrstuvwxyz.0123456789@";
    especiales = "37-39-46";

    tecla_especial = false
    for (var i in especiales) {
        if (key == especiales[i]) {
            tecla_especial = true;
            break;
        }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) {
        return false;
    }
}



function pop_window() {
    window.open('Ofertas_Laborales_Fuera.asp', 'popup', 'width=700, height=600, top=150, left=280, menubar=0, scrollbars=1, location=0, toolbar=0,  resizable=0, status=0');
}