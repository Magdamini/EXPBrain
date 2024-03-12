filename = sprintf(dir_name + '/brain.vti');
extend = sprintf('%d %d %d %d %d %d %d', 0, nelx, 0, nely, 0, nelz);
origin = sprintf('%d %d %d', x1, y1, z1);
spacing = sprintf('%f %f %f', (x2 - x1) / nelx, (y2 - y1) / nely, (z2 - z1) / nelz);

file = fopen(filename, 'w');

%header
fprintf(file, '<?xml version="1.0"?>\n');
fprintf(file, '<VTKFile type="ImageData" version="0.1">\n');
fprintf(file, '  <ImageData WholeExtent="%s" origin="%s" spacing="%s">\n', extend, origin, spacing);
fprintf(file, '    <Piece Extent="%s">\n', extend);
fprintf(file, '      <PointData Scalars="Brain">\n');
fprintf(file, '        <DataArray Name="Brain"  type="Float64"  format="ascii"  NumberOfComponents="1">\n');

%values
for x = 1:nelx + 1
    for y = 1:nely + 1
        for z = 1:nelz + 1
            fprintf(file, '%f\n', diff(x, y, z));
        end
    end
end


%end
fprintf(file, '        </DataArray>\n');
fprintf(file, '      </PointData>\n');
fprintf(file, '    </Piece>\n');
fprintf(file, '  </ImageData>\n');
fprintf(file, '</VTKFile>\n');

fclose(file);