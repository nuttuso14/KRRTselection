Tc = 50;
lambdaC = 1/Tc;
tf = 500;
mu = 1/tf;
n=10;

P = (((lambdaC*tf)^n)/factorial(n))*exp(-1*(lambdaC*tf))

test = (mu*lambdaC^n)/((mu+lambdaC)^(n+1))