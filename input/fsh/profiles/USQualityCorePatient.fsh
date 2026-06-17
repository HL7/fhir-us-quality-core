Profile: USQualityCorePatient
Parent: http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|9.0.0
Id: us-quality-core-patient
Title: "US Quality Core Patient"
Description: "Profile of Patient for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* extension[race] 0..1
* extension[race] only http://hl7.org/fhir/us/core/StructureDefinition/us-core-race|9.0.0
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^type[0].profile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race|9.0.0"
  * ^short = "(USCDI+ Quality) US Core Race Extension"
  * ^definition = "Concepts classifying the person into a named category of humans sharing common history, traits, geographical origin or nationality.  The race codes used to represent these concepts are based upon the [CDC Race and Ethnicity Code Set Version 1.0](http://www.cdc.gov/phin/resources/vocabulary/index.html) which includes over 900 concepts for representing race and ethnicity of which 921 reference race.  The race concepts are grouped by and pre-mapped to the 5 OMB race categories:\n\n   - American Indian or Alaska Native\n   - Asian\n   - Black or African American\n   - Native Hawaiian or Other Pacific Islander\n   - White."
  * ^base.path = "DomainResource.extension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^mustSupport = false
  * ^isModifier = false
* extension[ethnicity] 0..1
* extension[ethnicity] only http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity|9.0.0
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^type[0].profile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity|9.0.0"
  * ^short = "(USCDI+ Quality) US Core ethnicity Extension"
  * ^definition = "Concepts classifying the person into a named category of humans sharing common history, traits, geographical origin or nationality.  The ethnicity codes used to represent these concepts are based upon the [CDC ethnicity and Ethnicity Code Set Version 1.0](http://www.cdc.gov/phin/resources/vocabulary/index.html) which includes over 900 concepts for representing race and ethnicity of which 43 reference ethnicity.  The ethnicity concepts are grouped by and pre-mapped to the 2 OMB ethnicity categories: - Hispanic or Latino - Not Hispanic or Latino."
  * ^base.path = "DomainResource.extension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^mustSupport = false
  * ^isModifier = false
* extension[tribalAffiliation] 0..*
* extension[tribalAffiliation] only http://hl7.org/fhir/us/core/StructureDefinition/us-core-tribal-affiliation|9.0.0
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^type[0].profile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-tribal-affiliation|9.0.0"
  * ^short = "(USCDI+ Quality) Tribal Affiliation Extension"
  * ^definition = "A tribe or band with which a person associates whether or not they are an enrolled member."
  * ^base.path = "DomainResource.extension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^mustSupport = false
  * ^isModifier = false
* extension[sex] 0..1
* extension[sex] only http://hl7.org/fhir/us/core/StructureDefinition/us-core-individual-sex
  * ^type[0].profile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-sex|9.0.0"
  * ^short = "Sex Extension"
  * ^definition = "The US Core Sex Extension is used to reflect the documentation of a person's sex. It aligns with the C-CDA Sex Observation (LOINC 46098-0)."
  * ^base.path = "DomainResource.extension"
  * ^base.min = 0
  * ^base.max = "*"
  * ^mustSupport = false
  * ^isModifier = false
* identifier ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) An identifier for this patient"
  * system ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The namespace for the identifier value"
  * value ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The value that is unique within the system."
* name ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality)"
  * use 0..1 ?! SU
  * use only code
  * use from http://hl7.org/fhir/ValueSet/name-use|4.0.1 (required)
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) usual | official | temp | nickname | anonymous | old | maiden"
    * ^definition = "Identifies the purpose for this name."
    * ^comment = "Applications can assume that a name is current unless it explicitly says that it is temporary or old."
    * ^requirements = "Allows the appropriate name for a particular context of use to be selected from among a set of names."
    * ^base.path = "HumanName.use"
    * ^base.min = 0
    * ^base.max = "1"
    * ^isModifierReason = "This is labeled as \"Is Modifier\" because applications should not mistake a temporary or old name etc.for a current/permanent one"
    * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
    * ^binding.extension.valueString = "NameUse"
    * ^binding.description = "The use of a human name."
  * family ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Family name (often called 'Surname')"
  * given ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Given names (not always 'first'). Includes middle names"
  * suffix 0..* SU
  * suffix only string
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Parts that come after the name"
    * ^definition = "Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that appears at the end of the name."
    * ^base.path = "HumanName.suffix"
    * ^base.min = 0
    * ^base.max = "*"
    * ^orderMeaning = "Suffixes appear in the correct order for presenting the name"
    * ^mustSupport = false
    * ^isModifier = false
  * period 0..1 SU
  * period only Period
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Time period when name was/is in use"
    * ^definition = "Indicates the period of time when this name was valid for the named person."
    * ^requirements = "Allows names to be placed in historical context."
    * ^base.path = "HumanName.period"
    * ^base.min = 0
    * ^base.max = "1"
    * ^mustSupport = false
    * ^isModifier = false
