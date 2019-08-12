# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
import sympy

variable = list()
def evaluar(funcion,varx):
    x,y,z = sympy.symbols ('x y z')
    y=sympy.sympify(funcion).subs(x,varx)
    #print (float(y))
    return float(y)

def graficar(funcion,x0,x1,tol):
    iteraciones=secante(funcion,x0,x1,tol)
    var=0
    x=list()
    y=list()
    while (var<iteraciones):
        x.append(var)
        var= var+1

    plt.plot(x,variable,'ro')
    plt.plot(x,variable,label='Metodo de Secante')
    plt.legend()
    plt.xlabel('Iteraciones')
    plt.ylabel('| f(X) |')
    plt.show()

def error(x1,x):
    return (x1-x)/x1

def puntofijo(funcion,x0,tol):
    xk=x0
    i=5
    while(i>0):
        xk=evaluar(funcion,xk)
        i-=1
        print (xk)
    return xk

