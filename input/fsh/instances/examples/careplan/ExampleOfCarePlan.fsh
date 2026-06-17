Instance: example-of-care-plan
InstanceOf: USQualityCoreCarePlan
Title: "CarePlan example"
Description: "Example of an assessment and care plan for a pregnancy"
Usage: #example
* id = "example"
* instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact-schedule"
* status = #active
* intent = #plan
* category[AssessPlan] = USCoreCarePlanCategoryExtensionCodes#assess-plan "Assessment and Plan of Treatment"
* subject.display = "Eve Everywoman"
* period
  * start = "2019-05-24"
  * end = "2020-02-24"
* careTeam = Reference(CareTeam/example)
* addresses.display = "pregnancy"
* goal.display = "pregnancy goal"
* activity[0]
  * outcomeReference.display = "First contact, occurred at about 12 weeks based on gestational age from LMP of 2019-03-01"
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #in-progress
    * performer.display = "Mabel Midwife"
    * description = "First antenatal care contact"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #scheduled
    * scheduledPeriod
      * start = "2019-07-26"
    * performer.display = "Mabel Midwife"
    * description = "Second contact to occur at 20 weeks of gestational age"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #not-started
    * scheduledPeriod
      * start = "2019-09-06"
    * performer.display = "Mabel Midwife"
    * description = "Third contact to occur at 26 weeks of gestational age"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #not-started
    * scheduledPeriod
      * start = "2019-10-04"
    * performer.display = "Mabel Midwife"
    * description = "Fourth contact to occur at 30 weeks of gestational age"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #not-started
    * scheduledPeriod
      * start = "2019-11-01"
    * performer.display = "Mabel Midwife"
    * description = "Fifth contact to occur at 34 weeks of gestational age"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #not-started
    * scheduledPeriod
      * start = "2019-11-15"
    * performer.display = "Mabel Midwife"
    * description = "Sixth contact to occur at 36 weeks of gestational age"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #not-started
    * scheduledPeriod
      * start = "2019-11-29"
    * performer.display = "Mabel Midwife"
    * description = "Seventh contact to occur at 38 weeks of gestational age"
* activity[+]
  * detail
    * kind = #ServiceRequest
    * instantiatesCanonical = "http://example.org/guides/who/anc-cds/PlanDefinition/anc-contact"
    * code = $sct#424525001 "Antenatal care (regime/therapy)"
      * text = "Antenatal care"
    * status = #not-started
    * scheduledPeriod
      * start = "2019-12-13"
    * performer.display = "Mabel Midwife"
    * description = "Eighth contact to occur at 40 weeks of gestational age"
* activity[+].detail
  * kind = #ServiceRequest
  * code = $sct#236973005 "Delivery procedure (procedure)"
    * text = "Delivery procedure"
  * status = #not-started
  * scheduledPeriod
    * start = "2019-12-13"
    * end = "2019-12-27"
  * performer
    * display = "Mabel Midwife"
  * description = "Delivery"
