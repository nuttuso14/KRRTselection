clear all

%% Parameters
k = 3; % #Zi due to array problem k cannot be assigned with high value may be we can swap k and ni eg., k=5 ni=3 we can use k=3 m=15 rather than k=5 m=15
m = 21; % size of alpha
lambda = [15 12 9 6 3];

%% Initialize alpha
a = [ones(k,1) zeros(k,m-1)];

%% Generate Ti
% Jordan form: tril(triu(ones(m)),1)

Ti = []; % 3D matrix

for i = k:-1:1
    
   Ti(:,:,i) = lambda(i) * ( tril(triu(ones(m)),1)+eye(m)*(-2) );
   
end


%% Compute alpha by Kronecker Product
alpha = a(1,:);

for i = 2:k
    
    alpha = kron(alpha,a(i,:));
    
end

%% Compute T by Kronecker Sum
T = Ti(:,:,1);

for i = 2:k

    [r,s] = size(T);
    [p,q] = size(Ti(:,:,i));
    
    T = kron( T,eye(p) ) + kron( eye(r),Ti(:,:,i) );
    
end

%% Probability
[m,n] = size(T);
tmin = 0;
tmax = 10;
step = 0.25;
t = [tmin:step:tmax];

for i = 1:(tmax-tmin)/step +1 
    
    P(i) = 1 - alpha*expm(T*t(i))*ones(m,1);
    X = sprintf('%f , %f',t(i),P(i));
    disp(X)

end


%% Plot
plot(t,P,'-o')
grid on
xlabel('t')
ylabel('P')


