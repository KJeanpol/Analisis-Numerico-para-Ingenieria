import numpy as np
import matplotlib.pyplot as plt
import sympy

def biseccion(funcion,x0,x1,tol):
    
    """Resuelve una ecuación no lineal mediante el método de la Biseccion.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    en un intervalo [x0,x1]

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Primer valor del intervalo a resolver
    x1      -- Segundo valor del intervalo a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    """    
    xr=x0
    a=x0
    b=x1
    k=1
    if (evaluar(funcion,x0) * evaluar(funcion,x1) <0 ):
        while (error(a,b,k)>=tol):  
            xr=(x0+x1)/2
            if (evaluar(funcion,x0)*evaluar(funcion,xr)<0):
                x1=xr
            else:
                x0=xr
            k+=1
        return (x0+x1)/2
    else:
        return "No existe raíz"

def evaluar(funcion,varx):
    """Evalúa una función dependiente de X, dado un valor.

    Devuelve el valor de la función correspondiente, al susituir
    su variable independiente X, por un valor 

    Parámetros:
    funcion   -- Funcion dependiente de X, a encontrar su valor
    varx      -- Valor de la variable X, a sustituir en la función dada
   
    """    
    x,y,z = sympy.symbols ('x y z') #Define x,y,z como variables de una funcion
    y=sympy.sympify(funcion).subs(x,varx) #Evalua la funcion, indicado su variable y valor respectivo
    return float(y)

def error(a,b,k):
    
    """Formúla que da el error en el método de la Falsa Posicion

    Devuelve el valor del error en una iteración específica del
    método de la Falsa Posicion

    Parámetros:
    a     -- Primer valor del intervalo dado
    b     -- Segundo valor del intervalo dado
    k     -- Valor la iteración en la que se encuentra
   
    """ 
    
    return (b-a)/2**k

