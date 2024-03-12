%Plot the solution
hold on
figure
xlabel({'$x$'},'interpreter','latex')
ylabel({'$y$'},'interpreter','latex')
xticks([0 0.25 0.5 0.75 1]);
yticks([0 0.25 0.5 0.75 1]);
set(gca,'TickLabelInterpreter','latex'),set(gca,'fontsize',16)
for i=1:steps+1
      Umat=reshape(U(:,i),[nelx+1,nely+1,nelz+1]);
      for k=1:nz
          h=pcolor(xsol,ysol,Umat(:,:,k)');
          set(h, 'EdgeColor', 'none')
          %mesh(xmat,ymat,Umat(:,:,k));
          colorbar, set(colorbar,'TickLabelInterpreter','latex')
          str = sprintf('Time = %.3f days, slise = %.3f',t(i),k);
          set(title(str),'Interpreter','Latex');
          pause
      end
      pause
end