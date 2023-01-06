#extracting information for survival analysis 
library("recount3")

ovarian_recount3 <- recount3::create_rse_manual(
  project = "OV",
  project_home = "data_sources/tcga",
  organism = "human",
  annotation = "gencode_v26",
  type = "gene"
)

ovarian_counts <- ovarian_recount3@assays@data@listData$raw_counts
days_to_last_visit <- ovarian_recount3@colData@listData[["tcga.xml_days_to_last_followup"]]
days_to_death <- ovarian_recount3@colData@listData[["tcga.xml_days_to_death"]]
status_at_last_visit <- ovarian_recount3@colData@listData[["tcga.xml_vital_status"]]
stage <- ovarian_recount3@colData@listData[["tcga.xml_stage_event_clinical_stage"]]
year_initial_diagnosis <- ovarian_recount3@colData@listData[["tcga.xml_year_of_initial_pathologic_diagnosis"]]
age_diagnosis <- ovarian_recount3@colData@listData[["tcga.xml_age_at_initial_pathologic_diagnosis"]]
year_followup_from_completed <- ovarian_recount3@colData@listData[["tcga.xml_year_of_form_completion"]]
followup_new_tumor_event <- ovarian_recount3@colData@listData[["tcga.xml_has_new_tumor_events_information"]]
followup_cancer_status <- ovarian_recount3@colData@listData[["tcga.xml_person_neoplasm_cancer_status"]]
ethnicity <- ovarian_recount3@colData@listData[["tcga.xml_ethnicity"]]
race <- ovarian_recount3@colData@listData[["tcga.xml_race_list"]]
followup_ID <- ovarian_recount3@colData@listData[["tcga.cgc_follow_up_id"]]
patient_barcode <- ovarian_recount3@colData@listData[["tcga.xml_bcr_patient_barcode"]]
followup_tumor_statis <- ovarian_recount3@colData@listData[["tcga.cgc_follow_up_tumor_status"]]
therapy <- ovarian_recount3@colData@listData[["tcga.cgc_drug_therapy_drug_name"]]

dataframe <- data.frame(patient_barcode)
dataframe$therapy=therapy
dataframe$age_diagnosis=age_diagnosis
dataframe$days_to_last_visit=days_to_last_visit 
dataframe$days_to_death=days_to_death 
dataframe$status_at_last_visit=status_at_last_visit
dataframe$stage=stage 
dataframe$year_initial_diagnosis=year_initial_diagnosis 
dataframe$year_followup_from_completed=year_followup_from_completed 
dataframe$followup_new_tumor_event=followup_new_tumor_event 
dataframe$followup_cancer_status=followup_cancer_status 
dataframe$ethnicity=ethnicity 
dataframe$race=race 
dataframe$followup_ID=followup_ID  
dataframe$followup_tumor_status=followup_tumor_statis 

write.csv(dataframe,"~/meta_recount_ov_TCGA.csv")



