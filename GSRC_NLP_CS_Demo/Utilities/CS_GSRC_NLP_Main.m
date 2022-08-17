function [filename,  subrate, mu1,  c1, err, j, PSNR_Inital, PSN_Result,  FSIM_Result,  SSIM_Result, Time_s, dif] = CS_GSRC_NLP_Main(filename, IterNum, subrate, sigma, mu1, c1,  err)

        time0                                   =                                      clock;
        
        block_size                              =                                      32;
        
        original_filename                       =                                      [filename '.tif'];
        
        original_filename                       =                                      imread(original_filename);
        
        [row, col,kk]                           =                                      size(original_filename);
                
        if kk==3
            
        original_image                          =                                     double(rgb2gray((original_filename)));
        
        else
        original_image                          =                                     double((original_filename));
        
        end
       
        randn('seed',0);     
        % Constructe Measurement Matrix (Gaussian Random)
        N                                       =                                      block_size * block_size;
        
        M                                       =                                      round(subrate * N);
        
        Phi                                     =                                      orth(randn(N, N))';
        
        Phi                                     =                                      Phi(1:M, :);
        
        x                                       =                                      im2col(original_image, [block_size block_size], 'distinct');
        
        % Get Measurements
        y                                       =                                      Phi * x;
        
        % Obtain Initilization by MH
        disp('Initilization ...');
        
        [x_MH,  ~]                              =                                      MH_BCS_SPL_Decoder(y, Phi, subrate, row, col);
                
        x_org                                   =                                      original_image;
        
        
        PSNR_Inital                             =                                      csnr (x_MH, x_org, 0, 0);
        
        Opts                                    =                                      [];
        
        Opts.Phi                                =                                      Phi;
        
        Opts.block_size                         =                                      block_size;
        
        Opts.row                                =                                      row;
        
        Opts.col                                =                                      col;
        
        if ~isfield(Opts,'initial')
            Opts.initial = double(x_MH);
        end
        
        if ~isfield(Opts,'org')
            Opts.org = x_org;
        end
        
        if ~isfield(Opts,'IterNum')
            Opts.IterNum = IterNum;
        end
        
       if ~isfield(Opts,'mu') 
             Opts.mu = mu1;
       end
       
       if ~isfield(Opts,'c1') 
             Opts.c1 = c1;
       end       
       
       
       if ~isfield(Opts,'patch')
            Opts.patch = 8;
       end

       if ~isfield(Opts,'Region')
            Opts.Region = 25;
       end

       if ~isfield(Opts,'Sim')
            Opts.Sim = 60;
       end

       
       if ~isfield(Opts,'err')
            Opts.err = err;
       end
  
       if ~isfield(Opts,'eps')
            Opts.eps = 0.4;
       end
       
       if ~isfield(Opts,'step')
           Opts.step = 4;
       end

      if ~isfield(Opts,'nSig')
           Opts.nSig = sigma;
      end       
       

        if ~isfield(Opts,'Inloop')
            Opts.Inloop = 200;
        end
        
        if ~isfield(Opts,'hr')
            Opts.hr = 80;
        end    
        
        
        fprintf('Initial PSNR = %0.2f\n',csnr(Opts.org,Opts.initial,0,0));
        % Invoke Proposed GSR Alogorithm for Block-based CS Recovery
        disp('Beginning of GSRC_NLP Algorithm for CS Recovery');

        [reconstructed_image, PSN_Result,FSIM_Result,SSIM_Result,All_PSNR,j, dif] = GSRC_NLP_CS(y, Opts);
        
        
        Time_s =(etime(clock,time0));  
        
        if subrate==0.1

        Final_Name= strcat(filename,'_GSRC_NLP_CS_',num2str(subrate),'_PSNR_',num2str(PSN_Result), '_FSIM_',num2str(FSIM_Result), '_SSIM_',num2str(SSIM_Result),'.png');
     %   PSNR_Final_Name= strcat(filename,'_GSRC_NLP_CS_',num2str(subrate),'_Iter_',num2str(j),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result), '_SSIM_',num2str(SSIM_Result),'.txt');

        imwrite(uint8(reconstructed_image),strcat('./GSRC_NLP_CS_0.1_Results/',Final_Name));
        
       % PSNR_Final_Name1= strcat(filename,'_GSRC_NLP_CS_',num2str(subrate),'_Iter_',num2str(j),'_PSNR_',num2str(PSN_Result),'_FSIM_',num2str(FSIM_Result), '_SSIM_',num2str(SSIM_Result),'.xls');
       % dlmwrite(PSNR_Final_Name1,All_PSNR); 
        
        elseif subrate==0.2
            
        Final_Name= strcat(filename,'_GSRC_NLP_CS_',num2str(subrate),'_PSNR_',num2str(PSN_Result), '_FSIM_',num2str(FSIM_Result), '_SSIM_',num2str(SSIM_Result),'.png');
        
        imwrite(uint8(reconstructed_image),strcat('./GSRC_NLP_CS_0.2_Results/',Final_Name));
        
        
        
        elseif subrate==0.3
            
        Final_Name= strcat(filename,'_GSRC_NLP_CS_',num2str(subrate),'_PSNR_',num2str(PSN_Result), '_FSIM_',num2str(FSIM_Result), '_SSIM_',num2str(SSIM_Result),'.png');
        
        imwrite(uint8(reconstructed_image),strcat('./GSRC_NLP_CS_0.3_Results/',Final_Name));
        
        
        
        else
            
        Final_Name= strcat(filename,'_GSRC_NLP_CS_',num2str(subrate),'_PSNR_',num2str(PSN_Result), '_FSIM_',num2str(FSIM_Result), '_SSIM_',num2str(SSIM_Result),'.png');
        
        
        imwrite(uint8(reconstructed_image),strcat('./GSRC_NLP_CS_0.4_Results/',Final_Name));
                                
       end    
        
        
        
        
end