nbVars = [50, 100, 200, 500];
nbNodes = [5000008, 2000033, 1001933, 503386];

multipleGcc = [9760, 17126, 39883, 241321] ./ nbNodes * 1000;
segments = [3461, 1791, 1487, 1071] ./ nbNodes * 1000;
fenwick = [4211, 2301, 1982, 1227] ./ nbNodes * 1000;
embedded = [3523, 2205, 2376, 2148] ./ nbNodes * 1000;

loglog(nbVars, multipleGcc, '.-', nbVars, segments, '.-', nbVars, fenwick, '.-', nbVars, embedded, '.-');
xlabel('Number of variables')
ylabel('Time per node (micros)')
legend('Multiple GCCFWCs', 'PrefixCC Segments', 'PrefixCC Fenwick', 'PrefixCC Embedded GCCFWCs');

% See http://stackoverflow.com/questions/4133510/axis-equal-in-a-matlab-loglog-plot
xLimits = [10 1000];                   %# Limits for the x axis
yLimits = [min([min(multipleGcc), min(segments), min(fenwick), min(embedded)]),...
    max([max(multipleGcc), max(segments), max(fenwick), max(embedded)])];                      %# Limits for the y axis
logScale = diff(yLimits)/diff(xLimits);  %# Scale between the x and y ranges
powerScale = diff(log10(yLimits))/...    %# Scale between the x and y powers
             diff(log10(xLimits));
set(gca,'Xlim',xLimits,'YLim',yLimits,...              %# Set the limits and the
        'DataAspectRatio',[1 logScale/powerScale 1]);  %#   data aspect ratio
