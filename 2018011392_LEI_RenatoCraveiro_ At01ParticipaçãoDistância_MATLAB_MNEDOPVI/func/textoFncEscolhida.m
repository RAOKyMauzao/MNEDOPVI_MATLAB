% -TextoFncEscolhida(opc)-
%   
%       > Pergunta pela função e dados pretendidos e chama a função resolvente  
%       correta conforme a opção escolhida em 'interface_texto'
%       > Verifica se a função realmente é uma função e se os dados são
%       valores escalares/numéricos
%       > Faz uma solução exata da EDO/PVI apresentada e calcula o erro
%       > Apresenta os dados da função resolvente pretendida, da solução exata 
%       e do erro no intervalo pedido em forma de tabela
%       > Apresenta um gráfico que compara a solução exata com a solução da
%       função resolvente pretendida
%
% -INPUT:
%
%       > opc: recebe este valor para poder identificar qual a função resolvente 
%       que deve executar. NÃO EXECUTA E APRESENTA ERRO SEM RECEBER ESTE VALOR.
%
%       > strF (f(t,y)): string da função a resolver. Caso não seja função 
%       em t e/ou y apresenta um erro e pede este valor novamente
%       > a: extremo esquerdo do intervalo da variável independente t
%       (t[a,b]). Caso não seja valor numérico apresentará um erro e pedirá
%       o valor novamente.
%       > b: extremo direito do intervalo da variável independente t
%       (t[a,b]). Caso não seja valor numérico maior que a apresentará um 
%       erro e pedirá o valor novamente.
%       > n: número de intervalos ou subintervalos do método. Caso não seja 
%       valor numérico apresentará um erro e pedirá o valor novamente.
%       > y0: condição inicial t=a -> y=y0. Caso não seja valor numérico 
%       apresentará um erro e pedirá o valor novamente.
%
% -OUTPUT:
%
%       > t: matriz com os valores do intervalo entre a e b com passo h
%       (h=(b-a)/n)).
%       > y_Selec: matriz com os valores obtidos através da função
%       resolvente pretendida (indicada por opc) nos pontos do intervalo t.
%       > yExata: matriz com os valores exatos da PVI nos pontos do
%       intervalo t.
%       > erro: matriz com os erros calculados através da diferença entre
%       os valores em y_Selec e yExata nos pontos do intervalo t.
%       > s_fSelec: string com o nome da função resolvente pretendida.
%       
%       > Apresenta os dados da função resolvente pretendida, da solução exata 
%       e do erro no intervalo pedido em forma de tabela
%       > Apresenta um gráfico que compara a solução exata com a solução da
%       função resolvente pretendida
%
%
%  28/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt
%               Licenciatura em Engenharia Informática
%               Análise Matemática II - Ano Letivo 2019/20 - ISEC

function textoFncEscolhida(opc)
    try
        opc;
    catch me
        errordlg('ERRO: Inicie esta função com a opção pretendida!','ERRO!','modal');
        return;
    end
    
    clc
    while 1
        strF=input('f(t,y) = ', 's');
        f=@(t,y) eval(vectorize(strF));
        try
            syms t y;
            fTeste=f(t,y);
            break;
        catch me
            errordlg('Por favor insira uma função em t e y','ERRO: função não correta'...
                ,'modal');
        end
    end
    
    while 1
        a=str2num(input('a = ','s'));
        if (isscalar(a))
            break
        else
            errordlg('Introduza um número real!','ERRO: nº não real',...
                'modal');
        end
    end
    
    while 1
        b=str2num(input('b = ', 's'));
        if (isscalar(b) && isreal(b) && b > a)
            break;
        else
            errordlg('Introduza um número real b com b maior que a',...
                     'ERRO: nº não real/não maior que "a"','modal');
        end
    end
    
    while 1
        n=str2num(input('n = ','s'));
        if(isscalar(n))
            break;
        else
            errordlg('Insira um número real!', 'ERRO: nº não real!','modal');
        end
    end
    
    while 1
        y0=str2num(input('y0 = ','s'));
        if(isscalar(y0))
            break;
        else
            errordlg('Insira um número real!', 'ERRO: nº não real!','modal');
        end
    end
    
    switch opc
        case 1
            y_Selec = NEuler(f,a,b,n,y0);
            s_fSelec = 'Euler (beta)';    
        case 2
            y_Selec = NEuler_v2(f,a,b,n,y0);
            s_fSelec = 'Euler (melhorado)'; 
        case 3
            y_Selec=RK2(f,a,b,n,y0);
            s_fSelec='RK2';            
        case 4
            y_Selec=RK4(f,a,b,n,y0);
            s_fSelec='RK4';
        case 5
            y_Selec=ODE45_1aOrdem(f,a,b,n,y0);
            s_fSelec='ODE45';
        case 6
             y_Selec=AdamsBashforth(f,a,b,n,y0);
             s_fSelec='AdamsBashforth';
        otherwise
            disp('Opção não implementada');
            input('Prima <Enter> para continuar');
            return;
    end
    
    sExata=dsolve(['Dy=', strF],...
                        ['y(',num2str(a),')=',num2str(y0)]);
    g=@(t) eval(vectorize(char(sExata)));
    h=(b-a)/n;
    t=a:h:b;
    yExata=g(t);

    erro=abs(yExata-y_Selec(1:n+1));
    tabela=[t.', y_Selec(1:n+1).', yExata.', erro.'];


    disp('<Solução do PVI numa tabela de valores>')
    texto=['       t   |   ',s_fSelec,'   |   Exata   |  Erro'];
    disp(texto);
    disp('');
    disp(tabela)
    disp('');
    input('Prima <Enter> para continuar');
    disp('');
    disp('<Solução em modo gráfico>');
    plot(t,y_Selec(1:n+1),'-r');
    hold on
    hold on
    plot(t,yExata, 'b')
    hold off
    grid on;
    legend(s_fSelec,'Exata');
    texto=[s_fSelec,' vs. Exata']
    title(texto);
    shg;
    disp('');
    input('Prima <Enter> para continuar');
    return;
end