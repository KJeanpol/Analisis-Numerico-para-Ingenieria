#{
    Resuelve el problema de minimizacon para 
    funciones en varias variables por el metodo
    de Descenso Coordinado

    Devuelve el valor de la funcion dada, evaluada en el valor Xk
    encontrado en las K iteraciones necesarias.

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Valor inical X dado a resolver
    y0      -- Valor inical Y dado a resolver
    itera     -- Cantidad de iteraciones a resolver.
   
    Probado con: dCoordinado("((x-2)**2)+((y+3)**2)+x*y",1,1,9)
#}
function resultado = dCoordinado(funcion,x0,y0,itera)
    k=0
    listaX=[]
    listaY=[]
    listaX.append(x0)
    listaY.append(y0)
    func=sp.expand(funcion)
    while (k<itera):
        xk=argminX(getFXk(func,listaY[k]))
        listaX.append(xk)
        yk=argminY(getFYk(func,xk))
        listaY.append(yk)
        k+=1
    resultado= evaluarXY(func,listaX[k],listaY[k])
    return resultado
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