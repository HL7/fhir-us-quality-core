Instance: example-of-diagnostic-report
InstanceOf: USQualityCoreDiagnosticReportLab
Title: "DiagnosticReportLab example"
Description: "Example of the findings and interpretation of a laboratory diagnostic test"
Usage: #example
* id = "example"
* status = #final
* category[LaboratorySlice] = $v2-0074#LAB "Laboratory"
* code = $loinc#58410-2 "CBC panel - Blood by Automated count"
* subject = Reference(Patient/example) "Peter Chalmers"
* effectiveDateTime = "2005-07-05"
* issued = "2005-07-06T11:45:33+11:00"
* performer = Reference(Organization/example)
* result = Reference(Observation/laboratory-result-observation-example-blood-glucose)
