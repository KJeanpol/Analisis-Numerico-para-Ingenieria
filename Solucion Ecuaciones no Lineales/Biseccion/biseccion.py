import numpy as np
import matplotlib.pyplot as plt
import sympy


def evaluar(funcion,varx):
    x,y,z = sympy.symbols ('x y z')
    y=sympy.sympify(funcion).subs(x,varx)
    return float(y)

def error(a,b,k):
    return (b-a)/2**k

def biseccion(funcion,x0,x1,tol):
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
    
def graficar(funcion,a,b,iteraciones):
    x = range(a, b)
    itera=range(1,iteraciones)
    plt.plot(x, [evaluar(funcion,i) for i in itera], label='Metodo de Biseccion')
    plt.legend()
    plt.xlabel('Iteraciones')
    plt.ylabel('| f(X) |')
    plt.show()