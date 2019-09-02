import sympy as sp
import sys
sys.path.append('../../')
import general as g

def dCoordinado(funcion,x0,y0,itera):
    """Resuelve el problema de minimizacion para 
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
    """ 
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
    resultado= g.evaluarXY(func,listaX[k],listaY[k])
    return resultado

def getFYk(funcion,x):
    fxk= g.evaluarX(funcion,x)
    return fxk
    
def getFXk(funcion,x):
    fyk= g.evaluarY(funcion,x)
    return fyk   