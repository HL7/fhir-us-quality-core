Profile: USQualityCoreImagingStudy
Parent: ImagingStudy
Id: us-quality-core-imagingstudy
Title: "US Quality Core ImagingStudy"
Description: "Profile of ImagingStudy for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* subject only Reference(USQualityCorePatient)
  * ^short = "Who or what is the subject of the study"
* encounter 0..1 SU
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter with which this imaging study is associated"
  * ^definition = "The healthcare event (e.g. a patient and healthcare provider interaction) during which this ImagingStudy is made."
  * ^comment = "This will typically be the encounter the event occurred within, but some events may be initiated prior to or after the official completion of an encounter but still be tied to the context of the encounter (e.g. pre-admission test)."
  * ^base.path = "ImagingStudy.encounter"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* started ^short = "When the study was started"
* basedOn only Reference(USQualityCoreServiceRequest or USQualityCoreCarePlan)
  * ^short = "Request fulfilled"
* referrer only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole)
  * ^mustSupport = false
* interpreter only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole)
  * ^mustSupport = false
* procedureReference only Reference(USQualityCoreProcedure)
  * ^short = "The performed Procedure reference"
* location 0..1 SU
* location only Reference(USQualityCoreLocation)
  * ^short = "Where ImagingStudy occurred"
  * ^definition = "The principal physical location where the ImagingStudy was performed."
  * ^requirements = "Ties the event to where the records are likely kept and provides context around the event occurrence (e.g. if it occurred inside or outside a dedicated healthcare setting)."
  * ^base.path = "ImagingStudy.location"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* reasonReference 0..* SU
* reasonReference only Reference(USQualityCoreConditionProblemsHealthConcerns or USQualityCoreSimpleObservation or Media or USQualityCoreDiagnosticReportNote or DocumentReference)
  * ^short = "Why was study performed"
  * ^definition = "Indicates another resource whose existence justifies this Study."
  * ^base.path = "ImagingStudy.reasonReference"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
* series.performer.actor 1..1 SU
* series.performer.actor only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization or USQualityCoreCareTeam or USQualityCorePatient or http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0 or USQualityCoreRelatedPerson)
  * ^short = "Who performed the series"
  * ^definition = "Indicates who or what performed the series."
  * ^base.path = "ImagingStudy.series.performer.actor"
  * ^base.min = 1
  * ^base.max = "1"
  * ^isModifier = false