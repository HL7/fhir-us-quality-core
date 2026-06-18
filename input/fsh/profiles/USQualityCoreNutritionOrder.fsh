Profile: USQualityCoreNutritionOrder
Parent: NutritionOrder
Id: us-quality-core-nutritionorder
Title: "US Quality Core NutritionOrder"
Description: "Defines constraints and extensions on the NutritionOrder resource for the minimal set of data to query and retrieve a patient's Nutrition Order."
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* identifier only Identifier
  * ^mustSupport = false
* patient only Reference(USQualityCorePatient)
  * ^short = "The person who requires the diet, formula or nutritional supplement"
  * ^definition = "The person (patient) who needs the nutrition order for an oral diet, nutritional supplement and/or enteral or formula feeding."
  * ^requirements = "The person who requires the diet, formula or nutritional supplement."
* oralDiet.type 0..1
* oralDiet.type only CodeableConcept
  * ^short = "Oral diet components"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreNutritionOrder
