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
* oralDiet ^short = "Oral diet components"
* oralDiet.type 0..1
* oralDiet.type only CodeableConcept
  * ^short = "Oral diet components"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate oral diet types"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible oral diet types."
* supplement.type
  * ^short = "Type of supplement product requested"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate nutritional supplements"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible nutritional supplements."
* enteralFormula.baseFormulaType
  * ^short = "Type of enteral or infant formula"
  * extension contains $codeOptions named codeOptions 0..1
  * extension[codeOptions] ^short = "Url of a value set of candidate enteral formulas"
    * ^definition = "A logical reference (e.g. a reference to ValueSet.url) to a value set/version that identifies a set of possible enteral formulas."
* supplement ^short = "Supplement components"
* enteralFormula ^short = "Enteral formula components"
* orderer ^short = "Who ordered the diet, formula or nutritional supplement"
* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* status ^short = "draft | active | on-hold | revoked | completed | entered-in-error | unknown"
// Generated USCDI+ Quality flag insert. Keep this at the end of the profile so all element and slice rules exist before the RuleSet is applied.
* insert GeneratedUSCDIQualityFlagsForUSQualityCoreNutritionOrder
