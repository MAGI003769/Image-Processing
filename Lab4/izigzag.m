function mat_out = izigzag(mat_in, vmax, hmax)
%----------------------------------------------------------------------
% This function is to do inverse zigzag scan to 
% recover the original matrix before zigzag operation
% Args:
%   mat_in: input matrix to recovered  
%   vmax: expected output row
%   hmax: expected ouput column
% Returns:
%   mat_out: recovered matrix
%----------------------------------------------------------------------
h = 1;
v = 1;
vmin = 1;
hmin = 1;
mat_out = zeros(vmax, hmax);
i = 1;

while ((v <= vmax) && (h <= hmax))
    if (mod(h + v, 2) == 0)                
        if (v == vmin)
            mat_out(v, h) = mat_in(i);
            if (h == hmax)
	          v = v + 1;
	    else
              h = h + 1;
            end;
            i = i + 1;
        elseif ((h == hmax) && (v < vmax))
            mat_out(v, h) = mat_in(i);
            v = v + 1;
            i = i + 1;
        elseif ((v > vmin) && (h < hmax))
            mat_out(v, h) = mat_in(i);
            v = v - 1;
            h = h + 1;
            i = i + 1;
        end;        
    else                                   
       if ((v == vmax) && (h <= hmax))
            mat_out(v, h) = mat_in(i);
            h = h + 1;
            i = i + 1;       
       elseif (h == hmin)
            mat_out(v, h) = mat_in(i);
            if (v == vmax)
	      h = h + 1;
	    else
              v = v + 1;
            end;
            i = i + 1;
       elseif ((v < vmax) && (h > hmin))
            mat_out(v, h) = mat_in(i);
            v = v + 1;
            h = h - 1;
            i = i + 1;
        end;
    end;
    if ((v == vmax) && (h == hmax))
        mat_out(v, h) = mat_in(i);
        break
    end;
end;