Instance: example-of-us-quality-core-substance
InstanceOf: USQualityCoreSubstance
Title: "Substance example"
Description: "Honey Bee venom (apitoxin) Substance example"
Usage: #example
* id = "example"
* identifier
  * system = "http://acme.org/identifiers/substances"
  * value = "1463"
* status = #active
* category = http://terminology.hl7.org/CodeSystem/substance-category#allergen "Allergen"
* code.text = "apitoxin (Honey Bee Venom)"
* ingredient
  * quantity
    * numerator
      * value = 0.150
      * unit = "mg"
    * denominator.value = 1
  * substanceReference.reference = "Substance/example"