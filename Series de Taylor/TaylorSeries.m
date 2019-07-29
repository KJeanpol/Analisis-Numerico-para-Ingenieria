function aprox = TaylorSeries(error)
  m= cantTerminos(error)
  aprox=valorIntegral(m)
endfunction

function result = factorial(num)
  result=1;
  while (num>1)
    result=result*num;
    num=num-1;
  endwhile
endfunction

function tolAux = tolerancia(m)
  numerador=2**(m+1);
  denominador=factorial(m+1)*(2*(m+1)+1);
  tolAux=numerador/denominador;
endfunction

function resultado = valorIntegral(n)
  sumatoria=0;
  resultado=0;
  while(sumatoria<=n)
    val=(-1)**n;
    numerador= val*(2**n);
    denominador= factorial(n)*(2*n+1); 
    resultado+= numerador/denominador;
    n-=1;
  endwhile
endfunction


function m = cantTerminos(tol)
    m=0;
    tolAux=tolerancia(m);
    while (tolAux>=tol)
        m+=1;
        tolAux=tolerancia(m);
  endwhile
endfunction


