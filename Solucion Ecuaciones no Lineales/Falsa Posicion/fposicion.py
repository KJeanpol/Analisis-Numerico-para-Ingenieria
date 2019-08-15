import numpy as np
import matplotlib.pyplot as plt
import sympy


def falsaPosicion(funcion,x0,x1,tol):
    xr=x0
    k=1
    if (evaluar(funcion,x0) * evaluar(funcion,x1) <0 ):
        while (error(xr,x0)>=tol):  
            
            xr=calSecante(funcion,x1,x0)
            print("xr: "+ str(xr))
            if (evaluar(funcion,x0)*evaluar(funcion,xr)<0):
                x1=xr
            else:
                x0=xr
            k+=1      
        return calSecante(funcion,x1,x0)
    else:
        return "No existe raíz"


def evaluar(funcion,varx):
    x,y,z = sympy.symbols ('x y z')
    y=sympy.sympify(funcion).subs(x,varx)
    #print (float(y))
    return float(y)

def error(x1,x):
    return (x1-x)/x1

def calSecante(funcion,xk,xk1):
    primera=evaluar(funcion,xk)
    segunda=evaluar(funcion,xk1)
    fraccion=(xk-xk1)/(primera-segunda)
    resultado=float(xk-(fraccion)*(evaluar(funcion,xk)))
    return resultado


