function [ vect ] = lig2hcells(dim,lignb)
%LIG2HCELLS Summary of this function goes here
%   Detailed explanation goes here

vect=zeros(1,dim^2);
for ind=1:dim^2
    vect(ind)=lignb+(ind-1)*dim^2;
end

end

