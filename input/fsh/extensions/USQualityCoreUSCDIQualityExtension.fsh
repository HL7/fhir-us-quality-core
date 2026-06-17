Extension: USQualityCoreUSCDIQualityExtension
Id: us-quality-core-uscdi-quality-extension
Title: "US Quality Core USCDI+ Quality Extension"
Description: "This extension is only used in the US Quality Core Implementation Guide's Profile StructureDefinition elements."
Context: ElementDefinition, ElementDefinition.type.targetProfile, ElementDefinition.type
* ^version = "1.0.0"
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* . 0..1
  * ^short = "USCDI+ Quality Element Flag: ONLY USED FOR US Quality Core Profile StructureDefinitions"
  * ^definition = "**This extension is only used on US Quality Core Profile StructureDefinition elements**."
  * ^isModifier = false
* value[x] 1..1
* value[x] only boolean