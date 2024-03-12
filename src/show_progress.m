function show_progress(i, steps)
bar_size = 20;
last_size = 1;

if i > 10
    last_size = 2;
end

if i ~= 1
    fprintf(repmat('\b', 1, bar_size + 4 + last_size));
end

progress = round(i / steps * 100);
completed = round(progress/steps * bar_size);
fprintf('[%s%s] %d%%', repmat('#', 1, completed), repmat('-', 1, bar_size - completed), progress);

if i == steps
    fprintf('\n');
end
end

