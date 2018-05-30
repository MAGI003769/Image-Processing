function [block_out] = zigzag(block)

ind = reshape(1:numel(block), size(block)); % indices of elements
ind = fliplr( spdiags( fliplr(ind) ) );     % get the anti-diagonals
ind(:,1:2:end) = flipud( ind(:,1:2:end) );  % reverse order of odd columns
ind(ind==0) = [];                           % keep non-zero indices

block_out = block(ind);

return
