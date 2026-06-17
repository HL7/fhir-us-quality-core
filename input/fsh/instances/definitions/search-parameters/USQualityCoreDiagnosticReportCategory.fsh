Instance: us-quality-core-diagnostic-report-category
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-diagnostic-report-category"
* version = "1.0.0"
* name = "USQualityCoreDiagnosticReportCategory"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core DiagnosticReport Category Search Parameter"
* code = #category
* base = #DiagnosticReport
* type = #token
* expression = "DiagnosticReport.category"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true