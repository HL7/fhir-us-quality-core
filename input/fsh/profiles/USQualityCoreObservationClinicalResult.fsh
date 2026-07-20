Profile: USQualityCoreObservationClinicalResult
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-clinical-result|9.0.0
Id: us-quality-core-observation-clinical-result
Title: "US Quality Core Observation Clinical Result"
Description: "This profile sets minimum expectations for the Observation resource to record and search non-laboratory clinical test results (e.g., radiology and other clinical observations generated from procedures). An example would be when a gastroenterologist reports the size of a polyp observed during a colonoscopy. This profile is the basis for the US Core Clinical Result Profile, which defines additional data elements to record and search laboratory test results."
* ^version = "1.0.0"
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^copyright = "Used by permission of HL7 International, all rights reserved Creative Commons License"
* status ^short = "registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown"
* category 1..*
* category from $observation-category-vs (preferred)
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Classification of  type of observation"
  * ^definition = "A code that classifies the general type of observation being made."
  * ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set."
  * ^requirements = "Used for filtering what observations are retrieved and displayed."
  * ^base.path = "Observation.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ObservationCategory"
  * ^binding.description = "Codes for high level observation categories."
* category[us-core] 0..*
* category[us-core] only CodeableConcept
* category[us-core] from USCoreClinicalResultObservationCategory (required)
  * ^short = "Classification of type of observation"
  * ^definition = "A code that classifies the general type of observation being made."
  * ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set."
  * ^requirements = "Used for filtering what observations are retrieved and displayed."
  * ^base.path = "Observation.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
* code SU
* code from LOINCCodes (extensible)
  * ^short = "Clinical Test or Procedure Name"
  * ^isModifier = false
* subject 1..
* subject only Reference(USQualityCorePatient or Group or USCoreDeviceProfile or USQualityCoreLocation)
  * ^short = "Who and/or what the observation is about"
  // Restore the target-profile must-support flags. US Core sets these, but the `only` rule above drops them (leaving null _targetProfile entries) when the us-core-* profiles are replaced by us-quality-core-* profiles.
  * ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
  * ^type[0].targetProfile[0].extension.valueBoolean = true
  * ^type[0].targetProfile[3].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
  * ^type[0].targetProfile[3].extension.valueBoolean = false
* effective[x] only dateTime or Period or Timing or instant
  * ^short = "Clinically relevant time/time-period for observation"
  * ^isModifier = false
* value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
  * ^short = "Result Value"
* dataAbsentReason from DataAbsentReason (extensible)
  * ^short = "Why the result is missing"
  * ^isModifier = false
  * ^isSummary = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ObservationValueAbsentReason"
  * ^binding.description = "Codes specifying why the result (`Observation.value[x]`) is missing."
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreObservationClinicalResult
