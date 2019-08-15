function resultado= nr(func,w,tol)
##    Resuelve una ecuación no lineal mediante el método de Newton-Raphson.
##
##    Devuelve el valor de la raíz más aproximada según la tolerancia dada
##    uno valor inicial x
##
##    Parámetros:
##    funcion -- Funcion dependiente de X, a cálcular su raíz
##    x0      -- Valor inicial dado
##    tol     -- Tolerancia miníma aceptada para encontrar la raíz
 
    funcion=func;
    xk=calNewtonRaph(funcion,w);
    xk1=calNewtonRaph(funcion,xk);
    k=0;
    while (error(xk1,xk)>=tol)
        xk=calNewtonRaph(funcion,xk);
        xk1=calNewtonRaph(funcion,xk);
        k+=2;
    endwhile
    resultado=xk1;
endfunction

function err=error(x1,x)
##    Formúla que da el error en el método de la Falsa Posicion
##
##    Devuelve el valor del error en una iteración específica del
##    método de la Falsa Posicion
##
##    Parámetros:
##    x1     -- Valor anterior de la iteración
##    x      -- Valor siguiente de la iteración
##    
    err= (x1-x)/x1;
endfunction 

function newton=calNewtonRaph(funcion,w)
##    Resuelve la ecuación para encontrar el valor X sub k, 
##    de las iteraciones según el método de Newton-Raphson.
##
##    Devuelve el valor de X en una iteración especifica
##
##    Parámetros:
##    funcion   -- Funcion dependiente de X, a encontrar su valor
##    x0        -- Valor del X en la sucesión anterior
  
    syms x;
    f=inline(funcion);
    derivada=char(diff(funcion,x));
    df=inline(derivada);
    newton=w-(f(w)/df(w));
endfunction 