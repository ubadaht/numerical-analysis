%interpolation points
x=-55:10:65;
%x=x';
y=[3.7 3.7 3.52 3.27 3.2 3.15 3.15 3.25 3.47 3.52 3.65 3.67 3.52];
%y=y';

% evaluation points
xx=linspace(min(x),max(x),200);
%-----------------------------------------------------------------------
%3. Newton interpolating poly of degree 12(=number of points - 1)
c=InterpN(x,y);
% poly evaluation
yy3=HornerN(c,x,xx);
yy42=HornerN(c,x,42)
%-----------------------------------------------------------------------
%4. cubic spline Interpolant (piecewise poly with degree 3)
yy4 = spline(x,y,xx);
yy42_spline=spline(x,y,42);
hold on
plot(42,yy42,'*b')
plot(42,yy42_spline,'ob')

plot(x,y,'ro',xx,yy3,'m',xx,yy4,'g')

pause

% Evaluate temperature at xx=42
yv1=polyval(a1,42);
yv2=polyval(a2,42);
yv3=HornerN(c,x,42);
yv4=spline(x,y,42);

fprintf('Utilizzando i 4 metodi, le stime della temperatura a latitudine 42 risultano:\n');
disp([yv1 yv2 yv3 yv4]);

% Disegna il grafico degli approssimanti/interpolanti
plot(xx,yy1,'b-',xx,yy2,'g-',xx,yy3,'m-',xx,yy4,'y-',x,y,'r*',42,yv1,'bo',42,yv2,'go',42,yv3,'mo',42,yv4,'yo');
legend('1.Approssimante lineare','2.Approssimante quadratico','3.Interpolante di Newton','4.Interpolante spline cubica','Dati',...
       'T1','T2','T3','T4');
pause
   
   %1. Approssimazione mediante minimi quadrati con un polinomio di grado 1
% NON RICHIESTA 
a1=polyfit(x,y,1);
%Valutazione dell'approssimante di grado 1
yy1=polyval(a1,xx);
%-----------------------------------------------------------------------
%2. Approssimazione mediante minimi quadrati con un polinomio di grado 2
% NON RICHIESTA
a2=polyfit(x,y,2)
%Valutazione dell'approssimante di grado 2
yy2=polyval(a2,xx);
% Alternativamente:
%H=[ones(13,1) x x.^2];
%a2=H\y
%Valutazione dell'approssimante di grado 2
%yy2=[ones(200,1) xx' (xx').^2]*a2;
%figure(100)
%plot(xx,yy2,x,y,'ro');
