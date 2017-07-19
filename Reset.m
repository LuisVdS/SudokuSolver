function Reset(~,~)
%ERASE Summary of this function goes here
%   Detailed explanation goes here

    answer=questdlg({'Êtes-vous sûr de vouloir réinitialiser la grille ?';'Cette action est irréversible.'},'SDKR', 'Oui','Non','Non');
    switch answer
        case 'Oui'
            uistruct=guidata(gcbf);
            hcell=uistruct.hcell;

            for ind = 1:length(hcell)
                if hcell(ind).ForegroundColor(3) == 1 && hcell(ind).ForegroundColor(2) == 0 && hcell(ind).ForegroundColor(1) == 0
                    % do nothing
                else
                    hcell(ind).String = '';
                end
            end 
        case 'Non'
            return
    end
    
    
end

