function [vct_out] = entropy_enc(vct_in);
data{1} = vct_in(:);

varargout = Arith07(data);

vct_out = varargout;

return  %||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
