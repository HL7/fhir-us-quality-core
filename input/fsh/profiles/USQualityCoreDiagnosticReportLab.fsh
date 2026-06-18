Profile: USQualityCoreDiagnosticReportLab
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-diagnosticreport-lab|9.0.0
Id: us-quality-core-diagnosticreport-lab
Title: "US Quality Core DiagnosticReport Profile for Laboratory Results Reporting"
Description: "Profile of DiagnosticReport for laboratory results for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* basedOn ^short = "What was requested"
* basedOn ^mustSupport = false
* basedOn
  * ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-careplan"
  * ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-immunizationrecommendation"
  * ^type[0].targetProfile[2] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationrequest"
  * ^type[0].targetProfile[3] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-nutritionorder"
  * ^type[0].targetProfile[4] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-servicerequest"
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
* category only CodeableConcept
* category SU
* category from DiagnosticServiceSectionCodes (preferred)
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Service category"
  * ^isModifier = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "DiagnosticServiceSection"
  * ^binding.description = "Codes for diagnostic service sections."
* category[LaboratorySlice] only CodeableConcept
* category[LaboratorySlice] = $v2-0074#LAB
* category[LaboratorySlice] SU
* category[LaboratorySlice] from DiagnosticServiceSectionCodes (preferred)
  * ^short = "Service category"
  * ^isModifier = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "DiagnosticServiceSection"
  * ^binding.description = "Codes for diagnostic service sections."
* code 1..1 MS SU
* code only CodeableConcept
* code from USCoreLaboratoryTestCodes (extensible)
  * ^short = "US Core Laboratory Report Order Code"
  * ^definition = "The test, panel or battery that was ordered."
  * ^comment = "UsageNote= The typical patterns for codes are:  1)  a LOINC code either as a  translation from a \"local\" code or as a primary code, or 2)  a local code only if no suitable LOINC exists,  or 3)  both the local and the LOINC translation.   Systems SHALL be capable of sending the local code if one exists."
  * ^alias[0] = "Type"
  * ^base.path = "DiagnosticReport.code"
  * ^base.min = 1
  * ^base.max = "1"
  * ^isModifier = false
  * ^binding.description = "LOINC codes"
* subject only Reference(USQualityCorePatient)
  * ^short = "The subject of the report - usually, but not always, the patient"
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter associated with DiagnosticReport"
* effective[x] only dateTime or Period
* effective[x] SU
  * ^short = "Diagnostically relevant time (typically the time of specimen collection)"
  * ^isModifier = false
* issued 0..1 MS SU
* issued only instant
  * ^short = "DateTime this version was made"
  * ^definition = "The date and time that this version of the report was made available to providers, typically after the report was reviewed and verified."
  * ^comment = "May be different from the update time of the resource itself, because that is the status of the record (potentially a secondary copy), not the actual release time of the report."
  * ^requirements = "Clinicians need to be able to check the date that the report was released."
  * ^alias[0] = "Date published"
  * ^alias[+] = "Date Issued"
  * ^alias[+] = "Date Verified"
  * ^base.path = "DiagnosticReport.issued"
  * ^base.min = 0
  * ^base.max = "1"
  * ^condition[0] = "us-core-9"
  * ^isModifier = false
* performer only Reference(USQualityCorePractitioner or USQualityCorePractitionerRole or USQualityCoreOrganization)
  * ^short = "Responsible Diagnostic Service"
* result only Reference(USQualityCoreObservationLab)
  * ^short = "Observations"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreDiagnosticReportLab
