function  [filename, p_miss, mu1,  c1, err, j, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final,Time_s, dif]= Inpaint_GSRC_NLP_Main(filename, IterNum, p_miss, sigma, mu1, c1,  err)








        time0                       =              clock;
        
        Orgname                     =              [filename '.tif'];
        
        x_rgb                       =              imread(Orgname); 
        
        [~, ~, kkk ]                =              size(x_rgb);
          
       if kkk==3
        
        x_yuv                       =             rgb2ycbcr(x_rgb);
         
        x                           =             double(x_yuv(:,:,1)); 
        
        x_inpaint_re                =             zeros(size(x_yuv));
        
        x_inpaint_re(:,:,2)         =             x_yuv(:,:,2); 
        
        x_inpaint_re(:,:,3)         =             x_yuv(:,:,3); 
        
       else
            x                       =             double(x_rgb);
       end
         
         
         x_org                      =             x;
        
        
        ratio                       =             p_miss; 

        if ratio==0.6  %text mask
            
            MaskType                =            2; 
            
        else
            
            MaskType                =            1; % random mask; 
            
        end
        
        switch MaskType
            
            case 1  %random mask;
                
                rand('seed',0);
                
                O = double(rand(size(x)) > (1-ratio));
                
            case 2  %text mask
                
                O = imread('TextMask256.png');
                
                O = double(O>128);
                
        end
        
        y                        =                           x.* O;  % Observed Image
        
        
       Options                   =                           [];

       if ~isfield(Options,'mu') 
             Options.mu = mu1;
       end

       if ~isfield(Options,'c1') 
             Options.c1 = c1;
       end
       
       
       if ~isfield(Options,'A')
            Options.A = O;
       end

       if ~isfield(Options,'IterNums')
            Options.IterNums = IterNum;
       end

       if ~isfield(Options,'initial')
            Options.initial = Interpolation_Initial(y,~O);
       end

       if ~isfield(Options,'true')
            Options.true = x_org;
       end

       if ~isfield(Options,'patch')
            Options.patch = 8;
       end

       if ~isfield(Options,'Region')
            Options.Region = 25;
       end

       if ~isfield(Options,'Sim')
            Options.Sim = 60;
       end
       
       
       if ~isfield(Options,'eps')
            Options.eps = 0.4;
       end       
       
       if ~isfield(Options,'err')
            Options.err = err;
       end            

       if ~isfield(Options,'step')
           Options.step = 4;
       end

      if ~isfield(Options,'nSig')
           Options.nSig = sigma;
      end

      if ~isfield(Options,'hr')
           Options.hr = 80;
      end
      
      fprintf('.........................................\n');

     fprintf(filename);
     
     fprintf('\n');
     
     fprintf('..........................................\n');
     
     if ratio==0.6
         
     fprintf('..................text removal.............\n');
     
     else
         
     fprintf('..............missing pixels.....   ratio = %f\n',ratio);
     
     end
      
     fprintf('..................................................\n');
     
     
     [reconstructed_image, Inital_psnr, PSNR_Final,FSIM_Final,SSIM_Final, All_PSNR,j, dif] = Inpaint_GSRC_NLP(y,Options);
     
      Time_s                         =                 (etime(clock,time0)); 
      
      
        if kkk==3
            
        x_inpaint_re(:,:,1)         =                  uint8(reconstructed_image);
        
        x_inpainting_recon          =                  ycbcr2rgb(uint8(x_inpaint_re));
        
        else     
        x_inpainting_recon          =                  reconstructed_image;
        
        end
        
        
        
        
        if ratio==0.1
            
         Final_Name= strcat(filename,'_GSRC_NLP_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final),  '_SSIM_',num2str(SSIM_Final), '.png');
            
        imwrite(uint8(x_inpainting_recon),strcat('./90_Missing_Results/',Final_Name));
        
        
        elseif ratio==0.2
            
         Final_Name= strcat(filename,'_GSRC_NLP_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final),  '_SSIM_',num2str(SSIM_Final), '.png');      
            
        imwrite(uint8(x_inpainting_recon),strcat('./80_Missing_Results/',Final_Name));
        
      %   Final_Name1= strcat(filename,'_GSR_WNNM_0.2_','_Iter_',num2str(j),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'.txt');
      %   Final_Name2= strcat(filename,'_GSR_WNNM_0.2_','_Iter_',num2str(j),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result),'.xls');
      %  dlmwrite(Final_Name1,All_PSNR);
      %  dlmwrite(Final_Name2,All_PSNR);
        elseif ratio==0.3
            
         Final_Name= strcat(filename,'_GSRC_NLP_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final),  '_SSIM_',num2str(SSIM_Final), '.png');    
         
        imwrite(uint8(x_inpainting_recon),strcat('./70_Missing_Results/',Final_Name));

        elseif ratio==0.4
            
         Final_Name= strcat(filename,'_GSRC_NLP_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final),  '_SSIM_',num2str(SSIM_Final), '.png');  
         
        imwrite(uint8(x_inpainting_recon),strcat('./60_Missing_Results/',Final_Name));
        
        elseif ratio==0.5
            
         Final_Name= strcat(filename,'_GSRC_NLP_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final),  '_SSIM_',num2str(SSIM_Final), '.png');  
         
        imwrite(uint8(x_inpainting_recon),strcat('./50_Missing_Results/',Final_Name));
                
        else
            
         Final_Name= strcat(filename,'_GSRC_NLP_miss_',num2str(1-ratio), '_PSNR_',num2str(PSNR_Final), '_FSIM_',num2str(FSIM_Final),  '_SSIM_',num2str(SSIM_Final), '.png');
         
        imwrite(uint8(x_inpainting_recon),strcat('./Text_Inlayed_Results/',Final_Name));
                                
        end           

end

