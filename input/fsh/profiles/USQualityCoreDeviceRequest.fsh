Invariant: drq-3
Description: "to indicate what device, either at least one coding in the code or a codeOptions extension shall be provided"
* severity = #error
* expression = "(code is Reference).not() implies code.extension('http://hl7.org/fhir/StructureDefinition/codeOptions').exists() xor code.coding.exists()"
* xpath = "exists(f:extension)"

Profile: USQualityCoreDeviceRequest
Parent: DeviceRequest
Id: us-quality-core-devicerequest
Title: "US Quality Core DeviceRequest"
Description: "Profile of DeviceRequest for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* obeys drq-3
* . ^mustSupport = false
* modifierExtension contains $extension-DeviceRequest.doNotPerform named doNotPerform 0..1 ?!
  * ^short = "Extension"
  * ^isModifierReason = "The do not perform element changes the meaning of the request from a positive to a negative statement"
* identifier ^short = "External Request identifier"
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* code[x] only CodeableConcept or Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0)
* code[x] from FHIRDeviceTypes (preferred)
  * ^short = "Device requested"
  * ^condition = "drq-3"
* codeCodeableConcept
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate devices"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible coded values representing the device."
    * ^condition = "drq-3"
* code[x][codeCodeableConcept].extension[codeOptions] ^short = "Url of a value set of candidate devices"
* subject only Reference(USQualityCorePatient)
  * ^short = "Focus of request"
* authoredOn ^short = "When recorded"
* reasonCode ^short = "Coded Reason for request"
* requester ^short = "Who/what is requesting diagnostics"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreDeviceRequest
