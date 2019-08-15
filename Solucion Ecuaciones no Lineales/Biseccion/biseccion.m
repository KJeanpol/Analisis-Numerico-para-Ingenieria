function resultado=biseccion(funcion,d,e,tol)
##    Resuelve una ecuación no lineal mediante el método de la Biseccion.
##
##    Devuelve el valor de la raíz más aproximada según la tolerancia dada
##    en un intervalo [x0,x1]
##
##    Parámetros:
##    funcion -- Funcion dependiente de X, a cálcular su raíz
##    x0      -- Primer valor del intervalo a resolver
##    x1      -- Segundo valor del intervalo a resolver
##    tol     -- Tolerancia miníma aceptada para encontrar la raíz
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
        resultado= "No existe raíz"
    endif
endfunction

function resultado = evaluar(funcion,varx)
##    Evalúa una función dependiente de X, dado un valor.
##
##    Devuelve el valor de la función correspondiente, al susituir
##    su variable independiente X, por un valor 
##
##    Parámetros:
##    funcion   -- Funcion dependiente de X, a encontrar su valor
##    varx      -- Valor de la variable X, a sustituir en la función dada
##        

    func=inline(funcion);
    resultado= func(varx);
 endfunction   
 
function err= error(a,b,k)
##    Formúla que da el error en el método de Bisección
##
##    Devuelve el valor del error en una iteración específica del
##    método de la Falsa Posicion
##
##    Parámetros:
##    a     -- Primer valor del intervalo dado
##    b     -- Segundo valor del intervalo dado
##    k     -- Valor la iteración en la que se encuentra
  
    err=(b-a)/2**k;
endfunction
