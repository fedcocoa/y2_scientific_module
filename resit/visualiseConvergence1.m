syms x;
inputFx = @(x) x.*exp(-x);
df = @(x) -(x-1).*exp(-x);
df2 = @(x) (x-2).*exp(-x);
range = -10:20/1000:10;

data = inputFx(range);

newton = Newton(inputFx,df,range,1e-5,100);
halley = superHalley(inputFx,df,df2,range,1e-5,100);

newtonblue = data;
newtonred = data;

newtonblue(newton~=0) = NaN;
newtonred(newton==0) = NaN;

halleyblue = data;
halleyred = data;

halleyblue(halley~=0) = NaN;
halleyred(halley==0) = NaN;



subplot(1,2,1);
hold on;
plot(range,newtonblue,'b');
plot(range,newtonred,'r');
hold off;
subplot(1,2,2);
hold on;
plot(range,halleyblue,'b');
plot(range,halleyred,'r');
hold off;