Instance: encounter-ed-example
InstanceOf: USQualityCoreEncounter
Title: "Encounter example of emergency visit that escalated into inpatient patient"
Description: "Encounter example of emergency visit that escalated into inpatient patient"
Usage: #example
* status = #in-progress
* class = $v3-ActCode#IMP "inpatient encounter"
* type = $cpt#99223 "Initial hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and high level of medical decision making. When using total time on the date of the encounter for code selection, 75 minutes must be met or exceeded."
* subject.reference = "Patient/example"
* period.start = "2017-02-01T07:15:00+10:00"
* location[0]
  * location
    * reference = "Location/example"
    * display = "Emergency Waiting Room"
  * status = #active
  * period
    * start = "2017-02-01T07:15:00+10:00"
    * end = "2017-02-01T08:45:00+10:00"
* location[+]
  * location
    * reference = "Location/example"
    * display = "Emergency"
  * status = #active
  * period
    * start = "2017-02-01T08:45:00+10:00"
    * end = "2017-02-01T09:27:00+10:00"
* location[+]
  * location
    * reference = "Location/example"
    * display = "Ward 1, Room 42, Bed 1"
  * status = #active
  * period
    * start = "2017-02-01T09:27:00+10:00"
    * end = "2017-02-01T12:15:00+10:00"
* location[+]
  * location
    * reference = "Location/example"
    * display = "Ward 1, Room 42, Bed 1"
  * status = #reserved
  * period
    * start = "2017-02-01T12:15:00+10:00"
    * end = "2017-02-01T12:45:00+10:00"
* location[+]
  * location
    * reference = "Location/example"
    * display = "Ward 1, Room 42, Bed 1"
  * status = #active
  * period.start = "2017-02-01T12:45:00+10:00"