%Plot the solution
hold on
figure
xlabel({'$x$'},'interpreter','latex')
ylabel({'$y$'},'interpreter','latex')
xticks([0 0.25 0.5 0.75 1]);
yticks([0 0.25 0.5 0.75 1]);
set(gca,'TickLabelInterpreter','latex'),set(gca,'fontsize',16)
%ifig=1;
%steps=256;
for i=1:steps+1
   % if ( mod(i,16)==0 )  
      %figure(ifig)   
      %ifig = ifig+1;
      Umat=reshape(U(:,i),[nelx+1,nely+1])';    
      h=pcolor(xsol,ysol,Umat');
      set(h, 'EdgeColor', 'none')
      %mesh(xmat,ymat,Umat);
      colorbar, set(colorbar,'TickLabelInterpreter','latex')
      str = sprintf('Time = %.5f days',t(i));
      set(title(str),'Interpreter','Latex');
      pause
    %endif
end