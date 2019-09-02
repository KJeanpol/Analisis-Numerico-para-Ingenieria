#{
    Resuelve una ecuación no lineal mediante el método del Punto Fijo.

    Devuelve el valor de la raíz más aproximada según la tolerancia dada
    y el valor inicial especificado

    Parámetros:
    funcion -- Funcion dependiente de X, a cálcular su raíz
    funciong -- Es el parametro funcion, despejada
    x0      -- Valor inical dado a resolver
    tol     -- Tolerancia miníma aceptada para encontrar la raíz
   
    Probado con: puntoFijo("(sin(x)-x)","(sin(x))",2,0.001)
#}

function aprox = puntoFijo(f,g,x0,tol)
  aprox = 0;
  func = inline(f);
  gfunc = inline(g);
  pkg load symbolic;
  syms x;
  dg = diff(g, x);
  x = x0;
  if(abs(eval(dg))<1)
    while(abs(func(x))>tol)
      x = gfunc(x);
    endwhile
    aprox = x;
  else
    display('"El metodo no converge con la funcion g(x) dada"');
  endif
endfunction