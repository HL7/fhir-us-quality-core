Profile: USQualityCoreImmunizationRecommendation
Parent: ImmunizationRecommendation
Id: us-quality-core-immunizationrecommendation
Title: "US Quality Core ImmunizationRecommendation"
Description: "Profile of ImmunizationRecommendation for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* patient only Reference(USQualityCorePatient)
  * ^short = "Who this profile is for"
* authority only Reference(USQualityCoreOrganization)
  * ^mustSupport = false
* recommendation ^short = "Vaccine administration recommendations"
  * vaccineCode from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1010.6 (extensible)
    * ^short = "Vaccine or vaccine group recommendation applies to"
    * ^binding.description = "CVX Vaccines Administered Vaccine Set"
  * doseNumber[x] ^short = "Recommended dose number within series"
  * supportingImmunization only Reference(USQualityCoreImmunization or ImmunizationEvaluation)
    * ^mustSupport = false
  * supportingPatientInformation only Reference(USQualityCoreSimpleObservation or USQualityCoreAllergyIntolerance)
    * ^mustSupport = false
