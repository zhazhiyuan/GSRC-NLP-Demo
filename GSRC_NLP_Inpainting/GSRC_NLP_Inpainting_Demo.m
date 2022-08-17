clc
clear

%cd
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
                filename = 'Butterfly';
             case 2
                filename = 'Bahoon';
             case 3
                filename = 'Cowboy';
             case 4
                filename = 'Fireman';
             case 5
                filename = 'Girl';
             case 6
                filename = 'Light';
             case 7
                filename = 'Mickey';
             case 8
                filename = 'Mural';
             case 9
                filename = 'Nanna';
              case 10
                filename = 'Tower';
                
             case 11
                filename = 'Windows';
             case 12
                filename = 'Zebra';
        
end
for j  =   2
    


filename

miss_Num        =       [0.1, 0.2, 0.3, 0.4, 0.5, 0.6]; 

IterNum           =       400;

miss_rate       =       miss_Num(j);

sigma             =       sqrt(2);



 if  miss_rate  == 0.1
     
          mu1  = 0.009;  c1  =   0.001;    err = 1.62e-4; 
     
 elseif miss_rate  == 0.2
     
          mu1  = 0.007;  c1  =   0.0005;     err = 1.06e-4; 
     
 elseif miss_rate  == 0.3
     
          mu1  = 0.003;  c1  =   0.0001;     err = 7.25e-5;   
     
 elseif miss_rate  == 0.4
     
          mu1  = 0.009;  c1  =   0.0001;     err = 5.14e-5; 
          
 elseif miss_rate  == 0.5
     
          mu1  = 0.05;  c1  =   0.0005;      err = 4.40e-5; 
          
 else
          mu1  = 0.003;  c1  =   0.0001;     err = 4.15e-5;   
 end


 if  j== 1  % 90%
     

     
 [Ori, miss_rate, mu1,  c1, err, jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, miss_rate, sigma, mu1, c1, err);
 
 m_10= m_10+1;
 
 s=strcat('A',num2str(m_10));
 
 All_data_Results_2_10{m_10}={Ori, miss_rate,  mu1,  c1,   err,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('Inpaint_GSRC_NLP_90.xls', All_data_Results_2_10{m_10},'sheet1',s);

save  Inpaint_GSRC_NLP_90 All_data_Results_2_10
 
 
 
 
 elseif  j== 2

     
 [Ori, miss_rate, mu1,  c1, err, jj,  Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, miss_rate, sigma, mu1, c1, err);
 
 m_20= m_20+1;
 
 s=strcat('A',num2str(m_20));
 
 All_data_Results_2_20{m_20}={Ori, miss_rate,  mu1,  c1,  err,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('Inpaint_GSRC_NLP_80%.xls', All_data_Results_2_20{m_20},'sheet1',s);
 
 save Inpaint_GSRC_NLP_80 All_data_Results_2_20
 
 
  elseif  j== 3

     
 [Ori, miss_rate, mu1,  c1, err, jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, miss_rate, sigma, mu1, c1, err);
 
 m_30= m_30+1;
 
 s=strcat('A',num2str(m_30));
 
 All_data_Results_2_30{m_30}={Ori, miss_rate,mu1,  c1,  err,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('Inpaint_GSRC_NLP_70.xls', All_data_Results_2_30{m_30},'sheet1',s);

save Inpaint_GSRC_NLP_70 All_data_Results_2_30
 
 
   elseif   j== 4
     

     
 [Ori, miss_rate, mu1,  c1, err, jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, miss_rate, sigma, mu1, c1, err);
 
 m_40= m_40+1;
 
 s=strcat('A',num2str(m_40));
 
 All_data_Results_2_40{m_40}={Ori, miss_rate,  mu1,  c1,  err,   jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('Inpaint_GSRC_NLP_60%.xls', All_data_Results_2_40{m_40},'sheet1',s);

save Inpaint_GSRC_NLP_60 All_data_Results_2_40

   elseif   j== 5
     
      
      
 [Ori, miss_rate, mu1,  c1, err,  jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, miss_rate, sigma, mu1, c1,  err);
 
 m_50= m_50+1;
 
 s=strcat('A',num2str(m_50));
 
 All_data_Results_2_50{m_50}={Ori, miss_rate,  mu1,  c1, err,  jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('Inpaint_GSRC_NLP_50%.xls', All_data_Results_2_50{m_50},'sheet1',s);

save Inpaint_GSRC_NLP_50 All_data_Results_2_50
 
 else
     
     
  [Ori, miss_rate, mu1,  c1, err,  jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, miss_rate, sigma, mu1, c1,  err);
 
 m_60= m_60+1;
 
 s=strcat('A',num2str(m_60));
 
 All_data_Results_2_60{m_60}={Ori, miss_rate,  mu1,  c1, err,  jj, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif};
 
 xlswrite('Inpaint_GSRC_NLP_text.xls', All_data_Results_2_60{m_60},'sheet1',s);    
 save Inpaint_GSRC_NLP_text All_data_Results_2_60

 
 end

clearvars -except filename i m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40 m_10 All_data_Results_2_10...
    m_50 All_data_Results_2_50 m_60 All_data_Results_2_60
end
clearvars -except filename m_20 All_data_Results_2_20 m_30 All_data_Results_2_30 m_40 All_data_Results_2_40 m_10 All_data_Results_2_10...
    m_50 All_data_Results_2_50 m_60 All_data_Results_2_60
end






         