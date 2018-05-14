classdef Patient
    %Patient
    %   this class represent a patient of the clinic
    
    properties
        ID char
        Gender logical
        DateOfBirth datetime
        Race char
        MaritalStatus char
        Language char
        PopulationPercentageBelowPoverty double
        ImagePath char
        ECGPath char
        Name char
    end
    
    methods
        function obj = Patient(pID,pGender,pDateOfBirth,pRace,pMaritalStatus,pLanguage,pPopulationPercentageBelowPoverty,pImage,pECG,pName)
            if nargin == 1
                lines = strsplit(pID);
                obj.ID = lines{1};
                obj.Gender = strcmp(lines{2},'Male');
                fecha=[lines{3},' ',lines{4}];
                obj.DateOfBirth = datetime(fecha(2:end-1),'Format','yyyy-MM-dd HH:mm:ss.SSS');
                if numel(lines)==8
                    pRace=lines{5};
                else
                    pRace=[lines{5},' ',lines{6}];
                end
                obj.Race=pRace(2:end-1);
                obj.MaritalStatus=lines{end-2};
                obj.Language=lines{end-1};
                obj.PopulationPercentageBelowPoverty=str2double(lines{end});
            elseif nargin >= 7
                obj.ID = pID;
                obj.Gender = pGender;
                obj.DateOfBirth = pDateOfBirth;
                obj.Race = pRace;
                obj.MaritalStatus = pMaritalStatus;
                obj.Language = pLanguage;
                obj.PopulationPercentageBelowPoverty = pPopulationPercentageBelowPoverty;
                obj.ImagePath = pImage;
                obj.ECGPath = pECG;
                obj.Name = pName;
            end
        end
        
        function age = old(obj)
            [y] = split(between(obj.DateOfBirth,datetime('today'),'Years'),{'years'});
            age = y;
        end
    end
end

