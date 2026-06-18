Profile: USQualityCoreDiagnosticReportNote
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-note|9.0.0
Id: us-quality-core-diagnosticreport-note
Title: "US Quality Core DiagnosticReport Profile for Report and Note Exchange"
Description: "Profile of DiagnosticReport for Note exchange for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status 1..1 MS ?! SU
* status only code
* status from DiagnosticReportStatus (required)
  * ^short = "registered | partial | preliminary | final +"
  * ^definition = "The status of the diagnostic report."
  * ^requirements = "Diagnostic services routinely issue provisional/incomplete reports, and sometimes withdraw previously released reports."
  * ^base.path = "DiagnosticReport.status"
  * ^base.min = 1
  * ^base.max = "1"
  * ^condition[0] = "us-core-8"
  * ^condition[+] = "us-core-9"
  * ^isModifierReason = "This element is labeled as a modifier because it is a status element that contains status entered-in-error which means that the resource should not be treated as valid"
* category 1..
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Service Category"
* category[us-core] ^short = "Service category"
* code 1..1 SU
* code only CodeableConcept
* code from http://hl7.org/fhir/us/core/ValueSet/us-core-diagnosticreport-report-and-note-codes (extensible)
  * ^short = "US Quality Core Report Code"
  * ^definition = "The test, panel, report, or note that was ordered."
  * ^comment = "The typical patterns for codes are:  1)  a LOINC code either as a translation from a \"local\" code or as a primary code, or 2)  a local code only if no suitable LOINC exists,  or 3)  both the local and the LOINC translation.   Systems SHALL be capable of sending the local code if one exists."
  * ^alias = "Type"
  * ^base.path = "DiagnosticReport.code"
  * ^base.min = 1
  * ^base.max = "1"
  * ^isModifier = false
  * ^binding.description = "LOINC codes"
* subject only Reference(USQualityCorePatient)
  * ^short = "The subject of the report - usually, but not always, the patient"
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Health care event when test ordered"
* effective[x] 0..1 SU
* effective[x] only dateTime or Period
  * ^short = "Diagnostically relevant time (typically the time of the procedure)"
  * ^base.path = "DiagnosticReport.effective[x]"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* issued ^short = "DateTime this version was made"
* performer only Reference(USQualityCorePractitioner or USQualityCoreOrganization)
  * ^short = "Responsible Diagnostic Service"
* result only Reference(USQualityCoreObservationLab or USQualityCoreObservationClinicalResult)
  * ^short = "Observations"
  * ^short = "Reference to full details of imaging associated with the diagnostic report"
* imagingStudy ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-imagingstudy"
* media ^short = "Key images associated with this report"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreDiagnosticReportNote
