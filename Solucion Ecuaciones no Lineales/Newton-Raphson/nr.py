import numpy as np
import matplotlib.pyplot as plt
import sympy


def graficar(funcion,x0,tol):
    """Gráfica de una ecuación no lineal mediante el método de Newton-Raphson.

    Devuelve una gráfica de iteraciones vs la función evaluada en X sub k,
    con k el número de iteraciones

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Valor inicial dado
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    """ 
    x = range(x0, newtonRaph(funcion,x0,tol))
    itera=range(1,newtonRaph(funcion,x0,tol))
    plt.plot(x, [evaluar(funcion,i) for i in itera],'ro')
    plt.plot(x, [evaluar(funcion,i) for i in itera], label='Metodo de Newton-Raphson')
    plt.legend()
    plt.xlabel('Iteraciones')
    plt.ylabel('| f(X) |')
    plt.show()


def newtonRaph(funcion,x0,tol):
    """Resuelve una ecuación no lineal mediante el método de Newton-Raphson.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    uno valor inicial x

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    x0      -- Valor inicial dado
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    """ 
    xk=calNewtonRaph(funcion,x0)
    xk1=calNewtonRaph(funcion,xk)
    k=0   #Corresponde a la iteración en que se encuentra
    while (error(xk1,xk)>=tol):  
        xk=calNewtonRaph(funcion,xk)
        xk1=calNewtonRaph(funcion,xk) 
        k+=2
    return k

def calNewtonRaph(funcion,x0):
    """Resuelve la ecuación para encontrar el valor X sub k, 
    de las iteraciones según el método de Newton-Raphson.

    Devuelve el valor de X en una iteración especifica

    Parámetros:
    funcion   -- Funcion dependiente de X, a encontrar su valor
    x0        -- Valor del X en la sucesión anterior
   
    """   
    return x0-(evaluar(funcion,x0)/evaluar(calDerivada(funcion),x0))

def error(x1,x):
    """Formúla que da el error en el método de la Falsa Posicion

    Devuelve el valor del error en una iteración específica del
    método de la Falsa Posicion

    Parámetros:
    x1     -- Valor anterior de la iteración
    x      -- Valor siguiente de la iteración
   
    """   
    return (x1-x)/x1

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

def calDerivada(funcion):
    """Determina la derivada de una función dependiente de X.

    Devuelve el valor de la función derivada respecto a X

    Parámetros:
    funcion   -- Funcion dependiente de X, a derivar
   
    """  
    x,y,z = sympy.symbols ('x y z')  #Define x,y,z como variables de una funcion
    y=sympy.sympify(funcion) #Convierte el string funcion, a tipo Fucnion
    return y.diff(x)   #diff= utilizado para derivar la funcion, respecto a X
