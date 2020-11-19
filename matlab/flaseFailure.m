tf = 500;
mu = 1/tf;
Tc = 50;
lambdaC = 1/Tc;
N_packet = 200;
ploss = 0.1;
R = 3;

Pflase = MathCaluation(N_packet,mu,lambdaC,ploss,R)

function thetabar = mathCondition(j,R,ploss)

sumTheta = 0;
arraytheta = zeros(1,j+1);

    for i=0:j+1
        if i<R
            theta = 0;
            arraytheta(i+1) = theta;
        elseif i==R == 1
            theta = ploss^R;
            arraytheta(i+1) = theta;                
        else
            sumsubtheta = 0;
            for x=0:i-R-1
                sumsubtheta = sumsubtheta + arraytheta(x+1);
            end
            theta = (1-sumsubtheta)*(1-ploss)*ploss^R;
            arraytheta(i+1) = theta;  
        end
        sumTheta = sumTheta + theta ;
    end
    thetabar = 1 - sumTheta;
end

function beta = MathCaluation(N_packet,miu,lambdaC,ploss,R)
    sumbeta = 0;
    for n=0:N_packet
        thethabar =  mathCondition(n,R,ploss);
        PrNgUp = double((miu*(lambdaC^n)));
        PrNgdown = double((lambdaC+miu)^(n+1));
        fraction = double((PrNgUp)/PrNgdown);
        eeee = double(thethabar*fraction); 
        sumbeta = double(sumbeta + (thethabar*fraction));
    end
    beta = 1 - sumbeta;
end
