function [ vect ] = col2hcells(dim,colnb)
%LIG2HCELLS Summary of this function goes here
%   Detailed explanation goes here

vect=zeros(dim^2,1);
for ind=1:dim^2
    vect(ind)=1+(colnb-1)*9+(ind-1);
end

end

