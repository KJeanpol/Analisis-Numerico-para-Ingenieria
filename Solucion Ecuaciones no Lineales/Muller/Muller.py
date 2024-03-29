import numpy as np
import matplotlib.pyplot as plt
import sympy
import math
import sys
sys.path.append('../../')
import general as g

def Muller(funcion,x0,x1,x2,tol):
    """Resuelve una ecuación no lineal mediante el método de Muller.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    y considerando tres aproximaciones iniciales.

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Primer valor inical dado a resolver
    x1      -- Segundo valor inical dado a resolver
    x2      -- Tercer valor inical dado a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    Probado con: Muller("(sin(x))-(x/2)",2,2.2,1.8,0.001)
    """   
    A=getA(funcion,x0,x1,x2)
    B=getB(funcion,x0,x1,x2)
    C=getC(funcion,x2)
    xr=x2
    k=0   #Corresponde a la iteración en que se encuentra
    listaX=[]
    listaY=[]
    listaX.append(k)
    listaY.append(x2)
    while (g.error(funcion,xr)>=tol):  
        xr=getXk(A,B,C,x2)
        x0=x1
        x1=x2
        x2=xr  
        A=getA(funcion,x0,x1,x2)
        B=getB(funcion,x0,x1,x2)
        C=getC(funcion,x2)  
        k+=1
        listaX.append(k)
        listaY.append(xr)
        print (A)
    g.imprimirResultado(listaX[-1],listaY[-1])
    return g.graficar(listaX,listaY,"Muller")

def getA(funcion,x0,x1,x2): 
    numerador = (x1-x2)*(g.evaluar(funcion,x0)-g.evaluar(funcion,x2)) - (x0-x2)*(g.evaluar(funcion,x1)-g.evaluar(funcion,x2))
    denominador= int((x0-x2)*(x1-x2)*(x0-x1))
    print("Prueba: " + str(denominador))
    if (abs(denominador)==0):
        return True
    else:
        return (float(numerador)/float(denominador))
    
def getB(funcion,x0,x1,x2):
    numerador = pow((x0-x2),2)*(g.evaluar(funcion,x1)-g.evaluar(funcion,x2)) - pow((x1-x2),2)*(g.evaluar(funcion,x0)-g.evaluar(funcion,x2))
    denominador= int((x0-x2)*(x1-x2)*(x0-x1))
    if (abs(denominador)==0):
        return True
    else:
        return (float(numerador)/float(denominador))

def getC(funcion,x2):
    return g.evaluar(funcion,x2)

def getXk(A,B,C,x2):
    data=pow(B,2)-(4*A*C)
    raiz = B*(math.sqrt(abs(data)))
    xk= x2 - ((-2*C)/(B+raiz))
    return xk