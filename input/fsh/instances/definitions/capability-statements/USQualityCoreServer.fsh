Instance: us-quality-core-server
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/CapabilityStatement/us-quality-core-server"
* version = "1.0.0"
* name = "USQualityCoreServerCapabilityStatement"
* title = "US Quality Core Server CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "This capability statement describes the expected capabilities of US Quality Core Servers that respond to USCDI+ Quality V2 queries submitted by US Quality Core Clients. It describes a minimum set of FHIR RESTful operations and search parameters needed to enable access to the USCDI+ Quality data in scope for this implementation guide. This version of US Quality Core builds directly on US Core 9.0.0, and US Quality Core Servers SHALL support the capabilities described in the US Core Server CapabilityStatement for in-scope USCDI+ Quality data. RESTful operations and search parameters in this CapabilityStatement identify the capabilities specifically relevant to USCDI+ Quality V2 and may duplicate US Core Server capabilities. For more information about which USCDI+ Quality data elements are in scope, please review the [USCDI+ Quality](uscdiquality.html) section of this implementation guide."
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* implementationGuide = "http://hl7.org/fhir/us/quality-core/ImplementationGuide/hl7.fhir.us.quality-core"
* rest
  * mode = #server
  * documentation = "The US Quality Core Server SHALL:\n\n1. Conform to requirements provided in the US Core Server CapabilityStatement and the base FHIR specification\n2. Support all US Quality Core and US Core profiles that contain at least one in-scope USCDI+ Quality data element, as described in the [USCDI+ Quality page](/uscdiquality.html)\n3. Support all interactions, search parameters, and combined search parameters that have SHALL conformance expectations as described in this CapabilityStatement\n4. Support all USCDI+ Quality flagged data elements, and those flagged as MustSupport from underlying US Core profiles\n5. Ensure resources in 'Any' references conform to US Quality Core profiles if the base resource has a US Quality Core profile\n6. Implement the RESTful behavior according to the FHIR specification for all interactions in this CapabilityStatement\n7. Support JSON source formats for all interactions in this CapabilityStatement\n\nNOTE: US Quality Core and US Core SearchParameters referenced in this CapabilityStatement that are derived from standard FHIR SearchParameters are only defined to document Server and Client expectations, such as comparator expectations, and to support generation tooling.  They SHALL NOT be interpreted as search parameters for searching. Actual searches use the standard FHIR SearchParameters.\n"
  // Generated CapabilityStatement rest insert. Update data/rest.json and rerun scripts.
  * insert GeneratedUSQualityCoreCapabilityStatementRest
