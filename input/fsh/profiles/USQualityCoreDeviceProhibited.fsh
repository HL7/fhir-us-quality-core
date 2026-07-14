Profile: USQualityCoreDeviceProhibited
Parent: USQualityCoreDeviceRequest
Id: us-quality-core-deviceprohibited
Title: "US Quality Core Device Prohibited"
Description: "Negation profile of DeviceRequest for decision support/quality metrics. Indicates a proposal, plan, or order not to provide a device."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* . ^mustSupport = false
* modifierExtension[doNotPerform] 1..1 ?!
* modifierExtension[doNotPerform] only $extension-DeviceRequest.doNotPerform
  * ^short = "Extension"
  * ^isModifierReason = "The do not perform element changes the meaning of the request from a positive to a negative statement"
  * value[x] 1..1
  * value[x] only boolean
  * value[x] = true (exactly)
    * ^short = "Value of extension"
* code[x] ^short = "Device requested"
* authoredOn 1..1
  * ^short = "When recorded"
* reasonCode only CodeableConcept
* reasonCode from USQualityCoreNegationReasonCodes (extensible)
  * ^short = "Explanation/Justification for procedure or service"
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreDeviceProhibited
