Profile: USQualityCoreDeviceRequested
Parent: USQualityCoreDeviceRequest
Id: us-quality-core-devicerequested
Title: "US Quality Core DeviceRequested"
Description: "Positive profile of DeviceRequest for decision support/quality metrics. Indicates a proposal, plan, or order for a device."
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* modifierExtension[doNotPerform] 0..1 ?!
* modifierExtension[doNotPerform] only $extension-DeviceRequest.doNotPerform
  * ^short = "Extension"
  * ^isModifierReason = "The do not perform element changes the meaning of the request from a positive to a negative statement"
  * value[x] 1..1
  * value[x] only boolean
  * value[x] = false (exactly)
    * ^short = "Value of extension"