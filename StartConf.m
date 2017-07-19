function StartConf(hobj,~)
%STARTCONF Summary of this function goes here
%   Detailed explanation goes here

    uistruct=guidata(gcbf);
    hcell=uistruct.hcell;
    
    for ind = 1:length(hcell)
        if ~isempty(hcell(ind).String)
            hcell(ind).ForegroundColor = [0 0 1];
            hcell(ind).Enable = 'inactive';
        end
    end   
    hobj.Enable = 'Off';
    uidata=guihandles(gcbf);
    uidata.ResetButton.Enable = 'On';
    uidata.SolveButton.Enable = 'On';
    
end

