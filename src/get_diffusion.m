function [Diff] = get_diffusion(nx,ny)
  [X,Cmap]=imread('Brain.png');
  imshow(X,Cmap)
  pause
  R = X(:,:,1);
  G = X(:,:,2);
  B = X(:,:,3);
  GRAY = 0.3*R + 0.59*G+0.11*B;
  for m=1:nx
    for n=1:ny
        i=floor(193/nx*m);
        j=floor(193/ny*n);
     intensity = GRAY(i,j);
     if intensity > 239
       Diff(m,n) = 0.013; %Gray matter
       continue
     end
     if intensity > 0
       Diff(m,n) = 0.13; %White matter
       continue
     end
     %cerebrospinal fluid
     Diff(m,n) = 0.0;
     end
  end
