function [ mat ] = squ2hcells(dim,squnb)
%LIG2HCELLS Summary of this function goes here
%   Detailed explanation goes here

% calcul
ligsqu=mod(squnb,dim);
if ligsqu==0
    ligsqu=dim;
end
colsqu=ceil(squnb/dim);

mat=zeros(dim,dim);
for ind=1:dim
    for jnd=1:dim
        mat(jnd,ind)=1+(ligsqu-1)*dim +(colsqu-1)*dim^3+(jnd-1)+(ind-1)*dim^2;
    end
end

end

