function LoadGrid(~,~)
%LOADGRID Summary of this function goes here
%   Detailed explanation goes here

Erase

uistruct=guidata(gcbf);
hcell=uistruct.hcell;


hcell(3).String='9';hcell(6).String='5'; % Colonne 1
hcell(11).String='8';hcell(15).String='2';hcell(17).String='1'; % Colonne 2
hcell(21).String='1';hcell(23).String='8';hcell(25).String='7';hcell(27).String='2'; % Colonne 3
hcell(28).String='1';hcell(29).String='4';hcell(31).String='7';hcell(33).String='3'; % Colonne 4
hcell(39).String='6';hcell(43).String='8'; % Colonne 5
hcell(49).String='8';hcell(51).String='4';hcell(53).String='7';hcell(54).String='6'; % Colonne 6
hcell(55).String='3';hcell(57).String='5';hcell(59).String='9';hcell(61).String='6'; % Colonne 7
hcell(65).String='7';hcell(67).String='6';hcell(71).String='4'; % Colonne 8
hcell(76).String='2';hcell(79).String='3'; % Colonne 9

end

