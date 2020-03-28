% -NEuler_v2-
%   
%       > Função que utiliza o Método de Euler para resolver a EDO/PVI
%       > Devolve a matriz com os valores obtidos nos pontos do intervalo
%       introduzido
%       > VERSÃO MELHORADA/MODIFICADA
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
%       > y(i+1)=y(i)+h*f(t(i),y(i)) , i =0,1,...,n-1
%               h=(b-a)/n
%               y(1)=y0
%
%  29/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt

function y = NEuler_v2(f,a,b,n,y0)
    h    = (b-a)/n;
    t = a:h:b;
    y = zeros(1,n+1);
    y(1) = y0;
    for i=1:n
        y(i+1)=y(i)+h*f(t(i),y(i));
    end
end

