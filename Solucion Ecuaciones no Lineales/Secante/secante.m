function resultado=secante(funcion,xk0,xkn,tol)
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
    primera=evaluar(funcion,xk);
    segunda=evaluar(funcion,xk1);
    fraccion=(xk-xk1)/(primera-segunda);
    resultado=abs(xk-(fraccion)*(evaluar(funcion,xk)));
endfunction

function resultado = evaluar(funcion,varx)
    func=inline(funcion);
    resultado= func(varx);
 endfunction   
 
function err= error(x1,x)
    err= (x1-x)/x1;
endfunction
