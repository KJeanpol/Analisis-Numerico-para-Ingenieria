#{
    Resuelve una ecuación no lineal mediante el método de Muller.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    y considerando tres aproximaciones iniciales.

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Primer valor inical dado a resolver
    x1      -- Segundo valor inical dado a resolver
    x2      -- Tercer valor inical dado a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    Probado con: Muller("(sin(x))-(x/2)",2,2.2,1.8,0.001)
#}
function resultado = Muller(funcion,x0,x1,x2,tol) 
  
    A=getA(funcion,x0,x1,x2);
    B=getB(funcion,x0,x1,x2);
    C=getC(funcion,x2);
    xr=x2;
    k=0;
    listaX=[];
    listaY=[];
    listaX=[listaX k];  
    listaY=[listaY x2];
    while (evaluar(funcion,xr)>=tol)  
        xr=getXk(A,B,C,x2);
        x0=x1;
        x1=x2;
        x2=xr ; 
        A=getA(funcion,x0,x1,x2);
        B=getB(funcion,x0,x1,x2);
        C=getC(funcion,x2);
        k+=1;
        listaX=[listaX k];  
        listaY=[listaY xr];
    endwhile
    resultado =(listaY(end-1));
endfunction

function A = getA(funcion,x0,x1,x2)
    numerador = (x1-x2)*(evaluar(funcion,x0)-evaluar(funcion,x2)) - (x0-x2)*(evaluar(funcion,x1)-evaluar(funcion,x2));
    denominador= round(((x0-x2)*(x1-x2)*(x0-x1)));
    if (abs(denominador)==0)
        A = 1;
    else
        A= ((numerador)/(denominador));
    endif
endfunction
    
function B = getB(funcion,x0,x1,x2)
    numerador = ((x0-x2)^2)*(evaluar(funcion,x1)-evaluar(funcion,x2)) - ((x1-x2)^2)*(evaluar(funcion,x0)-evaluar(funcion,x2));
    denominador= round(((x0-x2)*(x1-x2)*(x0-x1)));
    if (abs(denominador)==0)
        B = 1;
    else
        B = ((numerador)/(denominador));
    endif
endfunction

function C = getC(funcion,x2)
    C=evaluar(funcion,x2);
endfunction

function xk = getXk(A,B,C,x2)
    data=(B^2)-(4*A*C);
    raiz = B*(sqrt(abs(data)));
    xk= x2 - ((-2*C)/(B+raiz));
endfunction

function resultado = evaluar(funcion,varx)  
    func=inline(funcion);
    resultado= func(varx);
endfunction 