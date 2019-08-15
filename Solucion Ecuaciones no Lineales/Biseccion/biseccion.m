function resultado=biseccion(funcion,d,e,tol)
##    Resuelve una ecuaci�n no lineal mediante el m�todo de la Biseccion.
##
##    Devuelve el valor de la ra�z m�s aproximada seg�n la tolerancia dada
##    en un intervalo [x0,x1]
##
##    Par�metros:
##    funcion -- Funcion dependiente de X, a c�lcular su ra�z
##    x0      -- Primer valor del intervalo a resolver
##    x1      -- Segundo valor del intervalo a resolver
##    tol     -- Tolerancia min�ma aceptada para encontrar la ra�z
##   
    xr=d;
    a=d;
    b=e;
    k=1;
    if (evaluar(funcion,d) * evaluar(funcion,e) <0 )
        while (error(a,b,k)>=tol)
            xr=(d+e)/2
            if (evaluar(funcion,d)*evaluar(funcion,xr)<0)
                e=xr
            else
                d=xr
            endif
            k+=1;
        endwhile 
        resultado =(d+e)/2
        
    else
        resultado= "No existe ra�z"
    endif
endfunction

function resultado = evaluar(funcion,varx)
##    Eval�a una funci�n dependiente de X, dado un valor.
##
##    Devuelve el valor de la funci�n correspondiente, al susituir
##    su variable independiente X, por un valor 
##
##    Par�metros:
##    funcion   -- Funcion dependiente de X, a encontrar su valor
##    varx      -- Valor de la variable X, a sustituir en la funci�n dada
##        

    func=inline(funcion);
    resultado= func(varx);
 endfunction   
 
function err= error(a,b,k)
##    Form�la que da el error en el m�todo de Bisecci�n
##
##    Devuelve el valor del error en una iteraci�n espec�fica del
##    m�todo de la Falsa Posicion
##
##    Par�metros:
##    a     -- Primer valor del intervalo dado
##    b     -- Segundo valor del intervalo dado
##    k     -- Valor la iteraci�n en la que se encuentra
  
    err=(b-a)/2**k;
endfunction
