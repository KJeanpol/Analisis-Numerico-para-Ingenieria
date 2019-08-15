function resultado=secante(funcion,xk0,xkn,tol)
##    Resuelve una ecuación no lineal mediante el método de la Secante.
##
##    Devuelve el valor de la raíz más aproximada según la tolerancia dada
##    unos valores iniciales x0,x1
##
##    Parámetros:
##    funcion -- Funcion dependiente de X, a cálcular su raíz
##    x0      -- Primer valor inicial
##    x1      -- Segundo valor inicial
##    tol     -- Tolerancia miníma aceptada para encontrar la raíz
 
    xk=calSecante(funcion,xk0,xkn);
    xk1=calSecante(funcion,xkn,xk);
    k=2;
    while (error(xk1,xk)>=tol)
        xk=calSecante(funcion,xk,xk1);
        xk1=calSecante(funcion,xk1,xk);
        k+=2;
    endwhile
    #print("xk1 es: " + str(xk1))
    #print(k)
    resultado=xk1;
endfunction

function resultado=calSecante(funcion,xk,xk1)
##    Resuelve la ecuación para encontrar el valor X sub k, 
##    de las iteraciones según el método de la Secante
##
##    Devuelve el valor de X en una iteración especifica
##
##    Parámetros:
##    funcion   -- Funcion dependiente de X, a encontrar su valor
##    xk        -- Valor del X en la sucesión anterior
##    xk1       -- Valor del X en la sucesión tras anterior
  
    primera=evaluar(funcion,xk);
    segunda=evaluar(funcion,xk1);
    fraccion=(xk-xk1)/(primera-segunda);
    resultado=abs(xk-(fraccion)*(evaluar(funcion,xk)));
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
     
    func=inline(funcion);
    resultado= func(varx);
 endfunction   
 
function err= error(x1,x)
##    Formúla que da el error en el método de la Falsa Posicion
##
##    Devuelve el valor del error en una iteración específica del
##    método de la Falsa Posicion
##
##    Parámetros:
##    x1     -- Valor anterior de la iteración
##    x      -- Valor siguiente de la iteración
    
    err= (x1-x)/x1;
endfunction
