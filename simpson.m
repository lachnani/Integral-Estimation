function [area,xarr,yarr] = simpson(a,b,ep,level,levelMax)
%SIMPSON estimates integral using simpson's rule
%   Requires function fsimp

level = level+1;
h = b-a;
c = (a+b)/2;
onesim = (h/6)*(fsimp(a) + 4*fsimp(c) + fsimp(b));
d = (a+c)/2;
e = (c+b)/2;
twosim = (h/12)*(fsimp(a) + 4*fsimp(d) + 2*fsimp(c) + 4*fsimp(e) + fsimp(b));
if level >= levelMax
    area = twosim;
%    disp('Maximum level reached');
else
    if abs(twosim - onesim)<15*ep
        area = twosim + (twosim-onesim)/15;
    else
        leftsim= simpson(a,c,ep/2,level,levelMax);
        rightsim = simpson(c,b,ep/2,level,levelMax);
        area = leftsim+rightsim;
        fprintf('%6.2f     %6.2f     %6.2f     %6.2f     %6.2f     %6.2f    %12.6f\n',a,d,c,e,b,h,area);
        xarr = [a,d,c,e,b];
        yarr = fsimp(xarr);
    end
end
end

