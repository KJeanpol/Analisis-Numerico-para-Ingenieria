function resultado=secante(funcion,xk0,xkn,tol)
##    Resuelve una ecuaci�n no lineal mediante el m�todo de la Secante.
##
##    Devuelve el valor de la ra�z m�s aproximada seg�n la tolerancia dada
##    unos valores iniciales x0,x1
##
##    Par�metros:
##    funcion -- Funcion dependiente de X, a c�lcular su ra�z
##    x0      -- Primer valor inicial
##    x1      -- Segundo valor inicial
##    tol     -- Tolerancia min�ma aceptada para encontrar la ra�z
 
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
##    Resuelve la ecuaci�n para encontrar el valor X sub k, 
##    de las iteraciones seg�n el m�todo de la Secante
##
##    Devuelve el valor de X en una iteraci�n especifica
##
##    Par�metros:
##    funcion   -- Funcion dependiente de X, a encontrar su valor
##    xk        -- Valor del X en la sucesi�n anterior
##    xk1       -- Valor del X en la sucesi�n tras anterior
  
    primera=evaluar(funcion,xk);
    segunda=evaluar(funcion,xk1);
    fraccion=(xk-xk1)/(primera-segunda);
    resultado=abs(xk-(fraccion)*(evaluar(funcion,xk)));
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
     
    func=inline(funcion);
    resultado= func(varx);
 endfunction   
 
function err= error(x1,x)
##    Form�la que da el error en el m�todo de la Falsa Posicion
##
##    Devuelve el valor del error en una iteraci�n espec�fica del
##    m�todo de la Falsa Posicion
##
##    Par�metros:
##    x1     -- Valor anterior de la iteraci�n
##    x      -- Valor siguiente de la iteraci�n
    
    err= (x1-x)/x1;
endfunction
