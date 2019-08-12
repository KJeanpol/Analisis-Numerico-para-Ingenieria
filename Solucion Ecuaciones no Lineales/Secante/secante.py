# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt
import sympy

def evaluar(funcion,varx):
    x,y,z = sympy.symbols ('x y z')
    y=sympy.sympify(funcion).subs(x,varx)
    #print (float(y))
    return float(y)

def graficar(funcion,x0,x1,tol):
    x = range(x1, secante(funcion,x0,x1,tol))
    print(x)
    itera=range(0,secante(funcion,x0,x1,tol))
    plt.plot([evaluar(funcion,i) for i in itera],x,'ro')
    plt.plot([evaluar(funcion,i) for i in itera],x,label='Metodo de Secante')
    plt.legend()
    plt.xlabel('Iteraciones')
    plt.ylabel('| f(X) |')
    plt.show()

def error(x1,x):
    return (x1-x)/x1

def secante(funcion,xk0,xkn,tol):
    xk=calSecante(funcion,xk0,xkn)
    xk1=calSecante(funcion,xkn,xk)
    k=2
    while (error(xk1,xk)>=tol):  
        xk=calSecante(funcion,xk,xk1)
        xk1=calSecante(funcion,xk1,xk) 
        k+=2
    #print("xk1 es: " + str(xk1))
    #print(k)
    return k

def calSecante(funcion,xk,xk1):
    primera=evaluar(funcion,xk)
    segunda=evaluar(funcion,xk1)
    fraccion=(xk-xk1)/(primera-segunda)
    return float(xk-(fraccion)*(evaluar(funcion,xk)))


    
