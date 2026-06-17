Profile: USQualityCoreSubstance
Parent: Substance
Id: us-quality-core-substance
Title: "US Quality Core Substance"
Description: "Profile of Substance for decision support/quality metrics. Defines the core set of elements and extensions for quality rule and measure authors."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* code from SubstanceCode (preferred)
  * ^short = "If this describes a specific package/container of the substance"
  * ^binding.description = "Substance codes"
* instance ^mustSupport = false
  * quantity ^short = "Amount of substance in the package"
* ingredient ^mustSupport = false
  * quantity ^short = "Optional amount (concentration)"
  * substance[x] only Reference(USQualityCoreSubstance)
    * ^short = "A component of the substance"