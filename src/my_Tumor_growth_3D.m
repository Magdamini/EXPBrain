fprintf("Initializing...\n");

%Data of the problem
rho = 0.025;
x1 = 0;
x2 = 193;
y1 = 0;
y2 = 193;
z1 = 0;
z2 = 193;
t0 = 150;
T = 3500;
xic = 102;
yic = 138;
zic = 96;

u0 = @(x,y,z) 0.1*exp(-10*((x-xic).^2+(y-yic).^2+(z-zic).^2));

%Meshes matrix for Finite Differences
n_elements = 64;
nelx = n_elements;
nely = n_elements;
nelz = n_elements;
xsol = linspace(x1,x2,nelx+1);
ysol = linspace(y1,y2,nely+1);
zsol = linspace(z1,z2,nelz+1);

hx = xsol(2:end)-xsol(1:end-1);
hy = ysol(2:end)-ysol(1:end-1);
hz = zsol(2:end)-zsol(1:end-1);
hx = hx(1);
hy = hy(1);
hz = hz(1);
hx2 = hx*hx;
hy2 = hy*hy;
hz2 = hz*hz;

nx = nelx+1;
ny = nely+1;
nz = nelz+1;

fprintf("Reading MRI scan...\n");
diff = get_diffusion3d(nx,ny,nz);

fprintf("Generating finite difference matrix...\n");

non_zeros = 7*(nx-2)*(ny-2)*(nz-2); % Maximum possible nonzero elements
values = zeros(non_zeros, 1);
row_idx = zeros(non_zeros, 1);
col_idx = zeros(non_zeros, 1);
idx = 1;

for i = 2:nx-1
    for j = 2:ny-1
        for k = 2:nz-1
            l = i + (j-1)*nx + (k-1)*nx*ny; 

            values(idx) = (diff(i+1,j,k)-diff(i,j,k))/hx2 + 2.0 * diff(i,j,k)/hx2 + (diff(i,j+1,k)-diff(i,j,k))/hy2 + 2.0 * diff(i,j,k)/hy2 + (diff(i,j,k+1)-diff(i,j,k))/hz2 + 2.0 * diff(i,j,k)/hz2;
            row_idx(idx) = l;
            col_idx(idx) = l;

            values(idx + 1) = - diff(i,j,k)/hx2; 
            row_idx(idx + 1) = l;
            col_idx(idx + 1) = l-1;

            values(idx + 2) = (-diff(i+1,j,k)+diff(i,j,k))/hx2 - diff(i,j,k)/hx2; 
            row_idx(idx + 2) = l;
            col_idx(idx + 2) = l+1;

            values(idx + 3) = - diff(i,j,k)/hy2;
            row_idx(idx + 3) = l;
            col_idx(idx + 3) = l-nx;

            values(idx + 4) = (-diff(i,j+1,k)+diff(i,j,k))/hy2 - diff(i,j,k)/hy2;
            row_idx(idx + 4) = l;
            col_idx(idx + 4) = l+nx;

            values(idx + 5) = - diff(i,j,k)/hz2; 
            row_idx(idx + 5) = l;
            col_idx(idx + 5) = l-nx*ny;

            values(idx + 6) = (-diff(i,j,k+1)+diff(i,j,k))/hz2 - diff(i,j,k)/hz2;
            row_idx(idx + 6) = l;
            col_idx(idx + 6) = l+nx*ny;

            idx = idx + 7;
        end
    end
end

% Create the sparse matrix A
A = sparse(row_idx(1:idx-1), col_idx(1:idx-1), values(1:idx-1), nx*ny*nz, nx*ny*nz);

%Initial condition vector
[xmat,ymat,zmat] = meshgrid(xsol,ysol,zsol);
U0 = u0(xmat,ymat,zmat);
%U0 = reshape(U0',[],1); 
U0=permute(U0,[2 1 3]);
U0=U0(:);
dimx = size(U0,1);

%Time grid and step size
fprintf("Setting up exponential integrators...\n");
steps = 100;
tau = (T-t0)/steps;
t = t0:tau:T;

%%%Exponential Euler method%%%
fprintf("Computing exponential integrators...\n");
U = zeros(dimx,steps+1);
U(:,1) = U0;
for i = 1:steps
    Fu = rho*U(:,i).*(1-U(:,i));
    U(:,i+1) = U(:,i)+tau*my_phiB(-tau*A,Fu-A*U(:,i));

    show_progress(i, steps);
end
% write_solution_to_files;

fprintf("Done\n");

