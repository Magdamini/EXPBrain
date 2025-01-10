function [Diff] = get_diffusion3d(nx,ny,nz)
  dir_name = "brain_scan/";
  [X1,Cmap]=imread(dir_name + 'out1.png');
  R=X1(:,:,1);
  G=X1(:,:,2);
  B=X1(:,:,3);
  GRAY(:,:,1) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out2.png');
  GRAY(:,:,2) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out3.png');
  GRAY(:,:,3) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out4.png');
  GRAY(:,:,4) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out5.png');
  GRAY(:,:,5) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out6.png');
  GRAY(:,:,6) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out7.png');
  GRAY(:,:,7) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out8.png');
  GRAY(:,:,8) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out9.png');
  GRAY(:,:,9) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out10.png');
  GRAY(:,:,10) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out11.png');
  GRAY(:,:,11) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out12.png');
  GRAY(:,:,12) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out13.png');
  GRAY(:,:,13) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out14.png');
  GRAY(:,:,14) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out15.png');
  GRAY(:,:,15) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out16.png');
  GRAY(:,:,16) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out17.png');
  GRAY(:,:,17) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out18.png');
  GRAY(:,:,18) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out19.png');
  GRAY(:,:,19) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out20.png');
  GRAY(:,:,20) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out21.png');
  GRAY(:,:,21) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out22.png');
  GRAY(:,:,22) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out23.png');
  GRAY(:,:,23) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out24.png');
  GRAY(:,:,24) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out25.png');
  GRAY(:,:,25) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out26.png');
  GRAY(:,:,26) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out27.png');
  GRAY(:,:,27) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out28.png');
  GRAY(:,:,28) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  [X1,Cmap]=imread(dir_name + 'out29.png');
  GRAY(:,:,29) = X1(:,:,1)*0.3+X1(:,:,2)*0.59+X1(:,:,3)*0.11;
  Diff(1:nx,1:ny,1:nz)=0.0;
  for m=2:nx-1
    for n=2:ny-1
      for l=2:nz-1
         i=floor(532/nx*m);
         j=floor(565/ny*n);    
         k=floor(28/nz*l)+1;
         intensity = GRAY(i,j,k);
         if intensity > 110
           Diff(m,n,l) = 0.013; %Gray matter
           continue
         end
         if intensity > 1
           Diff(m,n,l) = 0.13; %White matter
           continue
         end
         %cerebrospinal fluid
         Diff(m,n,l) = 0.0;
      end
    end
  end
