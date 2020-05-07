%%
% *Operations for cleaning the environment* 
clc; clear all; close all;

%% Normalized cross-correlation
%%
% *Functions we will using for this program*

% t1E=0:1/329.63:2;
% t2B=0:1/246.94:2;
% t3G=0:1/196:2;
% t4D=0:1/146:2;
% t5A=0:1/110:2;
% t6E=0:1/82.41:2;

A=20;
sample=0.1;
t=0:sample:2;
insignal=A*cos(2*pi*329.6*t);

%%
% *Question about the note*

cu=input('¿Qué cuerda deseas afinar? (1 - más delgada, 6 - más gruesa)\n');

%%
% *Plotting of the signals and normalized crossed-correlation*

if(cu==1)
    
    fc=329.63;
    fun=A*cos(2*pi*fc*t);
    
    subplot(3,1,1);
    stem(t, fun, "Color", "Red", 'LineWidth', 1);
    axis([ 0 2 (min(fun)-1) (max(fun)+1)]);
    title("Note signal");
    xlabel("t");
    ylabel("x(t)");
    
    subplot(3,1,2);
    stem(t, insignal, "Color", "Red", 'LineWidth', 1);
    axis([ 0 2 (min(insignal)-1) (max(insignal)+1)]);
    title("Input signal");
    xlabel("t");
    ylabel("x(t)");
    
    corr=zeros(length(t),1);
    
    n=0;
    
    for(i=1:(length(t)))
        n=n+sample;
        os=A*cos(2*pi*fc*n);
        is=A*cos(2*pi*329.6*n);%Poner la frecuencia del input
        
        if(abs(os)>abs(is))   
            corr(i)=((is*100)/os)/100;
        elseif(abs(is)>abs(os))
            corr(i)=((os*100)/is)/100;
        else
            corr(i)=1; 
        end   
    end 
    
    subplot(3,1,3);
    stem(t, corr, "Color", "Red", 'LineWidth', 1);
    axis([ 0 2 -1 1]);
    title("Normalized crossed-correlation signal");
    xlabel("t");
    ylabel("x(t)");
    
    corr_norm=sum(fun.*insignal)/sqrt(sum(abs(fun).^2)*sum(abs(insignal).^2));
    porcentaje=abs(corr_norm*100);
    
    fprintf('\nEl resultado de correlación de tu cuerda es: %f',corr_norm);
    
    fprintf('\nEl porcentaje de similaridad de tu nota es: %f',porcentaje);
    
elseif(cu==2)
    
    fc=246.94;
    
    
end
   



