Instance: us-quality-core-diagnostic-report-code
InstanceOf: SearchParameter
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-diagnostic-report-code"
* version = "1.0.0"
* name = "USQualityCoreDiagnosticReportCode"
* status = #active
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "US Quality Core DiagnosticReport Code Search Parameter"
* code = #code
* base = #DiagnosticReport
* type = #token
* expression = "DiagnosticReport.code"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true