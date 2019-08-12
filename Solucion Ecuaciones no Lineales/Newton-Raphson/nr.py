import numpy as np
import matplotlib.pyplot as plt
import sympy

def evaluar(funcion,varx):
    x,y,z = sympy.symbols ('x y z')
    y=sympy.sympify(funcion).subs(x,varx)
    return float(y)

def graficar(funcion,x0,tol):
    x = range(x0, newtonRaph(funcion,x0,tol))
    itera=range(1,newtonRaph(funcion,x0,tol))
    plt.plot(x, [evaluar(funcion,i) for i in itera],'ro')
    plt.plot(x, [evaluar(funcion,i) for i in itera], label='Metodo de Newton-Raphson')
    plt.legend()
    plt.xlabel('Iteraciones')
    plt.ylabel('| f(X) |')
    plt.show()

def calDerivada(funcion):
    x,y,z = sympy.symbols ('x y z')
    y=sympy.sympify(funcion)
    return y.diff(x)

def error(x1,x):
    return (x1-x)/x1

def newtonRaph(funcion,x0,tol):
    xk=calNewtonRaph(funcion,x0)
    xk1=calNewtonRaph(funcion,xk)
    k=0
    while (error(xk1,xk)>=tol):  
        xk=calNewtonRaph(funcion,xk)
        xk1=calNewtonRaph(funcion,xk) 
        k+=2
    print("xk1 es: " + str(xk1))
    return k

def calNewtonRaph(funcion,x0):
    return x0-(evaluar(funcion,x0)/evaluar(calDerivada(funcion),x0))

    
