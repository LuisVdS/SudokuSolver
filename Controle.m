function Controle(hobj,~)
%CONTROLE Summary of this function goes here
%   Detailed explanation goes here

% Récupération des données et meta-données de l'UI
uidata=guihandles(gcbf);
uidata.EraseButton.Enable='On';

uistruct=guidata(gcbf);
hcell=uistruct.hcell;

% Initialisation du fond de couleur en blanc + chiffre en noir
for ind =1:length(hcell)
    hcell(ind).BackgroundColor=[1 1 1];
end
hobj.ForegroundColor = [0 0 0];

matrix=zeros(sqrt(length(hcell)));
% Création matrice
for ind = 1:length(hcell)
    matrix(ind) = str2double(hcell(ind).String);
end

CheckLine(matrix,hobj)
CheckColumn(matrix,hobj)
CheckSquare(matrix,hobj)

end

function CheckLine (mat,hobj) % attention manque le passage de la dimension
    
   uistruct=guidata(gcbf);
   hcell=uistruct.hcell;
   dim=uistruct.dim;
   
   for ind=1:size(mat,1)
       if length(mat(ind,:)) ~= length(unique(mat(ind,:)))
%            herr=errordlg(['Erreur ligne - n°' num2str(ind)]);
%            uiwait(herr) 
           hcellnb=lig2hcells(dim,ind);
           for jnd=1:length(hcellnb)
               hcell(hcellnb(jnd)).BackgroundColor=[0.99 0.92 0.0];
           end
           hobj.ForegroundColor=[1 0 0];
       end          
   end
end

function CheckColumn (mat,hobj) % attention manque le passage de la dimension

   uistruct=guidata(gcbf);
   hcell=uistruct.hcell;
   dim=uistruct.dim;
   
   for ind=1:size(mat,2)
       if length(mat(:,ind)) ~= length(unique(mat(:,ind)))
%            herr=errordlg(['Erreur colonne - n°' num2str(ind)]);
%            uiwait(herr)
           hcellnb=col2hcells(dim,ind);
           for jnd=1:length(hcellnb)
               hcell(hcellnb(jnd)).BackgroundColor=[0.99 0.92 0.0];
           end
           hobj.ForegroundColor=[1 0 0];
       end          
   end
end

function CheckSquare (mat,hobj)

    uistruct=guidata(gcbf);
    hcell=uistruct.hcell;
    dim=uistruct.dim;
    
    for ind=1:dim^2
        squmat=squ2hcells(dim,ind);
        if length(reshape(mat(squmat),1,dim^2)) ~= length(unique(mat(squmat)))
%             herr=errordlg(['Erreur grand carré - n°' num2str(ind)]);
%             uiwait(herr)
            for jnd=1:dim^2
                hcell(squmat(jnd)).BackgroundColor = [0.99 0.92 0.0];
            end
            hobj.ForegroundColor=[1 0 0];
        end
        
    end
end


