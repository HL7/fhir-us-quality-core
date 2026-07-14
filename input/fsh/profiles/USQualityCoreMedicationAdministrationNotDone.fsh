Profile: USQualityCoreMedicationAdministrationNotDone
Parent: USQualityCoreMedicationAdministration
Id: us-quality-core-medicationadministrationnotdone
Title: "US Quality Core MedicationAdministration Not Done"
Description: "Negation profile of MedicationAdministration for decision support/quality metrics. Indicates that a medication was not administered for a reason."
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* implicitRules 0..1 ?! SU
* implicitRules only uri
  * ^short = "A set of rules under which this content was created"
  * ^definition = "A reference to a set of rules that were followed when the resource was constructed, and which must be understood when processing the content. Often, this is a reference to an implementation guide that defines the special rules along with other profiles etc."
  * ^comment = "Asserting this rule set restricts the content to be only understood by a limited set of trading partners. This inherently limits the usefulness of the data in the long term. However, the existing health eco-system is highly fractured, and not yet ready to define, collect, and exchange data in a generally computable sense. Wherever possible, implementers and/or specification writers should avoid using this element. Often, when used, the URL is a reference to an implementation guide that defines these special rules as part of it's narrative along with other profiles, value sets, etc."
  * ^base.path = "Resource.implicitRules"
  * ^base.min = 0
  * ^base.max = "1"
  * ^isModifierReason = "This element is labeled as a modifier because the implicit rules may provide additional knowledge about the resource that modifies it's meaning or interpretation"
* status only code
* status = #not-done (exactly)
  * ^short = "not-done"
* statusReason 1..1
* statusReason from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Reason administration not performed"
  * ^binding.description = "The reason the event did not occur or was not performed"
* dosage ^short = "Details of how medication was taken"
* effective[x] ^short = "Start and end time of administration"
* medication[x] ^short = "What was administered"
* medication[x].extension[codeOptions] ^short = "Url of a value set of candidate medications"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreMedicationAdministrationNotDone
