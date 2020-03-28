% -Interface_Texto-
%   
%       > Interface de texto para executar funções para resolução de EDO/PVI
%       > Executam-se na Command Window
%
% -INPUT:
%       > opcao: usado para identificar a função a utilizar, enviando um número
%       como forma de diferenciação entre as funções. quando igual a 7 pára a 
%       execução do programa.
%
%  28/03/2020 - Renato Craveiro (2018011392) .: a21280286@isec.pt
%               Licenciatura em Engenharia Informática
%               Análise Matemática II - Ano Letivo 2019/20 - ISEC

function interface_texto
    clc;
    clear;
    respondeu=false;    %usada para controlar se o utilizador deseja sair (true) 
                        %ou não (false)
    while(~respondeu)
        clc
        disp("Escolha a operação a realizar:");
        disp("");
        disp("1-Euler com alocação de memória");
        disp("2-Euler melhorado"); 
        disp("3-Range Kutta de Ordem 2");
        disp("4-Range Kutta de Ordem 4");
        disp("5-ODE45");
        disp("6-Adams Bashforth (Outro método)");
        disp("7-Sair");
        opcao=input('R.: ');            
        
        if(opcao==7)    
           respondeu=true;
           return 
        else
           if(opcao>0 && opcao<7)
               cd func/   %muda de diretório para o que contém as funções
               textoFncEscolhida(opcao); %envia a opção desejada para a função que obtém os dados
               cd ../     %volta para o diretório da função principal
               
           else           %caso o utilizador não escolha opção entre 1-7 volta a perguntar pela opção
                disp('Opção não implementada!');
                input('Prima <Enter> para continuar');
           end
           
        end        
    end    
end