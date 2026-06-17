Profile: USQualityCoreMedicationStatement
Parent: MedicationStatement
Id: us-quality-core-medicationstatement
Title: "US Quality Core MedicationStatement"
Description: "Profile of MedicationStatement for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status ^short = "active | completed | entered-in-error | intended | stopped | on-hold | unknown | not-taken"
* medication[x] only CodeableConcept or Reference(USQualityCoreMedication)
* medication[x] from $vsac-medication-clinical-drug (preferred)
  * ^short = "What medication was taken"
  * ^binding.description = "The set of RxNorm codes to represent medications"
* subject only Reference(USQualityCorePatient)
  * ^short = "Who is/was taking the medication"
* effective[x] ^short = "The date/time or interval when the medication is/was/will be taken"
* dateAsserted 0..1
  * ^short = "When the statement was asserted?"
* informationSource only Reference(USQualityCorePatient or USQualityCorePractitioner or USQualityCoreRelatedPerson)
  * ^short = "Person or organization that provided the information about the taking of this medication"
* derivedFrom ^short = "Additional supporting information"
* reasonCode only CodeableConcept
  * ^mustSupport = false
* dosage only Dosage
  * ^short = "Details of how medication is/was taken or should be taken"
  * modifierExtension ?!
    * ^requirements = "Modifier extensions allow for extensions that cannot be safely ignored to be clearly distinguished from the vast majority of extensions which can be safely ignored. This promotes interoperability by eliminating the need for implementers to prohibit the presence of extensions."
    * ^mustSupport = false
    * ^isModifierReason = "Modifier extensions are expected to modify the meaning or interpretation of the element that contains them"
  * timing ^short = "When medication should be administered"
  * site ^comment = "If the use case requires attributes from the BodySite resource (e.g. to identify and track separately) then use the standard extension bodySite. May be a summary code, or a reference to a very precise definition of the location, or both."
    * ^mustSupport = false
  * route from SNOMEDCTRouteCodes (preferred)
    * ^short = "How drug should enter body"
  * doseAndRate ^short = "Amount of medication administered"
    * dose[x] ^short = "Amount of medication per dose"