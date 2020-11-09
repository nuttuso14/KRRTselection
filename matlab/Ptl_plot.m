%% Performance
%M = [2:20];
%M = [1:20];
M = [0:0.25:10];

m5k3_sim = [0	0.01986	0.46342	0.92988	0.9978	0.99994	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
m5k3_ana = [0	0.019098	0.461735	0.926989	0.997355	0.999964	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];

m5k5_sim = [0	0	0.01196	0.2052	0.65264	0.93492	0.9947	0.99988	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
m5k5_ana = [0	0.00001	0.011719	0.202715	0.655411	0.936598	0.994994	0.999812	0.999996	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];

m5k7_sim = [0	0	0.00004	0.00646	0.09522	0.39098	0.75568	0.94764	0.9939	0.99964	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
m5k7_ana = [0	0	0.00004	0.006395	0.094005	0.390466	0.755028	0.946636	0.993744	0.999589	0.999984	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1	1];
i = i+1;
figure(i)
%plot(M,case_1,'-d')
%hold on
%plot(M,case_2,'-s')
%hold on
%plot(M,case_3,'-^')
%hold on

plot(M,m5k3_sim,'-d','LineWidth',1.5)
hold on
plot(M,m5k3_ana,'-o','LineWidth',1.5)
hold on
plot(M,m5k5_sim,'-^','LineWidth',1.5)
hold on
plot(M,m5k5_ana,'-s','LineWidth',1.5)
hold on
plot(M,m5k7_sim,'-*','LineWidth',1.5)
hold on
plot(M,m5k7_ana,'-+','LineWidth',1.5)
hold on
%plot(M,m5k5_sim,'-x')
%hold on
%plot(M,m5k5_ana,'-<')
%hold on

xlim([0,4]);

xlabel('t')
ylabel('P[t_l<t]', 'FontSize', 18)
%legend('\lambda_i=0.1\lambda_1','\lambda_i=0.5\lambda_1','\lambda_i=0.9\lambda_1')
legend('M=5 K=3 sim','M=5 K=3 ana','M=5 K=5 sim','M=5 K=5 ana','M=5 K=7 sim','M=5 K=7 ana')
grid on