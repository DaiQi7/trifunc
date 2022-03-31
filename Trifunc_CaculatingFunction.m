mysin60=MySin(3*pi/2);
mycos60=MyCos(2*pi);
myarctan1=MyArctan(0.9);
mytan60=MyTan(pi/3);
myarcsin=MyArcsin(0.8);

%% sin���������뻡�ȣ����Ϊ1e-10���޴�����ʾ,R��
function y=MySin(radian)  
    i=1;
     %% ȡ����־
    Negation=1;
     %% ÿ�����ʽȡֵ
    Polynomial=1;
     %% ����ʽָ��
    Index=radian;
     %% ����ʽ�׳�
    Factorial=1;
     %% ̩��չ��ʽ���
    TaylorExpansion=radian;
     %% ����־
    ErrorSymbol=1;
    
while ErrorSymbol>0
         %% �׳˸���
         Factorial=Factorial*(i+1)*(i+2);
         %% x�η�����
         Index=Index*radian*radian;
         %% ����ʽ�����Ÿ���
         Negation=-Negation;
         %% ����ʽȡֵ����
         Polynomial=Index/Factorial*Negation;
         %% ̩�����
         TaylorExpansion=TaylorExpansion+Polynomial;
         
         i=i+2;
         %% ����ʽֵȡ����ֵ
         if Polynomial>0
            ErrorSymbol=Polynomial;
         else
            ErrorSymbol=-Polynomial; 
         end
         %% ����ж�
         if ErrorSymbol>1e-10
            ErrorSymbol=1;
         else
            ErrorSymbol=0; 
         end
end
     y=TaylorExpansion;
end

%% cos���������뻡�ȣ����Ϊ1e-10���޴�����ʾ,R��
function y=MyCos(radian)  
    i=0;
     %% ȡ����־
    Negation=1;
     %% ÿ�����ʽȡֵ
    Polynomial=1;
     %% ����ʽָ��
    Index=1;
     %% ����ʽ�׳�
    Factorial=1;
     %% ̩��չ��ʽ���
    TaylorExpansion=1;
     %% ����־
    ErrorSymbol=1;

while ErrorSymbol>0
         %% �׳˸���
         Factorial=Factorial*(i+1)*(i+2);
         %% x�η�����
         Index=Index*radian*radian;
         %% ����ʽ�����Ÿ���
         Negation=-Negation;
         %% ����ʽȡֵ����
         Polynomial=Index/Factorial*Negation;
         %% ̩�����
         TaylorExpansion=TaylorExpansion+Polynomial;
         
         i=i+2;
         %% ����ʽֵȡ����ֵ
         if Polynomial>0
            ErrorSymbol=Polynomial;
         else
            ErrorSymbol=-Polynomial; 
         end
         %% ����ж�
         if ErrorSymbol>1e-10
            ErrorSymbol=1;
         else
            ErrorSymbol=0; 
         end
     y=TaylorExpansion;
end
end

%% arctan����������Ƕȣ����Ϊ1e-10���޴�����ʾ��ȡֵ��Χ(-1 - 1)��
function y=MyArctan(radian)  
    i=1;
     %% ȡ����־
    Negation=1;
     %% ÿ�����ʽȡֵ
    Polynomial=1;
     %% ����ʽָ��
    Index=radian;
     %% ����ʽ�׳�
    Factorial=1;
     %% ̩��չ��ʽ���
    TaylorExpansion=radian;
     %% ����־
    ErrorSymbol=1;

while ErrorSymbol>0
         %% �׳˸���
         Factorial=2*i+1;
         %% x�η�����
         Index=Index*radian*radian;
         %% ����ʽ�����Ÿ���
         Negation=-Negation;
         %% ����ʽȡֵ����
         Polynomial=Index/Factorial*Negation;
         %% ̩�����
         TaylorExpansion=TaylorExpansion+Polynomial;
         
         i=i+1;
         %% ����ʽֵȡ����ֵ
         if Polynomial>0
            ErrorSymbol=Polynomial;
         else
            ErrorSymbol=-Polynomial; 
         end
         %% ����ж�
         if ErrorSymbol>1e-10
            ErrorSymbol=1;
         else
            ErrorSymbol=0; 
         end
end

     y=TaylorExpansion/pi*180;
     
end

%% arcsin����������Ƕȣ����Ϊ1e-10���޴�����ʾ,ȡֵ��Χ(-1 - 1)��
function y=MyArcsin(radian)  
    i=1;
     %% ÿ�����ʽȡֵ
    Polynomial=1;
     %% ����ʽָ��
    Index=radian;
     %% ����ʽ�׳�
    Factorial=1;
     %% ̩��չ��ʽ���
    TaylorExpansion=radian;
     %% ����־
    ErrorSymbol=1;
    %% n�Ľ׳�
     FactorialN=1;
    %% 2*n�Ľ׳�
     Factorial2N=1;
    
while ErrorSymbol>0
        for j=1:i
            FactorialN=FactorialN*j;
        end
        for j=1:2*i
            Factorial2N=Factorial2N*j;
        end
         %% �׳˸���
         Factorial=Factorial2N/((2*i+1)*4^i*FactorialN*FactorialN);
         %% x�η�����
         Index=Index*radian*radian;
         %% ����ʽȡֵ����
         Polynomial=Index*Factorial;
         %% ̩�����
         TaylorExpansion=TaylorExpansion+Polynomial;
         
         i=i+1;
         FactorialN=1;
         Factorial2N=1;
         %% ����ʽֵȡ����ֵ
         if Polynomial>0
            ErrorSymbol=Polynomial;
         else
            ErrorSymbol=-Polynomial; 
         end
         %% ����ж�
         if ErrorSymbol>1e-10
            ErrorSymbol=1;
         else
            ErrorSymbol=0; 
         end
end

     y=TaylorExpansion/pi*180;
     
end

%% tan���������뻡�ȣ����Ϊ1e-10���޴�����ʾ��
function y=MyTan(radian)
        
    y=MySin(radian)/MyCos(radian);
end
