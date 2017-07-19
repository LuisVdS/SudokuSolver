function [lig,col,square] = hcell2lcs( dim,hcellnb )
%HCELL2LCS Summary of this function goes here
%   Detailed explanation goes here

    % Test sur hcellnb vs. dim
    if hcellnb < 1 || dim^4 < hcellnb
        h_err = errordlg('numéro de case impossible par rapport à dimension de la grille','SDKR');
        uiwait(h_err)
        return
    end
    % Détermination des numéros de lignes et colonnes
    lig=mod(hcellnb,dim^2);
    if lig==0
        lig=dim^2;
        col=hcellnb/dim^2;
    else
        col=floor(hcellnb/dim^2)+1;
    end
    
    % Détermination du numéro du grand carré
    ligsqu=ceil(lig/dim);
    colsqu=ceil(col/dim);
    
    square = ligsqu + (colsqu-1)*dim;
    
end

