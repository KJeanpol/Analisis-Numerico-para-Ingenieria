function resultado= nr(func,w,tol)
    funcion=func;
    xk=calNewtonRaph(funcion,w);
    xk1=calNewtonRaph(funcion,xk);
    k=0;
    while (error(xk1,xk)>=tol)
        xk=calNewtonRaph(funcion,xk);
        xk1=calNewtonRaph(funcion,xk);
        k+=2;
    endwhile
    resultado=k
endfunction

function resultado = evaluar(funcion,varx)
    resultado= funcion(varx);
endfunction   
 
 function derivada= calDerivada(funcion)
    syms x;  
    derivada=diff(funcion,x);
endfunction 

function err=error(x1,x)
    err= (x1-x)/x1;
endfunction 


function newton=calNewtonRaph(funcion,w)
    syms x;
    f=inline(funcion);
    class(f)
    derivada=char(diff(funcion,x));
    class(derivada)
    df=inline(derivada);
    newton=w-(f(w)/df(w))
endfunction 