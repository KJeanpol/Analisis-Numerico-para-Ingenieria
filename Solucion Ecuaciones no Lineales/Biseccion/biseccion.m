function resultado=biseccion(funcion,d,e,tol)
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
    func=inline(funcion);
    resultado= func(varx);
 endfunction   
 
function err= error(a,b,k)
    err=(b-a)/2**k;
endfunction
