Extension: USQualityCoreUSCDIQualityExtension
Id: us-quality-core-uscdi-quality-extension
Title: "US Quality Core USCDI+ Quality Extension"
Description: "This extension is used only in US Quality Core profile StructureDefinitions. It flags elements, types, and target profiles that represent USCDI+ Quality data elements. Systems are expected to support flagged content as applicable to their role in US Quality Core data exchange. See the [Must Support](must-support.html) and [USCDI+ Quality](uscdiquality.html) pages for more information."
Context: ElementDefinition, ElementDefinition.type.targetProfile, ElementDefinition.type
* ^version = "1.0.0"
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* . 0..1
  * ^short = "USCDI+ Quality Requirement Flag: ONLY USED FOR US Quality Core Profile StructureDefinitions"
  * ^definition = "This extension flags elements, types, and target profiles that represent USCDI+ Quality data elements. Systems are expected to support flagged content as applicable to their role in US Quality Core data exchange. See the [Must Support](must-support.html) and [USCDI+ Quality](uscdiquality.html) pages for more information."
  * ^isModifier = false
* value[x] 1..1
* value[x] only boolean
  * ^short = "Whether the profile item is mapped to USCDI+ Quality"
  * ^definition = "True indicates that the profile item is mapped to at least one USCDI+ Quality data element."
