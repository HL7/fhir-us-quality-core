Profile: USQualityCoreObservationScreeningAssessment
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-screening-assessment|9.0.0
Id: us-quality-core-observation-screening-assessment
Title: "US Quality Core Observation Screening Assessment"
Description: "The US Quality Core Observation Screening Assessment Profile is based upon the US Core Observation Screening Assessment Profile which can be used to represent individual responses, panels of multi-question surveys, and multi-select responses to “check all that apply” questions. The US Quality Core Observation Survey Profile sets minimum expectations for the Observation Resource to record, search, and fetch retrieve observations that represent the questions and responses to form/survey and defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status ^extension[1].url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension[=].valueBoolean = true
  * ^short = "(USCDI+ Quality) registered | preliminary | final | amended | corrected | cancelled | entered-in-error | unknown"
* category ..*
* category only CodeableConcept
* category from $observation-category-vs (required)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^short = "(USCDI+ Quality) Classification of type of observation"
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
* category[survey] 1..1
* category[survey] only CodeableConcept
* category[survey] = $observation-category#survey
* category[survey] from $observation-category-vs (required)
  * ^short = "Classification of  type of observation"
  * ^definition = "A code that classifies the general type of observation being made."
  * ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set."
  * ^requirements = "Used for filtering if the observation is an assessment or screening."
  * ^base.path = "Observation.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ObservationCategory"
  * ^binding.description = "Codes for high level observation categories."
* category[screening-assessment] 0..* MS
* category[screening-assessment] only CodeableConcept
* category[screening-assessment] from USCoreScreeningAssessmentObservationMaximumCategory (required)
  * ^short = "Classification of  type of observation"
  * ^definition = "Categories that a provider may use in their workflow to classify that this Observation is related to a USCDI Health Status/Assessments Data Class."
  * ^comment = "In addition to the required category valueset, this element allows various categorization schemes based on the owner’s definition of the category and effectively multiple categories can be used at once.  The level of granularity is defined by the category concepts in the value set."
  * ^requirements = "Used for filtering the type of screening or assessment observation."
  * ^base.path = "Observation.category"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
* code 1..1 SU
* code only CodeableConcept
* code from http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1267.13 (preferred)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Type of observation (code / type)"
  * ^definition = "Describes what was observed. Sometimes this is called the observation \"name\"."
  * ^comment = "*All* code-value and, if present, component.code-component.value pairs need to be taken into account to correctly understand the meaning of the observation."
  * ^requirements = "Knowing what kind of observation is being made is essential to understanding the observation."
  * ^alias = "Name"
  * ^base.path = "Observation.code"
  * ^base.min = 1
  * ^base.max = "1"
  * ^isModifier = false
* subject 1..
* subject only Reference(USQualityCorePatient or USQualityCoreLocation)
  * ^short = "Who and/or what the observation is about"
* effective[x] 0..1 SU
* effective[x] only dateTime or Period or Timing or instant
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Clinically relevant time/time-period for observation"
  * ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\"."
  * ^comment = "At least a date should be present unless this observation is a historical report."
  * ^requirements = "Knowing when an observation was deemed true is important to its relevance as well as determining trends."
  * ^alias = "Occurrence"
  * ^base.path = "Observation.effective[x]"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* performer only Reference(USQualityCorePractitioner or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitionerRole or USQualityCoreCareTeam or USQualityCoreRelatedPerson)
  * ^short = "Who is responsible for the observation"
  * ^comment = "Some questions on questionnaires are not answered directly (e.g., asserted) by the individual completing the questionnaire, but are derived from answers to one or more other questions. For types of answers, `Observation.performer` should not be specified and `Observation.derivedFrom` should reference the relevant Screening Response Observation(s)."
* value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Actual result"
  * ^comment = "An observation may have a value if it represents an individual survey question and answer pair. An observation should not have a value if it represents a multi-question survey or multi-select “check all that apply” question. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value."
* dataAbsentReason from DataAbsentReason (extensible)
  * ^short = "Why the result is missing"
  * ^definition = "Provides a reason why the expected value in the element Observation.value[x] is missing."
  * ^comment = "\"Null\" or exceptional values can be represented two ways in FHIR Observations.  One way is to simply include them in the value set and represent the exceptions in the value.  The alternate way is to use the value element for actual observations and use the explicit dataAbsentReason element to record exceptional values. For a given LOINC question, if the LOINC answer list includes concepts such as 'unknown' or 'not available', they should be used for Observation.value. Where these concepts are not part of the value set for Observation.value, the Observation.dataAbsentReason can be used if necessary and appropriate."
  * ^requirements = "For many results it is necessary to handle exceptional values in measurements."
  * ^isModifier = false
  * ^isSummary = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ObservationValueAbsentReason"
  * ^binding.description = "Codes specifying why the result (`Observation.value[x]`) is missing."
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
* hasMember only Reference(USQualityCoreObservationScreeningAssessment or QuestionnaireResponse)
  * ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-questionnaireresponse"
  * ^short = "Reference to panel or multi-select responses"
  * ^definition = "Aggregate set of Observations that represent question answer pairs for both multi-question surveys and multi-select questions."
  * ^comment = "This grouping element is used to represent surveys that group several questions together or individual questions with  “check all that apply” responses. For example in the simplest case a flat multi-question survey where the \"panel\" observation is the survey instrument itself and instead of an `Observation.value` the `hasMember` element references other Observation that represent the individual questions answer pairs. In a survey that has a heirarchical grouping of questions, the observation \"panels\" can be nested. Because surveys can be arbitrarily complex structurally, not all survey structures can be represented using this Observation grouping pattern."
* derivedFrom only Reference(USQualityCoreObservationScreeningAssessment or USQualityCoreQuestionnaireResponse)
  * ^short = "Related Observations or QuestionnaireResponses that the observation is made from"
  * ^definition = "Observations or QuestionnaireResponses from which this observation value is derived."
