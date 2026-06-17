Profile: USQualityCoreDeviceUseStatement
Parent: DeviceUseStatement
Id: us-quality-core-deviceusestatement
Title: "US Quality Core DeviceUseStatement"
Description: "Profile of DeviceUseStatement for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* status ^short = "active | completed | entered-in-error +"
* subject only Reference(USQualityCorePatient)
  * ^short = "Patient using device"
* timing[x] ^short = "How often the device was used"
* recordedOn ^short = "When statement was recorded"
* device only Reference(http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0)
  * ^short = "Reference to device used"
* bodySite from SNOMEDCTBodyStructures (preferred)
  * ^short = "Target body site"
  * ^requirements = "Knowing where the device is targeted is important for tracking if multiple sites are possible. If more information than just a code is required, use the extension http://hl7.org/fhir/StructureDefinition/bodySite."
  * ^binding.description = "Codes describing anatomical locations. May include laterality."