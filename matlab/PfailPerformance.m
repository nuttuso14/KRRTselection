%% Performance
%M = [2:20];
%M = [1:20];
M = [0.0001	0.0005	0.005	0.01	0.05	0.1];
M2 = 1:30;

Pdelta1 = [0	0	0.00234	0.02554	0.77271	0.96322];
Pdelta2 = [0	0	0.00756	0.07331	0.91087	0.98758];


i = i+1;
figure(i)
%plot(M,case_1,'-d')
%hold on
%plot(M,case_2,'-s')
%hold on
%plot(M,case_3,'-^')
%hold on

semilogx(M,Pdelta1,'-d','LineWidth',1.3)
hold on
semilogx(M,Pdelta2,'-o','LineWidth',1.3)
hold on

%plot(M,m5k5_sim,'-x')
%hold on
%plot(M,m5k5_ana,'-<')
%hold on

xlim([0.0001,0.1]);

xlabel('p')
ylabel('\beta', 'FontSize', 18)

xticklabels({'0.0001',	'0.0005',	'0.005',	'0.01',	'0.05',	'0.1'});

set(gca, 'XTick', M);

%legend('\lambda_i=0.1\lambda_1','\lambda_i=0.5\lambda_1','\lambda_i=0.9\lambda_1')
legend('\Delta_1','\Delta_2')
hold off;
grid on

figure(i+1)

Pdelta1 = [0.00008	0.00018	0.00028	0.00031	0.00041	0.00049	0.00059	0.0007	0.00067	0.00086	0.00092	0.00101	0.00108	0.00116	0.00121	0.00132	0.00142	0.00133	0.0016	0.00173	0.0017	0.00186	0.00176	0.00189	0.00191	0.00206	0.00211	0.00236	0.00243	0.00234];
Pdelta2 = [0.00029	0.00047	0.00072	0.00093	0.0013	0.00148	0.00178	0.00186	0.0023	0.00254	0.00273	0.00273	0.00322	0.00356	0.00345	0.00398	0.00431	0.00417	0.00436	0.00498	0.0052	0.00552	0.00571	0.00557	0.0063	0.00603	0.00625	0.00645	0.00653	0.00756];

plot(M2,Pdelta1,'-d','LineWidth',1.3)
hold on
plot(M2,Pdelta2,'-o','LineWidth',1.3)
hold on


xlim([1,30]);

xlabel('Days')
ylabel('\beta', 'FontSize', 18)


%legend('\lambda_i=0.1\lambda_1','\lambda_i=0.5\lambda_1','\lambda_i=0.9\lambda_1')
legend('\Delta_1','\Delta_2')
hold off;
grid on


