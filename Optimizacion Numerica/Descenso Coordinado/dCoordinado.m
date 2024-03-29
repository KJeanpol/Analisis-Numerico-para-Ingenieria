#{
    Resuelve el problema de minimizacon para 
    funciones en varias variables por el metodo
    de Descenso Coordinado

    Devuelve el valor de la funcion dada, evaluada en el valor Xk
    encontrado en las K iteraciones necesarias.

    Par�metros:
    funcion -- Funcion dependiente de X, a c�lcular su ra�z
    x0      -- Valor inical X dado a resolver
    y0      -- Valor inical Y dado a resolver
    itera     -- Cantidad de iteraciones a resolver.
   
    Probado con: dCoordinado("((x-2)**2)+((y+3)**2)+x*y",1,1,9)
#}
function resultado = dCoordinado(funcion,x0,y0,itera)
    k=0;
    listaX=[];
    listaY=[];
    listaX=[listaX x0];
    listaY=[listaY y0];
    func=inline(funcion);
    while (k<itera)
        xk=argminX(getFXk(func,listaY(end)));
        listaX=[listaX xk];
        yk=argminY(getFYk(func,xk));
        listaY=[listaY yk];
        k+=1;
    endwhile
    resultado= func(listaX(end),listaY(end));
endfunction

function fxk = getFYk(funcion,x)
    fxk= evaluarX(funcion,x);
endfunction
    
function fyk = getFXk(funcion,x)
    fyk= evaluarY(funcion,x);
endfunction  

function resultado = evaluar(funcion,varx)  
    func=inline(funcion);
    resultado= func(varx);
endfunction   


function resultado = evaluarY(funcion,varx)  
    func=inline(funcion);
    resultado= func(x,varx);
endfunction   

function derivada = calDerivada(funcion,varx)     
    syms x;
    f=inline(funcion);
    derivada=char(diff(funcion,x));
 endfunction 
 
function sol=argminX(funcion)
    syms x;
    fdx=calDerivada(funcion);
    str1='==0';
    sol = solve((strcat(fdx,str1)),x);
endfunction

function sol = argminY(funcion)
    syms y;
    fdx=calDerivada(funcion);
    str1='==0';
    sol = solve((strcat(fdx,str1)),y);
endfunction