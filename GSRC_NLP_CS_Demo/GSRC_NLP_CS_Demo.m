clc
clear
m_20=0; 
m_30=0;    
m_40=0;  
m_10=0;  
m_50=0; 
m_60=0; 

All_data_Results_2_20 = cell(1,200);
All_data_Results_2_30 = cell(1,200);
All_data_Results_2_40 = cell(1,200);
All_data_Results_2_10 = cell(1,200);
All_data_Results_2_50 = cell(1,200);
All_data_Results_2_60 = cell(1,200);

for i = 1
ImageNum =i;

switch ImageNum
    
            case 1
                filename = 'Airplane';
            case 2
                filename = 'boat';
            case 3
                filename = 'Fence';
            case 4
                filename = 'Fingerprint';    
            case 5
                filename = 'Foreman'; 
                
            case 6
                filename = 'House';
            case 7
                filename = 'Lena';
            case 8
                filename = 'Lin';
            case 9
                filename = 'Man';    
            case 10
                filename = 'Pentagon'; 
                
            case 11
                filename = 'Plants';
            case 12
                filename = 'Straw';

end


for j  =   1
    


filename

ratio_Num        =       [0.1, 0.2, 0.3, 0.4]; 


IterNum           =       300;

ratio             =       ratio_Num(j)

sigma             =       sqrt(2);


 if  ratio   == 0.1
     
          mu1 = 0.009; c1  = 0.0003; err  = 1.18e-4;
     
 elseif ratio   == 0.2
     
          mu1 = 0.3; c1  = 0.001;   err  = 4.45e-5;
                             
 elseif ratio   == 0.3
     
          mu1 = 0.3; c1  = 0.0007;   err  = 3.29e-5;
          
 else
     
          mu1 = 0.3; c1  = 0.0003;   err  = 2.39e-5;  
 end


 if  j == 1 
     

     
 [Ori, ratio, mu1,  c1, err, jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= CS_GSRC_NLP_Main(filename, IterNum, ratio, sigma, mu1, c1, err);
 
 m_10= m_10+1;
 
 s=strcat('A',num2str(m_10));
 
 All_data_Results_2_10{m_10}={Ori, ratio,  mu1,  c1,    jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('CSRC_NLP_ratio_0.1.xls', All_data_Results_2_10{m_10},'sheet1',s);
 
 save  CSRC_NLP_ratio_0_1 All_data_Results_2_10
 
 
 
 
 elseif  j == 2
     
 
     
 [Ori, ratio, mu1,  c1, err, jj,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= CS_GSRC_NLP_Main(filename, IterNum, ratio, sigma, mu1, c1, err);
 
 m_20= m_20+1;
 
 s=strcat('A',num2str(m_20));
 
 All_data_Results_2_20{m_20}={Ori, ratio,  mu1,  c1,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('CSRC_NLP_ratio_0.2.xls', All_data_Results_2_20{m_20},'sheet1',s);
 
 save CSRC_NLP_ratio_0_2 All_data_Results_2_20
 
 
  elseif  j == 3
      
 
     
 [Ori, ratio, mu1,  c1, err, jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= CS_GSRC_NLP_Main(filename, IterNum, ratio, sigma, mu1, c1, err);
 
 m_30= m_30+1;
 
 s=strcat('A',num2str(m_30));
 
 All_data_Results_2_30{m_30}={Ori, ratio,mu1,  c1,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
xlswrite('CSRC_NLP_ratio_0.3.xls', All_data_Results_2_30{m_30},'sheet1',s);

save CSRC_NLP_ratio_0_3 All_data_Results_2_30
 
 
 else
    
     
 [Ori, ratio, mu1,  c1, err, jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= CS_GSRC_NLP_Main(filename, IterNum, ratio, sigma, mu1, c1, err);
 
 m_40= m_40+1;
 
 s=strcat('A',num2str(m_40));
 
 All_data_Results_2_40{m_40}={Ori, ratio,  mu1,  c1,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('CSRC_NLP_ratio_0.4.xls', All_data_Results_2_40{m_40},'sheet1',s);
 
 save CSRC_NLP_ratio_0_4 All_data_Results_2_40

 
 
 end


clearvars -except filename i m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40 m_10 All_data_Results_2_10 m_50 All_data_Results_2_50 m_60 All_data_Results_2_60
end
clearvars -except filename m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40 m_10 All_data_Results_2_10 m_50 All_data_Results_2_50 m_60 All_data_Results_2_60
end






         