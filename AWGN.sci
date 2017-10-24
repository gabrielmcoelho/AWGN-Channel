function cicloSTD(num)
    // 2-PAM
    
    // Gerando uma fonte de informação com igual probabilidade de 0 e 1
    g = round(rand(1,num));
    // Modulação em banda-base (0->-1 ; 1->+1)
    for i=1:num
        if g(i) == 1 then
            x1(i) = 1;
        else
            x1(i) = -1;
        end
    end
    x1 = x1';
    // Gerando um vetor de amostras de um processo ruidoso gaussiano branco
    t = 1:num;
    noise1 = rand(t, "normal");
    // calculando a Energia do sinal por número de símbolos
    Es_Ns = sum(x1.^2)/num;
    // calculando o vetor de amostras do sinal ruidoso, y, e o vetor xHat
    SNR1 = [-3:10];
    for i=1:14
        erros = 0;
        var = sqrt(0.5 *(10^(-SNR1(i)/10))*Es_Ns);
        y = x1 + var.*noise1;
        for j=1:num
            if y(j)<0 then
                x1Hat(j) = -1
            else
                x1Hat(j) = 1;
            end
            
            if x1Hat(j) ~= x1(j) then
                erros = erros + 1;
            end
        end
        Pe1(i) = erros/num;
    end
    // Plotagem dos gráficos
     xtitle( '', 'Es/N0[dB]', 'SER', '' ) ;
    // teórico
        Es_N0_dB = [-3:10];
        SER_teorica_PAM = (0.5)*erfc(sqrt(10.^(Es_N0_dB/10)));
        //plot2d(Es_N0_dB, SER_teorica_PAM, logflag = 'nl', style=1);
    // computacional
        plot2d(SNR1, Pe1, 2, logflag = 'nl');
    
    
    
    // 4-PAM
    
    // Modulação em banda-base (00->-3 ; 01->-1 ; 11->+1; 10->+3)
    aux = 1;
    for i=1:2:num-1
        if g(i) == 0 & g(i+1) == 0 then
            x2(aux) = -3;
        elseif g(i) == 0 & g(i+1) == 1 then
            x2(aux) = -1;
        elseif g(i) == 1 & g(i+1) == 1 then
            x2(aux) = 1;
        else
            x2(aux) = 3;
        end
        aux = aux+1;
    end
    x2 = x2';
    // Gerando um vetor de amostras de um processo ruidoso gaussiano branco
    t = 1:num/2;
    noise2 = rand(t, "normal");
    // calculando a Energia do sinal por número de símbolos
    Es_Ns = sum(x2.^2)/(num/2);
    // calculando o vetor de amostras do sinal ruidoso, y, e o vetor xHat
    SNR2 = [-3:17];
    for i=1:21
        erros = 0;
        var = sqrt(0.5 *(10^(-SNR2(i)/10))*Es_Ns);
        y2 = x2 + var.*noise2;
        for j=1:num/2
            if y2(j)<-2 then
                x2Hat(j) = -3;
            elseif y2(j)<0 then
                x2Hat(j) = -1;
            elseif y2(j)<2 then
                x2Hat(j) = 1;
            else
                x2Hat(j) = 3;
            end
            
            if x2Hat(j) ~= x2(j) then
                erros = erros + 1;
            end
        end
        Pe2(i) = erros/(num/2);
    end
    // Plotagem dos gráficos
    // teórico
        M = 4;
        Es_N0_dB = [-3:17];
        Es_N0 = 10.^(Es_N0_dB/10)
        Ps = 2*((M-1)/M)*0.5 *erfc(sqrt((6/(M^2-1))*Es_N0) / sqrt(2));
        //plot2d(Es_N0_dB,Ps,logflag='nl',style=1);
    // computacional
        plot2d(SNR2,Pe2,21,logflag='nl');
        
    
    
    // 8-PAM
    
    // Modulação em banda-base (000->-7 ; 001->-5 ; 010->-3; 011->-1 ; 100->+1 ; 101->+3 ; 110->+5 ; 111->+7)
    aux = 1;
    for i=1:3:num-2
        if g(i) == 0 & g(i+1) == 0 & g(i+2) == 0 then
            x3(aux) = -7;
        elseif g(i) == 0 & g(i+1) == 0 & g(i+2) == 1 then
            x3(aux) = -5;
        elseif g(i) == 0 & g(i+1) == 1 & g(i+2) == 0 then
            x3(aux) = -3;
        elseif g(i) == 0 & g(i+1) == 1 & g(i+2) == 1 then
            x3(aux) = -1;
        elseif g(i) == 1 & g(i+1) == 0 & g(i+2) == 0 then
            x3(aux) = 1;
        elseif g(i) == 1 & g(i+1) == 0 & g(i+2) == 1 then
            x3(aux) = 3;
        elseif g(i) == 1 & g(i+1) == 1 & g(i+2) == 0 then
            x3(aux) = 5;
        else
            x3(aux) = 7;
        end
        aux = aux + 1;
    end
    x3 = x3';
    // Gerando um vetor de amostras de um processo ruidoso gaussiano branco
    t = 1:num/3;
    noise3 = rand(t, "normal");
    // calculando a Energia do sinal por número de símbolos
    Es_Ns = sum(x3.^2)/(num/3);
    // calculando o vetor de amostras do sinal ruidoso, y, e o vetor xHat
    SNR3 = [-3:20];
    for i=1:24
        erros = 0;
        var = sqrt(0.5 *(10^(-SNR3(i)/10))*Es_Ns);
        y3 = x3 + var.*noise3;
        for j=1:num/3
            if y3(j)<-6 then
                x3Hat(j) = -7;
            elseif y3(j)<-4 then
                x3Hat(j) = -5;
            elseif y3(j)<-2 then
                x3Hat(j) = -3;
            elseif y3(j)<0 then
                x3Hat(j) = -1;
            elseif y3(j)<2 then
                x3Hat(j) = 1;
            elseif y3(j)<4 then
                x3Hat(j) = 3;
            elseif y3(j)<6 then
                x3Hat(j) = 5;
            else
                x3Hat(j) = 7
            end
            
            if x3Hat(j) ~= x3(j) then
                erros = erros + 1;
            end
        end
        Pe3(i) = erros/(num/3);
    end
    // Plotagem dos gráficos
    // teórico
        M = 8;
        Es_N0_dB = [-3:20];
        Es_N0 = 10.^(Es_N0_dB/10)
        Ps = 2*((M-1)/M)*0.5 *erfc(sqrt((6/(M^2-1))*Es_N0) / sqrt(2));
        //plot2d(Es_N0_dB,Ps,logflag='nl',style=1);
    // computacional
        plot2d(SNR3,Pe3,7,logflag='nl');
        hl=legend(['2-PAM';'4-PAM';'8-PAM'], pos=3);
endfunction
