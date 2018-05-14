classdef Data
    %Data
    %  all info
    properties
        Patients Patient
        indexSe char
        index double
    end
    
    methods
        function obj = Data()
            ID =  fopen('Data.mat');
            if ID ~= -1
                disp('load Data.mat')
                fclose(ID);
                load('Data.mat');
                obj = data;
                clear data
            end
        end
        
        function [obj, index] = add(obj,patient)
            if numel(obj.Patients)==0
                obj.Patients(1)=patient;
                obj.index(1)=1;
                obj.indexSe(1,:)=patient.Name;
            else
                id = patient.ID;
                name = patient.Name;
                lo = 1;
                hi = numel(obj.Patients);
                while lo < hi+1
                    m = floor((lo + hi)/2);
                    idPat = obj.Patients(m).ID;
                    if strcmp(id,idPat)
                        error('ya hay un paciente con el id = %s',id);
                    elseif  string(id) < string(idPat)
                        hi=m-1;
                    else
                        lo=m+1;
                    end
                end
                index = lo;
                
                if index ~=numel(obj.Patients)+1
                    obj.Patients = [obj.Patients(1:index-1),patient,obj.Patients(index:end)];
                else
                    obj.Patients = [obj.Patients,patient];
                end
                
                lo = 1;
                hi = numel(obj.index);
                while lo < hi+1
                    m = floor((lo + hi)/2);
                    namePat = strtrim(obj.indexSe(m,:));
                    if strcmp(name,namePat)
                        break
                    elseif  string(name) < string(namePat)
                        hi=m-1;
                    else
                        lo=m+1;
                    end
                end
                indexSas = lo;
                
                if indexSas~=numel(obj.index)+1
                    obj.indexSe = char(obj.indexSe(1:indexSas-1,:),name,obj.indexSe(indexSas:end,:));
                    obj.index = [obj.index(1:indexSas-1),index,obj.index(indexSas:end)];
                else
                    obj.indexSe = char(obj.indexSe,name);
                    obj.index = [obj.index,index];
                end
            end
        end
        
        function obj = export(obj,basePath)
            PatientCore = [filesep,'PatientCorePopulatedTable382.txt'];
            n = patientLines([basePath,PatientCore]);
            fprintf('Numero de pacientes: %d\nCargando core...\n',n);
            % fuse the patients
            PatientsAux = [obj.Patients,patientsCoreLoader([basePath,PatientCore],n)];
            
            fprintf('Ordenado pacientes...\n');
            [~,indexs] = sort({PatientsAux.ID});
            PatientsAux = PatientsAux(indexs);
            obj.Patients = PatientsAux;
            
            fprintf('imagenes, ECGs y Nombres pacientes...\n');
            PatientsAux = OtherInformationPatient(basePath,obj);
            [obj.indexSe,obj.index] = sort({PatientsAux.Name});
            
            obj.Patients = PatientsAux;
            fprintf('proceso finalizado\n');
        end
        
        function save(data)
            fprintf('saving %d ...\n',numel(data.Patients));
            save('Data.mat','data');
            fprintf('proceso finalizado\n');
        end
        
        function [Patient,index] = getPatient(obj,id)
            lo = 1;
            hi = numel(obj.Patients);
            Patient = 0;
            index = -1;
            while lo < hi+1
                m = floor((lo + hi)/2);
                idPat = obj.Patients(m).ID;
                if strcmp(id,idPat)
                    Patient = obj.Patients(m);
                    index = m;
                    break
                elseif  string(id) < string(idPat)
                    hi=m-1;
                else
                    lo=m+1;
                end
            end
        end
        
        function PatientsF = getPatientNameFilter(obj,id)
            id = upper(id);
            PatientsF(1) = 0;
            lo = 1;
            for i = 1:numel(obj.index)
                if contains(upper(obj.indexSe(i,:)), id)
                    PatientsF(lo) = i;
                    lo = lo + 1;
                end
            end
        end
        
        function [Patient,index] = getPatientByName(obj,name)
            lo = 1;
            hi = numel(obj.index);
            index = -1;
            while lo < hi+1
                m = floor((lo + hi)/2);
                namePat = strtrim(obj.indexSe(m,:));
                if strcmp(name,namePat)
                    index = m;
                    break
                elseif  string(name) < string(namePat)
                    hi=m-1;
                else
                    lo=m+1;
                end
            end
            
            if index == -1
                error('no se encontro el paciente con el nombre');
            end
            index=obj.index(index);
            Patient = obj.Patients(index);
        end
    end
end

function Patients = patientsCoreLoader(PatientCore,n)
Patients(1:n) = Patient;
FileID = fopen(PatientCore,'r');
i = 1;
fgetl(FileID);
tline = fgetl(FileID);
while ischar(tline)
    Patients(i)=Patient(tline);
    i=i+1;
    tline = fgetl(FileID);
end
fclose(FileID);
end

function n = patientLines(PatientCore)
FileID = fopen(PatientCore,'r');
if FileID == -1
    error(['problems opening the file: ',PatientCore]);
end
n = 0;
fgetl(FileID);
tline = fgetl(FileID);
while ischar(tline)
    n = n+1;
    tline = fgetl(FileID);
end
fclose(FileID);
end

function Patients= OtherInformationPatient(basePath,obj)
PatientOtherInformation=[basePath,filesep,'PatientOtherInformation382.txt'];
ecgPath=[basePath,filesep,'ECG',filesep];
photoPath=[basePath,filesep,'PhotoID',filesep];

FileID = fopen(PatientOtherInformation,'r');
if FileID == -1
    error(['problems opening the file: ',PatientOtherInformation]);
end
Patients=obj.Patients;

fgetl(FileID);
tline = fgetl(FileID);
while ischar(tline)
    lines = strsplit(tline);
    Id = lines{end};
    [~, i] = getPatient(obj,Id);
    
    lines2 = [lines(3:end-1);repmat({' '},size(lines(3:end-1)))];
    lines2 = lines2(:)';
    name = [lines2{:}];
    Patients(i).Name=name(2:end-2);
    
    Patients(i).ECGPath = [ecgPath,lines{1}];
    Patients(i).ImagePath = [photoPath,lines{2}];
    
    tline = fgetl(FileID);
end
fclose(FileID);
end