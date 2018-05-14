
#################################
### PatientCorePopulatedTable ###
#################################

[PatientID] - a unique ID representing a patient.
[PatientGender] - Male/Female.
[PatientDateOfBirth] - Date Of Birth.
[PatientRace] - African American, Asian, White.
[PatientMaritalStatus] - Single, Married, Divorced, Separated, Widowed.
[PatientLanguage] - English, Icelandic, Spanish.
[PatientPopulationPercentageBelowPoverty] - given in %.

####################################
### AdmissionsCorePopulatedTable ###
####################################

[PatientID] - a unique ID representing a patient.
[AdmissionID] - an admission ID for the patient.
[AdmissionStartDate] - start date.
[AdmissionEndDate] - end date.

#############################################
### AdmissionsDiagnosesCorePopulatedTable ###
#############################################

[PatientID] - a unique ID representing a patient.
[AdmissionID] - an admission ID for the patient.
[PrimaryDiagnosisCode] - ICD10 code for admission's primary diagnosis.
[PrimaryDiagnosisDescription] - admission's primary diagnosis description.

##############################
### LabsCorePopulatedTable ###
##############################

[PatientID] - a unique ID representing a patient.
[AdmissionID] - an admission ID for the patient.
[LabName] - lab's name, including:

CBC: WHITE BLOOD CELL COUNT
CBC: RED BLOOD CELL COUNT
CBC: HEMOGLOBIN
CBC: HEMATOCRIT
CBC: MEAN CORPUSCULAR VOLUME
CBC: MCH
CBC: MCHC
CBC: RDW
CBC: PLATELET COUNT
CBC: ABSOLUTE NEUTROPHILS
CBC: ABSOLUTE LYMPHOCYTES
CBC: NEUTROPHILS
CBC: LYMPHOCYTES
CBC: MONOCYTES
CBC: EOSINOPHILS
CBC: BASOPHILS
METABOLIC: SODIUM
METABOLIC: POTASSIUM
METABOLIC: CHLORIDE
METABOLIC: CARBON DIOXIDE
METABOLIC: ANION GAP
METABOLIC: GLUCOSE
METABOLIC: BUN
METABOLIC: CREATININE
METABOLIC: TOTAL PROTEIN
METABOLIC: ALBUMIN
METABOLIC: CALCIUM
METABOLIC: BILI TOTAL
METABOLIC: AST/SGOT
METABOLIC: ALT/SGPT
METABOLIC: ALK PHOS
URINALYSIS: SPECIFIC GRAVITY
URINALYSIS: PH
URINALYSIS: RED BLOOD CELLS
URINALYSIS: WHITE BLOOD CELLS

[LabValue] - lab's value
[LabUnits] - lab's units.
[LabDateTime] - date.