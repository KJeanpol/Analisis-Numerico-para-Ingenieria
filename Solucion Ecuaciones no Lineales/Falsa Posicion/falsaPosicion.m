function resultado=falsaPosicion(funcion,x0,x1,tol)
    xr=x0;
    k=1;
    if (evaluar(funcion,x0) * evaluar(funcion,x1) <0 )
        while (error(xr,x0)>=tol) 
            xr=calSecante(funcion,x1,x0)
            if (evaluar(funcion,x0)*evaluar(funcion,xr)<0)
                x1=xr;
            else
                x0=xr;
            endif
            k+=1   ;
        endwhile   
        resultado=calSecante(funcion,x1,x0);
    else
        resultado= "No existe raíz"
    endif
 endfunction  

function resultado = evaluar(funcion,varx)
    func=inline(funcion);
    resultado= func(varx);
 endfunction   

function err=error(x1,x)
    err=(x1-x)/x1;
endfunction

function secante=calSecante(funcion,xk,xk1)
    primera=evaluar(funcion,xk);
    segunda=evaluar(funcion,xk1);
    fraccion=(xk-xk1)/(primera-segunda);
    secante=abs(xk-(fraccion)*(evaluar(funcion,xk)));
 endfunction  
