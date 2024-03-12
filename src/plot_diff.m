figure
hold on
for k=1:nz
    k
    h=pcolor(xsol,ysol,diff(:,:,k));
    set(h, 'EdgeColor', 'none')
    colorbar, set(colorbar,'TickLabelInterpreter','latex')
    pause
end
