%% Performance
%M = [2:20];
%M = [1:20];
M = [1 2 3 4 5 6 7 8 9 10];


%%%%% For Alpha
case1 = [0.9743	0.9996	1	1	1	1	1	1	1	1];
case2 = [0.7479	0.9197	0.9702	0.9894	0.9975	0.9992	0.9999	0.9998	1	1];
case3 = [0.509	0.6803	0.7787	0.85	0.8998	0.9296	0.9509	0.9656	0.9779	0.9849];
case4 = [0.3487	0.4354	0.4947	0.5532	0.5978	0.6432	0.6631	0.7068	0.735	0.7664];
case5 = [0.2448	0.2554	0.2783	0.2873	0.2938	0.3213	0.3159	0.3325	0.3369	0.3472];

%%%%% For tl
case1_tl = [0.5995	1.2063	1.8077	2.4049	2.9921	3.6142	4.1953	4.8025	5.4080	6.0006];
case2_tl = [0.5092	1.1598	1.7785	2.3923	2.9903	3.5922	4.1974	4.8022	5.3975	5.9918];
case3_tl = [0.4156	1.0419	1.6724	2.3093	2.9321	3.5495	4.1666	4.7790	5.3834	5.9818];
case4_tl = [0.3412	0.8893	1.4712	2.0806	2.6903	3.2985	3.9265	4.5456	5.1670	5.7898];
case5_tl = [0.2854	0.7545	1.2655	1.7940	2.3340	2.8847	3.4403	4.0110	4.5892	5.1678];


i = i+1;
figure(i)
%plot(M,case_1,'-d')
%hold on
%plot(M,case_2,'-s')
%hold on
%plot(M,case_3,'-^')
%hold on

plot(M,case1,'-d','LineWidth',1.5)
hold on
plot(M,case2,'-o','LineWidth',1.5)
hold on
plot(M,case3,'-^','LineWidth',1.5)
hold on
plot(M,case4,'-s','LineWidth',1.5)
hold on
plot(M,case5,'-*','LineWidth',1.5)
hold on

xlabel('K')
ylabel('\alpha', 'FontSize', 18)
%legend('\lambda_i=0.1\lambda_1','\lambda_i=0.5\lambda_1','\lambda_i=0.9\lambda_1')
legend('Case 1','Case 2','Case 3','Case 4','Case 5')
grid on

%-----------
figure(i+1)

plot(M,case1_tl,'-d','LineWidth',1.5)
hold on
plot(M,case2_tl,'-o','LineWidth',1.5)
hold on
plot(M,case3_tl,'-^','LineWidth',1.5)
hold on
plot(M,case4_tl,'-s','LineWidth',1.5)
hold on
plot(M,case5_tl,'-*','LineWidth',1.5)
hold on

xlabel('K')
ylabel('t_l', 'FontSize', 18)
legend('Case 1','Case 2','Case 3','Case 4','Case 5')
grid on

