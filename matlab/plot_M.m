%% Performance
%M = [2:20];
%M = [1:20];
M = [2 3 4 5 6 7 8 9 10 11 12];


%%%%% For Alpha
case1 = [1	1	1	1	1	0.9999	0.9999	0.9999	1	0.9997	0.9999];
case2 = [0.9925	0.985	0.9779	0.9745	0.9671	0.9594	0.9521	0.9465	0.9448	0.9386	0.934];
case3 = [0.9227	0.8672	0.8143	0.7807	0.7428	0.71	0.6872	0.6562	0.6439	0.6312	0.6106];
case4 = [0.7793	0.6391	0.5503	0.4934	0.4375	0.4044	0.3801	0.3478	0.3296	0.3068	0.2884];
case5 = [0.5884	0.4241	0.3344	0.2761	0.2352	0.2056	0.1771	0.1609	0.1451	0.1397	0.1219];

%%%%% For tl
case1_tl = [1.79325	1.80408	1.803549	1.807015	1.793054	1.804194	1.799406	1.803778	1.79104	1.807715	1.809924];
case2_tl = [1.789986	1.797536	1.793849	1.79521	1.777878	1.785598	1.777064	1.779413	1.764804	1.77735	1.777248];
case3_tl = [1.759749	1.736647	1.696376	1.681484	1.666558	1.641441	1.624018	1.623667	1.594438	1.585677	1.568993];
case4_tl = [1.669809	1.593283	1.513634	1.479285	1.442565	1.405298	1.374852	1.35718	1.329657	1.31539	1.292367];
case5_tl = [1.539553	1.412794	1.310932	1.262139	1.216311	1.172809	1.143152	1.12018	1.095049	1.076019	1.056112];

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

xlabel('M')
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

xlabel('M')
ylabel('t_l', 'FontSize', 18)
legend('Case 1','Case 2','Case 3','Case 4','Case 5')
grid on

