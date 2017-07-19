function Erase(~,~)
%ERASE Summary of this function goes here
%   Detailed explanation goes here

    answer=questdlg({'Êtes-vous sûr de vouloir effacer la grille ?';'Cette action est irréversible.'},'SDKR', 'Oui','Non','Non');
    switch answer
        case 'Oui'
            uistruct=guidata(gcbf);
            hcell=uistruct.hcell;
    
            for ind = 1:length(hcell)
                hcell(ind).String='';
                hcell(ind).ForegroundColor = [0 0 0];
                hcell(ind).Enable = 'on';
            end
        case 'Non'
            return
    end
    
    uidata=guihandles(gcbf);
    uidata.StartConfButton.Enable = 'on';
    uidata.ResetButton.Enable = 'off';
    
end

