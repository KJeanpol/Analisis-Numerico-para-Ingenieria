def serieTaylor(error):
    m= cantTerminos(error)
    aprox=valorIntegral(m)
    print ("Numero de terminos de la serie que aproxima la integral: " + str(m) +"\n")
    print ("Aproximacion de la Integral: "+ str(aprox))
    return 0

def cantTerminos(tol):
    m=0
    tolAux=tolerancia(m)
    while (tolAux>=tol):
        m+=1
        tolAux=tolerancia(m)
    return m

def tolerancia (m):
    numerador=pow(2,(m+1))
    denominador=factorial(m+1)*(2*(m+1)+1)
    tolAux=numerador/denominador
    return tolAux

def factorial (num):
    result=1
    while (num>1):
        result*=num
        num-=1
    return result
    
def valorIntegral(n):
    sumatoria=0
    resultado=0
    while(sumatoria<=n):  
        numerador= (pow(-1,n))*(pow(2,n))
        denominador= factorial(n)*(2*n+1)   
        resultado+= numerador/denominador
        n-=1
    return resultado
