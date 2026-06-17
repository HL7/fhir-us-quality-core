Instance: example-of-us-quality-core-nutrition-order
InstanceOf: USQualityCoreNutritionOrder
Title: "NutrientOrder example"
Description: "Example of NutrientOrder for diabetic diet"
Usage: #example
* id = "example"
* identifier
  * system = "http://example.org/nutrition-requests"
  * value = "123"
* status = #active
* intent = #order
* patient
  * reference = "Patient/example"
  * display = "Peter Chalmers"
* encounter
  * reference = "Encounter/example"
  * display = "Inpatient"
* dateTime = "2014-09-17"
* orderer
  * reference = "Practitioner/example"
  * display = "Dr Adam Careful"
* allergyIntolerance
  * reference = "AllergyIntolerance/example"
  * display = "Cashew Nuts"
* foodPreferenceModifier = http://terminology.hl7.org/CodeSystem/diet#dairy-free
* oralDiet
  * type = $sct#160670007 "Diabetic diet"
    * text = "Diabetic diet"
  * schedule
    * repeat
      * boundsPeriod.start = "2015-02-10"
      * frequency = 3
      * period = 1
      * periodUnit = #d
  * nutrient
    * modifier = $sct#2331003 "Carbohydrate"
    * amount = 75 'g' "grams"
