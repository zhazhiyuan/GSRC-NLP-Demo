function  [reconstructed_image, Inital_psnr,PSNR_Final, FSIM_Final, SSIM_Final, All_PSNR, Outloop, dif] = Inpaint_GSRC_NLP(y,Options)




mask            =              Options.A;

A               =              @(x) mask.*x;

AT              =              @(x) mask.*x;

ATy             =              AT(y);

%mu = Options.mu;
mu              =              Options.mu; % Parameter for PSR


x               =              Options.initial;

IterNums        =              Options.IterNums;

true            =              Options.true;

b               =              zeros(size(y));

c               =              zeros(size(y));

%w               =              zeros(size(y));

muinv           =              1/mu;

invAAT          =             1./(mu+mask);


fprintf('Initial PSNR = %0.2f\n',csnr(x,true,0,0));

Inital_psnr    =   csnr(x,true,0,0);

All_PSNR       =              zeros(1,IterNums);


 GSR_NLS_Results          =                      cell (1,IterNums);   


for Outloop = 1:IterNums
          
        w                =                  GSRC_NLP_Solver(x-c,Options);
        
        r                =                  ATy + mu*(w+c);
        
        x                =                  muinv*(r - AT(invAAT.*A(r)));
    
        c                =                  c + (w - x);
        
   All_PSNR(Outloop)     =               csnr(x,true,0,0);
   
   GSR_NLS_Results{Outloop}      =                      x;
    
    fprintf('iter number = %d, PSNR = %0.2f\n',Outloop,csnr(x,true,0,0));

    
    if Outloop>1
        
              dif      =  norm(abs(GSR_NLS_Results{Outloop}) - abs(GSR_NLS_Results{Outloop-1}),'fro')/norm(abs(GSR_NLS_Results{Outloop-1}), 'fro');
        
        if dif < Options.err
            
            break;
            
        end
        
    end
    
    
end

reconstructed_image             =                 x;

PSNR_Final                      =                 csnr(reconstructed_image,true,0,0);

FSIM_Final                      =                 FeatureSIM(reconstructed_image,true);

SSIM_Final                      =                 cal_ssim(reconstructed_image,true,0,0);

end

