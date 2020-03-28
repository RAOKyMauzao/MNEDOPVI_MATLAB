% -RK2-
%   
%       > Função que utiliza o Método de Runge-Kutta de Ordem 2 para
%       resolver a EDO/PVI
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
%       > y(i+1)=y(i)+h*phi, i=0,1,...,n-1 
%               y(1) = y0
%               h =(b-a)/n
%               t[a,b] com iteração h
%               phi=0.5*k1+0.5*k2
%                   k1=f(t,y(i)) // k2=f(t+h, y(i)+h*k1)
%
%  28/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt
%               Licenciatura em Engenharia Informática
%               Análise Matemática II - Ano Letivo 2019/20 - ISEC

function y = RK2(f,a,b,n,y0)
    h    = (b-a)/n;
    i=0;
    y(1) = y0;
    
    for t= a:h:b
        i=i+1;
        k1=f(t,y(i));
        k2=f(t+h,y(i)+h*k1);
        phi=0.5*k1+0.5*k2;
        y(i+1)=y(i)+h*phi;
    end
end