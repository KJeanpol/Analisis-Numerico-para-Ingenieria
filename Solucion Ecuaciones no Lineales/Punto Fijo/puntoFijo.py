import sys
sys.path.append('../../')
import general as g


def puntofijo(funcion,funciong,x0,tol):
    """Resuelve una ecuación no lineal mediante el método del Punto Fijo.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    y el valor inicial especificado

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    funciong -- Es el parametro funcion, despejada
    x0      -- Valor inical dado a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    Probado con: puntofijo("(sin(x)-x)","(sin(x))",2,0.001)
    """   
    xk=x0
    if((abs(g.evaluar(g.calDerivada(funciong),xk)))<1):
        while(abs(g.evaluar(funcion,xk))>tol):
            xk=g.evaluar(funciong,xk)
        return xk
    else:
        print ("El metodo no converge con la funcion g(x) dada")