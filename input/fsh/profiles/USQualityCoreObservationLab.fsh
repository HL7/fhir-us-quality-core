Profile: USQualityCoreObservationLab
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-lab|9.0.0
Id: us-quality-core-observation-lab
Title: "US Quality Core Laboratory Result Observation"
Description: "The US Quality Core Laboratory Result Observation Profile is based upon the US Laboratory Result Observation Resource.  Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* meta.lastUpdated ^short = "When the resource last changed"
* status ^short = "registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown"
* category ..*
* category only CodeableConcept
* category from $observation-category-vs (preferred)
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "Classification of type of observation"
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
* category[us-core] 1..1
* category[us-core] only CodeableConcept
* category[us-core] = $observation-category#laboratory
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
* code only CodeableConcept
* code SU
* code from USCoreLaboratoryTestCodes (extensible)
  * ^short = "Laboratory Test Name"
  * ^definition = "The name of the clinical test or procedure performed on a patient.  A LOINC **SHALL** be used if the concept is present in LOINC."
  * ^comment = "The typical patterns for codes are:  1)  a LOINC code either as a translation from a \"local\" code or as a primary code, or 2)  a local code only if no suitable LOINC exists,  or 3)  both the local and the LOINC translation.   Systems SHALL be capable of sending the local code if one exists.  When using LOINC , Use either the SHORTNAME or LONG_COMMON_NAME field for the display."
  * ^requirements = "Knowing what kind of observation is being made is essential to understanding the observation."
  * ^isModifier = false
  * ^binding.description = "Laboratory LOINC Codes"
* subject 1..
* subject only Reference(USQualityCorePatient)
  * ^short = "Who and/or what the observation is about"
* encounter only Reference(USQualityCoreEncounter)
  * ^short = "Encounter associated with Observation"
* effective[x] only dateTime or Period or Timing or instant
* effective[x] SU
  * ^short = "Clinically relevant time/time-period for observation"
  * ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself."
  * ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](http://hl7.org/fhir/R4/datatypes.html#timing) datatype which allow the measurement to be tied to regular life events."
  * ^requirements = "Knowing when an observation was deemed true is important to its relevance as well as determining trends."
  * ^alias = "Occurrence"
  * ^isModifier = false
* issued only instant
* issued SU
  * ^short = "Date/Time this version was made available"
  * ^definition = "The date and time this version of the observation was made available to providers, typically after the results have been reviewed and verified."
  * ^comment = "For Observations that don’t require review and verification, it may be the same as the [`lastUpdated` ](http://hl7.org/fhir/R4/resource-definitions.html#Meta.lastUpdated) time of the resource itself.  For Observations that do require review and verification for certain updates, it might not be the same as the `lastUpdated` time of the resource itself due to a non-clinically significant update that doesn’t require the new version to be reviewed and verified again."
  * ^isModifier = false
* value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
  * ^short = "Result Value"
  * ^definition = "The Laboratory result value.  If a coded value,  the valueCodeableConcept.code **SHOULD** be selected from [SNOMED CT](http://hl7.org/fhir/ValueSet/uslab-obs-codedresults) if the concept exists. If a numeric value, valueQuantity.code **SHALL** be selected from [UCUM](http://unitsofmeasure.org).  A FHIR [UCUM Codes value set](http://hl7.org/fhir/STU3/valueset-ucum-units.html) that defines all UCUM codes is in the FHIR specification."
* interpretation 0..*
* interpretation only CodeableConcept
* interpretation from ObservationInterpretationCodes (extensible)
  * ^short = "High, low, normal, etc."
  * ^definition = "A categorical assessment of an observation value.  For example, high, low, normal."
  * ^comment = "Historically used for laboratory results (known as 'abnormal flag' ),  its use extends to other use cases where coded interpretations  are relevant.  Often reported as one or more simple compact codes this element is often placed adjacent to the result value in reports and flow sheets to signal the meaning/normalcy status of the result."
  * ^requirements = "For some results, particularly numeric results, an interpretation is necessary to fully understand the significance of a result."
  * ^alias = "Abnormal Flag"
  * ^base.path = "Observation.interpretation"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ObservationInterpretation"
  * ^binding.description = "Codes identifying interpretations of observations."
* referenceRange 0..* MS
  * ^short = "Result reference range"
* specimen ^short = "Specimen used for this observation"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreObservationLab
