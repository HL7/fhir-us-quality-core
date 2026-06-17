Instance: health-concern-example
InstanceOf: USQualityCoreConditionProblemsHealthConcerns
Title: "Condition Problems Health Concerns example"
Description: "Example of a patient with a condition encounter health concern regarding obesity"
Usage: #example
* meta
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-name"
    * valueString = "Health Concern Example"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/instance-description"
    * valueMarkdown = "This example of a US Quality Core Condition Problems and Health Concerns Profile illustrates its use to capture information about a patient's health concern."
* extension
  * url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
  * valueDateTime = "2007-12-14"
* clinicalStatus = $condition-clinical#active "Active"
  * text = "Active"
* verificationStatus = $condition-ver-status#confirmed "Confirmed"
  * text = "Confirmed"
* category = USCoreConditionCategoryExtensionCodes#health-concern "Health Concern"
  * text = "Health Concern"
* code = $sct#247824007 "Fear of becoming fat"
  * text = "Fear of becoming fat"
* subject.reference = "Patient/example"
* onsetDateTime = "2007-12-14"
* recordedDate = "2007-12-14T07:15:07-08:00"