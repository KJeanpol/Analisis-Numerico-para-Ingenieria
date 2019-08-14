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
    resultado=xk1;
endfunction

function err=error(x1,x)
    err= (x1-x)/x1;
endfunction 

function newton=calNewtonRaph(funcion,w)
    syms x;
    f=inline(funcion);
    derivada=char(diff(funcion,x));
    df=inline(derivada);
    newton=w-(f(w)/df(w));
endfunction 