Alias: $shareablevalueset = http://hl7.org/fhir/StructureDefinition/shareablevalueset

ValueSet: USQualityCoreMedicationDoseType
Id: us-quality-core-medication-dose-type
Title: "US Quality Core SNOMED CT Dosage Codes"
Description: "This value set includes all the \"Dosages\" SNOMED CT codes (i.e. codes with an is-a relationship with 277406006: Dosages)."
* ^meta.profile = $shareablevalueset
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from system $sct where concept is-a #277406006
