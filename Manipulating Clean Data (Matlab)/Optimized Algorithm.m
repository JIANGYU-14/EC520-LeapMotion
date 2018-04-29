clear

xsmp = xlsread('bu5.xls','A:A'); % Input New Shape
ysmp = xlsread('bu5.xls','B:B');

a = squaredis(xsmp,ysmp);
b = circledis(xsmp,ysmp);
c = triangledis(xsmp,ysmp);
d = newshape(xsmp,ysmp);
e = newshape2(xsmp,ysmp);

combo = [a b c d e];
ret = find(combo==min(combo));

switch ret
    case 1
        fprintf('This is a Square!\n');
    case 2
        fprintf('This is a Circle!\n');
    case 3
        fprintf('This is a Triangle!\n');
    case 4
        fprintf('This is a Trapezoid!\n');
    case 5
        fprintf('This is Boston University!\n');
end

function sq = squaredis(xsmp,ysmp)
    xsquare = xlsread('square1.xls','A:A');
    ysquare = xlsread('square1.xls','B:B');
    square = [xsquare ysquare];
    
    xmid_square = mean(xsquare);
    ymid_square = mean(ysquare);
    
    xmid_smp = mean(xsmp);
    ymid_smp = mean(ysmp);
    xdiff = xmid_smp - xmid_square;
    ydiff = ymid_smp - ymid_square;
    xsmp_shift = xsmp - xdiff;
    ysmp_shift = ysmp - ydiff;
    smp_shift = [xsmp_shift ysmp_shift];
    [~, Dsq] = knnsearch(square,smp_shift);
    sq = sum(Dsq);
end

function cr = circledis(xsmp,ysmp)
    xcircle = xlsread('circle2.xls','A:A');
    ycircle = xlsread('circle2.xls','B:B');
    circle = [xcircle ycircle];
    
    xmid_circle = mean(xcircle);
    ymid_circle = mean(ycircle);

    xmid_smp = mean(xsmp);
    ymid_smp = mean(ysmp);
    xdiff = xmid_smp - xmid_circle;
    ydiff = ymid_smp - ymid_circle;
    xsmp_shift = xsmp - xdiff;
    ysmp_shift = ysmp - ydiff;
    smp_shift = [xsmp_shift ysmp_shift];
    [~, Dsq] = knnsearch(circle,smp_shift);
    cr = sum(Dsq);
end

function tr = triangledis(xsmp,ysmp)
    xtriangle = xlsread('triangle2.xls','A:A');
    ytriangle = xlsread('triangle2.xls','B:B');
    triangle = [xtriangle ytriangle];
    
    xmid_triangle = mean(xtriangle);
    ymid_triangle = mean(ytriangle);

    xmid_smp = mean(xsmp);
    ymid_smp = mean(ysmp);
    xdiff = xmid_smp - xmid_triangle;
    ydiff = ymid_smp - ymid_triangle;
    xsmp_shift = xsmp - xdiff;
    ysmp_shift = ysmp - ydiff;
    smp_shift = [xsmp_shift ysmp_shift];
    [~, Dsq] = knnsearch(triangle,smp_shift);
    tr = sum(Dsq);
end

function ns = newshape(xsmp,ysmp)
    xnew = xlsread('trapezoid0.xls','A:A');
    ynew = xlsread('trapezoid0.xls','B:B');
    new = [xnew ynew];
    
    xmid_new = mean(xnew);
    ymid_new = mean(ynew);

    xmid_smp = mean(xsmp);
    ymid_smp = mean(ysmp);
    xdiff = xmid_smp - xmid_new;
    ydiff = ymid_smp - ymid_new;
    xsmp_shift = xsmp - xdiff;
    ysmp_shift = ysmp - ydiff;
    smp_shift = [xsmp_shift ysmp_shift];
    [~, Dsq] = knnsearch(new,smp_shift);
    ns = sum(Dsq);
end

function ns2 = newshape2(xsmp,ysmp)
    xnew2 = xlsread('bu4.xls','A:A');
    ynew2 = xlsread('bu4.xls','B:B');
    new2 = [xnew2 ynew2];
    
    xmid_new2 = mean(xnew2);
    ymid_new2 = mean(ynew2);

    xmid_smp = mean(xsmp);
    ymid_smp = mean(ysmp);
    xdiff = xmid_smp - xmid_new2;
    ydiff = ymid_smp - ymid_new2;
    xsmp_shift = xsmp - xdiff;
    ysmp_shift = ysmp - ydiff;
    smp_shift = [xsmp_shift ysmp_shift];
    [~, Dsq] = knnsearch(new2,smp_shift);
    ns2 = sum(Dsq);
end