% -AdamsBashforth-
%   
%       > Função que utiliza o método de Adams-Bashforth (método do passo 
%       múltiplo) para resolver a EDO/PVI
%       > Devolve a matriz com os valores obtidos nos pontos do intervalo
%       introduzido
%
% -INPUT:
%       > f (f(t,y)): função a resolver.
%       > a: extremo esquerdo do intervalo da variável independente t
%       (t[a,b]).
%       > b: extremo direito do intervalo da variável independente t
%       (t[a,b]).
%       > n: número de intervalos ou subintervalos do método.
%       > y0: condição inicial t=a -> y=y0.
%
% -OUTPUT:
%
%       > y: vetor das soluções obtidas da aproximação
%       
%       > h = (b-a)/n; t(1) = a; w(1) = y0;
%       > w(i+1) = w(i)+(k1+2.0*(k2+k3)+k4)/6.0, i=1,2,3
%           t(i+1) = t(i)+h;
%           k1 = h*f(t(i), w(i));
%           k2 = h*f(t(i)+0.5*h, w(i)+0.5*k1);
%           k3 = h*f(t(i)+0.5*h, w(i)+0.5*k2);
%           k4 = h*f(t(i+1), w(i)+k3);
%       > w(4) = w0;
%           w0 = w(4)+h*(part1)/24.0;
%               part1 = 9.0*f(t0,w0)+19.0*f(t(4),w(4))-5.0*f(t(3),w(3))+f(t(2),w(2));
%                   t0 = a+i*h;
%                   part1 = 55.0*f(t(4),w(4))-59.0*f(t(3),w(3))+37.0*f(t(2),w(2));
%                   part2 = -9.0*f(t(1),w(1));
%                   w0 = w(4)+h*(part1+part2)/24.0;
%                   i itera de 4 até n
%       > y=w
%
%  29/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt
function y= AdamsBashforth(f,a,b,n,y0)

 h = (b-a)/n;
 t(1) = a;
 w(1) = y0;

 for i = 1:3 
    t(i+1) = t(i)+h;
    k1 = h*f(t(i), w(i));
    k2 = h*f(t(i)+0.5*h, w(i)+0.5*k1);
    k3 = h*f(t(i)+0.5*h, w(i)+0.5*k2);
    k4 = h*f(t(i+1), w(i)+k3);
    w(i+1) = w(i)+(k1+2.0*(k2+k3)+k4)/6.0;
 end

 for i = 4:n 
    t0 = a+i*h;
    part1 = 55.0*f(t(4),w(4))-59.0*f(t(3),w(3))+37.0*f(t(2),w(2));
    part2 = -9.0*f(t(1),w(1));
    w0 = w(4)+h*(part1+part2)/24.0;
    part1 = 9.0*f(t0,w0)+19.0*f(t(4),w(4))-5.0*f(t(3),w(3))+f(t(2),w(2));
    w0 = w(4)+h*(part1)/24.0;
    for j = 1:3 
       t(j) = t(j+1);
       w(j) = w(j+1);
    end
    t(4) = t0;
    w(4) = w0;
 end
    y=w;
end