% -RK4-
%   
%       > Função que utiliza o Método de Runge-Kutta de Ordem 4 para
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
%       > y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4)*h, i=0,1,...n-1
%               y(1) = y0
%               h =(b-a)/n
%               t[a,b] com iteração h
%               phi=(k1+2*k2+2*k3+k4)
%                   k1=f(t,y(i))
%                   k2=f((t+0.5*h), (y(i)+0.5*h*k1))
%                   k3=f((t+0.5*h), (y(i)+0.5*h*k2))
%                   k4 =f((t+h),y(i)+k3*h);
%
%  29/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt
%               Licenciatura em Engenharia Informática
%               Análise Matemática II - Ano Letivo 2019/20 - ISEC

function y = RK4(f,a,b,n,y0)
    h    = (b-a)/n;
    i=0;
    y(1) = y0;
    
    for t=a:h:b
        i=i+1;
        k1=f(t,y(i));
        k2=f((t+0.5*h),(y(i)+0.5*h*k1));
        k3=f((t+0.5*h),(y(i)+0.5*h*k2));
        k4 =f((t+h),y(i)+k3*h);
        phi=(k1+2*k2+2*k3+k4);
        y(i+1)=y(i)+(1/6)*phi*h;
    end
end