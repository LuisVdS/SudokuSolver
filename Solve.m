function Solve(~,~)
%SOLVE Summary of this function goes here
%   Detailed explanation goes here

    % Récupération des données et méta-données liées à l'interface
    % graphique
    uistruct=guidata(gcbf);
    hcell=uistruct.hcell;
    dim=uistruct.dim;

    fnd=999;
    while fnd~=0
        matrix=zeros(sqrt(length(hcell)));
        % Création matrice
        for ind = 1:length(hcell)
            matrix(ind) = str2double(hcell(ind).String);
        end
        
        % Création et pré-allocation des cellules intermédiaires
        cell_inter=cell(size(matrix,1),size(matrix,2));
        cell_lig=cell(size(matrix,1),size(matrix,2));
        cell_col=cell(size(matrix,1),size(matrix,2));
        cell_squ=cell(size(matrix,1),size(matrix,2));
        
        % Création de cellule des possibilités
        cellp=cell(size(matrix,1),size(matrix,2));
        numbers=1:dim^2;
        
        % Initialisation compteur chiffres insérés
        fnd=0;
        
        % Recherche sur contraintes de bases
        for ind = 1:length(hcell)
            [lig,col,squ]=hcell2lcs(dim,ind);
            if ~isnan(matrix(ind))
                cellp{ind}=NaN;
            else
                cell_lig{ind}=setdiff(numbers,matrix(lig,:));
                cell_col{ind}=setdiff(numbers,matrix(:,col));
                
                cell_inter{ind}=intersect(cell_lig{ind},cell_col{ind});
                
                squmat=squ2hcells(dim,squ);
                cell_squ{ind}=setdiff(numbers,matrix(squmat));
                
                cellp{ind}=intersect(cell_inter{ind},cell_squ{ind});
                
                if length(cellp{ind})==1 && ~isnan(cellp{ind})
                    hcell(ind).String = num2str(cellp{ind});
                    fnd=fnd+1;
                end
            end
        end
        
        % Recherche de valeurs uniques par ligne, colonne et région
        % sur les ensembles possibles
        
        % par ligne
        for ind=1:size(cellp,1)
            nblist=[];
            for jnd=1:size(cellp,2)
                if ~isnan(cellp{ind,jnd})
                    nblist=unique(union(nblist,cellp{ind,jnd}));
                end
            end
            
            nblist=nblist';
            nblist(2,:)=0;
            for knd=1:size(nblist,2)
                for jnd=1:size(cellp,2)
                    if sum(cellp{ind,jnd}==nblist(1,knd))==1
                        nblist(2,knd)=nblist(2,knd)+1;
                    end
                end
            end
            
            tempmat=nblist(2,:)==1;
            tempmat=[tempmat ; tempmat];
            nblist=nblist(tempmat);
            if ~isempty(nblist)
                for knd = 1:size(nblist,2)
                    for jnd=1:size(cellp,2)
                        if sum(cellp{ind,jnd}==nblist(1,knd))==1
                            hcell(ind+(dim^2)*(jnd-1)).String = num2str(nblist(1,knd));
                            fnd=fnd+1;
                        end
                    end
                end
            end
            
        end
        
        % par colonne
        for jnd=1:size(cellp,2)
            nblist=[];
            for ind=1:size(cellp,1)
                if ~isnan(cellp{ind,jnd})
                    nblist=unique(union(nblist,cellp{ind,jnd}));
                end
            end
            
            nblist=nblist';
            nblist(2,:)=0;
            for knd=1:size(nblist,2)
                for ind=1:size(cellp,1)
                    if sum(cellp{ind,jnd}==nblist(1,knd))==1
                        nblist(2,knd)=nblist(2,knd)+1;
                    end
                end
            end
            
            tempmat=nblist(2,:)==1;
            tempmat=[tempmat ; tempmat];
            nblist=nblist(tempmat);
            if ~isempty(nblist)
                for knd = 1:size(nblist,2)
                    for ind=1:size(cellp,2)
                        if sum(cellp{ind,jnd}==nblist(1,knd))==1
                            hcell(ind+(dim^2)*(jnd-1)).String = num2str(nblist(1,knd));
                            fnd=fnd+1;
                        end
                    end
                end
            end
            
        end

    
   
    % par région (à créer)
    for ind=1:sqrt(length(hcell))
        mat=squ2hcells(dim,ind);
        nblist=[];
        for jnd=1:size(mat,1)*size(mat,2)
            if ~isnan(cellp{mat(jnd)})
                nblist=unique(union(nblist,cellp{mat(jnd)}));
            end
        end
        
        nblist=nblist';
        nblist(2,:)=0;
        for knd=1:size(nblist,2)
            for jnd=1:size(mat,1)*size(mat,2)
                if sum(cellp{mat(jnd)}==nblist(1,knd))==1
                    nblist(2,knd)=nblist(2,knd)+1;
                end
            end
        end     
        
         tempmat=nblist(2,:)==1;
         tempmat=[tempmat ; tempmat];
         nblist=nblist(tempmat);
         if ~isempty(nblist)
             for knd = 1:size(nblist,2)
                 for jnd=1:size(mat,1)*size(mat,2)
                     if sum(cellp{mat(jnd)}==nblist(1,knd))==1
                         hcell(mat(jnd)).String = num2str(nblist(1,knd));
                         fnd=fnd+1;
                     end
                 end
             end
         end   
    end
    
end
    %msgbox(['round de résolution effectué - nb cases: ' num2str(fnd)])
end

