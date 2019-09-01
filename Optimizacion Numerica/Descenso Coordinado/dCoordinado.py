import numpy as np
import matplotlib.pyplot as plt
from sympy import symbols, Eq, solve
import sympy as sp
import sys
sys.path.append('../../')
import general as g

    
def arg(funcion):
    prueba=g.argminY(sp.expand(funcion))
    print(prueba)
    
def getFYk(funcion,x):
    fxk= g.evaluarX(funcion,x)
    return fxk
    
def getFXk(funcion,x):
    fyk= g.evaluarY(funcion,x)
    return fyk   

def dCoordinado(funcion,x0,y0,itera):
    k=0
    listaX=[]
    listaY=[]
    listaX.append(x0)
    listaY.append(y0)
    func=sp.expand(funcion)
    while (k<itera):
        xk=g.argminX(getFXk(func,listaY[k]))
        listaX.append(xk)
        yk=g.argminY(getFYk(func,xk))
        listaY.append(yk)
        k+=1
    print([listaX,listaY])
    resultado= g.evaluarXY(func,listaX[k],listaY[k])
    return resultado