* telecom ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) A contact detail for the individual"
  * system ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) phone | fax | email | pager | url | sms | other"
  * value ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The actual contact point details"
  * use ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) home | work | temp | old | mobile - purpose of this contact point"
* birthDate ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) The date of birth for the individual"
* deceased[x] ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) Indicates if the individual is deceased or not"
  * ^comment = "The \"Cause of death\" for a patient is typically captured as an Observation."
* address ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) An address for the individual"
  * extension contains http://hl7.org/fhir/StructureDefinition/iso21090-preferred|5.2.0 named address-preferred 0..1
  * extension[address-preferred] ^comment = "Make general extension."
    * ^mustSupport = false
  * use 0..1 ?! SU
  * use only code
  * use from http://hl7.org/fhir/ValueSet/address-use|4.0.1 (required)
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) home | work | temp | old | billing - purpose of this address"
    * ^definition = "The purpose of this address."
    * ^comment = "Applications can assume that an address is current unless it explicitly says that it is temporary or old."
    * ^requirements = "Allows an appropriate address to be chosen from a list of many."
    * ^base.path = "Address.use"
    * ^base.min = 0
    * ^base.max = "1"
    * ^example.label = "General"
    * ^example.valueCode = #home
    * ^isModifierReason = "This is labeled as \"Is Modifier\" because applications should not mistake a temporary or old address etc.for a current/permanent one"
    * ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
    * ^binding.extension.valueString = "AddressUse"
    * ^binding.description = "The use of an address."
  * line ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Street name, number, direction & P.O. Box etc."
  * city ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Name of city, town etc."
  * state ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Sub-unit of country (abbreviations ok)"
  * postalCode ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) US Zip Codes"
  * period 0..1 SU
  * period only Period
    * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) Time period when address was/is in use"
    * ^definition = "Time period when address was/is in use."
    * ^requirements = "Allows addresses to be placed in historical context."
    * ^base.path = "Address.period"
    * ^base.min = 0
    * ^base.max = "1"
    * ^example.label = "General"
    * ^example.valuePeriod.start = "2010-03-23"
    * ^example.valuePeriod.end = "2010-07-01"
    * ^isModifier = false
* communication 0..*
* communication only BackboneElement
  * ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
  * ^extension.valueBoolean = true
  * ^short = "(USCDI+ Quality) A language which may be used to communicate with the patient about his or her health"
  * ^definition = "A language which may be used to communicate with the patient about his or her health."
  * ^comment = "If no language is specified, this *implies* that the default local language is spoken.  If you need to convey proficiency for multiple modes, then you need multiple Patient.Communication associations.   For animals, language is not a relevant field, and should be absent from the instance. If the Patient does not speak the default local language, then the Interpreter Required Standard can be used to explicitly declare that an interpreter is required."
  * ^requirements = "If a patient does not speak the local language, interpreters may be required, so languages spoken and proficiency are important things to keep track of both for patient and other persons of interest."
  * ^base.path = "Patient.communication"
  * ^base.min = 0
  * ^base.max = "*"
  * ^mustSupport = false
  * ^isModifier = false
  * ^isSummary = false
  * language ^extension.url = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-uscdi-quality-extension"
    * ^extension.valueBoolean = true
    * ^short = "(USCDI+ Quality) The language which can be used to communicate with the patient about his or her health"
* link ^mustSupport = false
// SUSHI retains the inherited RelatedPerson targetProfile unless this slot is overwritten.
* link.other ^mustSupport = false
* link.other ^type[0].targetProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-patient"
* link.other ^type[0].targetProfile[1] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-patient"
