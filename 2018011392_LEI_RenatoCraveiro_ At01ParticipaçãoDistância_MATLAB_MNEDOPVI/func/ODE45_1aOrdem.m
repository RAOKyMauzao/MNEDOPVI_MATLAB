% -ODE45_1aOrdem-
%   
%       > Função que utiliza o ODE45 do MATLAB para resolver a EDO/PVI
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
%       > [t,y] = ode45(f,t,y0);
%               h=(b-a)/n
%               y=y' pois a solução de y na ODE45 é dada em coluna e
%               queremos que seja devolvida em linha
%
%  29/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt

function y = ODE45_1aOrdem(f,a,b,n,y0)
    h    = (b-a)/n;
    t = a:h:b;
    
    [t,y] = ode45(f,t,y0);
    y=y';
end