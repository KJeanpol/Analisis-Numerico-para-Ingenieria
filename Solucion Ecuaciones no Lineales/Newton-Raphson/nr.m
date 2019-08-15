function resultado= nr(func,w,tol)
##    Resuelve una ecuaci�n no lineal mediante el m�todo de Newton-Raphson.
##
##    Devuelve el valor de la ra�z m�s aproximada seg�n la tolerancia dada
##    uno valor inicial x
##
##    Par�metros:
##    funcion -- Funcion dependiente de X, a c�lcular su ra�z
##    x0      -- Valor inicial dado
##    tol     -- Tolerancia min�ma aceptada para encontrar la ra�z
 
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
##    Form�la que da el error en el m�todo de la Falsa Posicion
##
##    Devuelve el valor del error en una iteraci�n espec�fica del
##    m�todo de la Falsa Posicion
##
##    Par�metros:
##    x1     -- Valor anterior de la iteraci�n
##    x      -- Valor siguiente de la iteraci�n
##    
    err= (x1-x)/x1;
endfunction 

function newton=calNewtonRaph(funcion,w)
##    Resuelve la ecuaci�n para encontrar el valor X sub k, 
##    de las iteraciones seg�n el m�todo de Newton-Raphson.
##
##    Devuelve el valor de X en una iteraci�n especifica
##
##    Par�metros:
##    funcion   -- Funcion dependiente de X, a encontrar su valor
##    x0        -- Valor del X en la sucesi�n anterior
  
    syms x;
    f=inline(funcion);
    derivada=char(diff(funcion,x));
    df=inline(derivada);
    newton=w-(f(w)/df(w));
endfunction 