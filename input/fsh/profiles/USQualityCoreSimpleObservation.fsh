Profile: USQualityCoreSimpleObservation
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-simple-observation|9.0.0
Id: us-quality-core-simple-observation
Title: "US Quality Core Simple Observation"
Description: "Profile of Simple Observation for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^alias[0] = "Vital Signs"
  * ^alias[+] = "Measurement"
  * ^alias[+] = "Results"
  * ^alias[+] = "Tests"
  * ^mustSupport = false
* implicitRules ?! SU
  * ^short = "A set of rules under which this content was created"
  * ^definition = "A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc."
  * ^comment = "Asserting this rule set restricts the content to be only understood by a limited set of trading partners. This inherently limits the usefulness of the data in the long term. However, the existing health eco-system is highly fractured, and not yet ready to define, collect, and exchange data in a generally computable sense. Wherever possible, implementers and/or specification writers should avoid using this element. Often, when used, the URL is a reference to an implementation guide that defines these special rules as part of it's narrative along with other profiles, value sets, etc."
  * ^isModifierReason = "This element is labeled as a modifier because the implicit rules may provide additional knowledge about the resource that modifies it's meaning or interpretation"
* modifierExtension 0..* ?!
* modifierExtension only Extension
  * ^short = "Extensions that cannot be ignored"
  * ^definition = "May be used to represent additional information that is not part of the basic definition of the resource and that modifies the understanding of the element that contains it and/or the understanding of the containing element's descendants. Usually modifier elements provide negation or qualification. To make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.\n\nModifier extensions SHALL NOT change the meaning of any elements on Resource or DomainResource (including cannot change the meaning of modifierExtension itself)."
  * ^comment = "There can be no stigma associated with the use of extensions by any application, project, or standard - regardless of the institution or jurisdiction that uses or defines the extensions.  The use of extensions is what allows the FHIR specification to retain a core level of simplicity for everyone."
  * ^requirements = "Modifier extensions allow for extensions that *cannot* be safely ignored to be clearly distinguished from the vast majority of extensions which can be safely ignored.  This promotes interoperability by eliminating the need for implementers to prohibit the presence of extensions. For further information, see the [definition of modifier extensions](http://hl7.org/fhir/R4/extensibility.html#modifierExtension)."
  * ^alias[0] = "extensions"
  * ^alias[+] = "user content"
  * ^base.path = "DomainResource.modifierExtension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifierReason = "Modifier extensions are expected to modify the meaning or interpretation of the resource that contains them"
  * ^isSummary = false
* partOf ^short = "Part of referenced event"
* status ^extension[1].url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension[=].valueBoolean = true
  * ^short = "(USCDI+ Quality) registered | prliminary | final | amended | corrected | cancelled | entered-in-error | unknown"
* category 1..*
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Classification of type of observation"
* category[us-core] ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) US Core classification of type of observation"
* code from LOINCCodes (preferred)
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Type of observation (code / type)"
  * ^binding.description = "This value set specifies the type of observation"
* subject 1..1 SU
* subject only Reference(USQualityCorePatient)
  * ^short = "Who and/or what the observation is about"
  * ^definition = "The patient, or group of patients, location, or device this observation is about and into whose record the observation is placed. If the actual focus of the observation is different from the subject (or a sample of, part, or region of the subject), the `focus` element or the `code` itself specifies the actual focus of the observation."
  * ^comment = "One would expect this element to be a cardinality of 1..1. The only circumstance in which the subject can be missing is when the observation is made by a device that does not know the patient. In this case, the observation SHALL be matched to a patient through some context/channel matching technique, and at this point, the observation should be updated."
  * ^requirements = "Observations have no value if you don't know who or what they're about."
  * ^base.path = "Observation.subject"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* effective[x] 0..1 SU
* effective[x] only dateTime or Period or Timing or instant
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Clinically relevant time/time-period for observation"
  * ^definition = "The time or time-period the observed value is asserted as being true. For biological subjects - e.g. human patients - this is usually called the \"physiologically relevant time\". This is usually either the time of the procedure or of specimen collection, but very often the source of the date/time is not known, only the date/time itself."
  * ^comment = "At least a date should be present unless this observation is a historical report.  For recording imprecise or \"fuzzy\" times (For example, a blood glucose measurement taken \"after breakfast\") use the [Timing](http://hl7.org/fhir/R4/datatypes.html#timing) datatype which allow the measurement to be tied to regular life events."
  * ^requirements = "Knowing when an observation was deemed true is important to its relevance as well as determining trends."
  * ^alias[0] = "Occurrence"
  * ^base.path = "Observation.effective[x]"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* performer only Reference(USQualityCorePractitioner or USQualityCoreOrganization or USQualityCorePatient or USQualityCorePractitionerRole or USQualityCoreCareTeam or USQualityCoreRelatedPerson)
  * ^short = "Who is responsible for the observation"
* value[x] 0..1 SU
* value[x] only Quantity or CodeableConcept or string or boolean or integer or Range or Ratio or SampledData or time or dateTime or Period
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.ordered = false
  * ^slicing.rules = #open
  * ^short = "(USCDI+ Quality) Actual result"
  * ^definition = "The information determined as a result of making the observation, if the information has a simple value."
  * ^comment = "An observation may have; 1)  a single value here, 2)  both a value and a set of related or component values,  or 3)  only a set of related or component values. If a value is present, the datatype for this element should be determined by Observation.code.  A CodeableConcept with just a text would be used instead of a string if the field was usually coded, or if the type associated with the Observation.code defines a coded value.  For additional guidance, see the [Notes section](http://hl7.org/fhir/R4/observation.html#notes) below."
  * ^requirements = "An observation exists to have a value, though it might not if it is in error, or if it represents a group of observations."
  * ^base.path = "Observation.value[x]"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifier = false
* interpretation 0..*
* interpretation only CodeableConcept
* interpretation from ObservationInterpretationCodes (extensible)
  * ^short = "High, low, normal, etc."
  * ^definition = "A categorical assessment of an observation value.  For example, high, low, normal."
  * ^comment = "Historically used for laboratory results (known as 'abnormal flag' ),  its use extends to other use cases where coded interpretations  are relevant.  Often reported as one or more simple compact codes this element is often placed adjacent to the result value in reports and flow sheets to signal the meaning/normalcy status of the result."
  * ^requirements = "For some results, particularly numeric results, an interpretation is necessary to fully understand the significance of a result."
  * ^alias[0] = "Abnormal Flag"
  * ^base.path = "Observation.interpretation"
  * ^base.min = 0
  * ^base.max = "*"
  * ^isModifier = false
  * ^isSummary = false
  * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
  * ^binding.extension.valueString = "ObservationInterpretation"
  * ^binding.description = "Codes identifying interpretations of observations."
* derivedFrom 0..* SU
* derivedFrom only Reference(USQualityCoreSimpleObservation or USQualityCoreQuestionnaireResponse or USQualityCoreImagingStudy or http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference|9.0.0 or Media or MolecularSequence)
  * ^short = "US Core Profiles or other resource the observation is made from"
  * ^definition = "US Core Observations, DocumentReference, QuestionnaireResponse or other resource from which this observation value is derived."
  * ^comment = "All the reference choices that are listed in this element can represent clinical observations and other measurements that may be the source for a derived value.  The most common reference will be another Observation.  For a discussion on the ways Observations can assembled in groups together, see [Notes](http://hl7.org/fhir/R4/observation.html#obsgrouping) below."
  * ^base.path = "Observation.derivedFrom"
  * ^base.min = 0
  * ^base.max = "*"
  * ^mustSupport = false
  * ^isModifier = false
