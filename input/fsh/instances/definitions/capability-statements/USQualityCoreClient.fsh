Instance: us-quality-core-client
InstanceOf: CapabilityStatement
Usage: #definition
* url = "http://hl7.org/fhir/us/quality-core/CapabilityStatement/us-quality-core-client"
* version = "1.0.0"
* name = "USQualityCoreClientCapabilityStatement"
* title = "US Quality Core Client CapabilityStatement"
* status = #active
* experimental = false
* date = "2026-06-30"
* publisher = "HL7 International / Clinical Quality Information"
* contact
  * name = "Clinical Quality Information WG"
  * telecom
    * system = #url
    * value = "http://www.hl7.org/Special/committees/cqi"
* description = "This capability statement describes the expected capabilities of the US Quality\nCore Client, which is responsible for initiating queries for USCDI+\nQuality V2 data from US Quality Core Servers. The set of FHIR RESTful\noperations and search parameters required to be supported by US Quality Core\nServers is provided in the [US Quality Core Server Capability\nStatement](CapabilityStatement-us-quality-core-server.html). US Quality Core\nClients have the option of choosing from this list to access necessary data\nbased on their local use cases and other contextual requirements.\n"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* implementationGuide = "http://hl7.org/fhir/us/quality-core/ImplementationGuide/hl7.fhir.us.quality-core"
* rest
  * mode = #client
  * documentation = "The US Quality Core Client SHALL:\n\n1. Support fetching and querying US Quality Core and US Core profiles that contain at least one in-scope USCDI+ Quality data element, using the supported RESTful interactions and search parameters declared in the US Quality Core Server CapabilityStatement\n2. Recognize and process all MustSupport and USCDI+ Quality flagged elements in US Quality Core, and all MustSupport elements in in-scope US Core profiles\n3. Treat all modifying attributes as MustSupport, even if not explicitly declared\n4. SHALL NOT process resource instances that include unknown modifying attributes\n5. Be simultaneously conformant with US Quality Core profiles and US Core profiles. As such, the more restrictive bindings between US Core and US Quality Core SHALL be adhered to. For example, all value sets that are required in US Core SHALL be required by US Quality Core, regardless of the binding strength in US Quality Core.\n\nNOTE: US Quality Core and US Core SearchParameters referenced in this CapabilityStatement that are derived from standard FHIR SearchParameters are only defined to document Server and Client expectations, such as comparator expectations, and to support generation tooling.  They SHALL NOT be interpreted as search parameters for searching. Actual searches use the standard FHIR SearchParameters.\n"
  // Generated CapabilityStatement rest insert. Update data/rest.json and rerun scripts.
  * insert GeneratedUSQualityCoreCapabilityStatementRest
