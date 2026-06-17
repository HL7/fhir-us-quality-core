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
* description = "This capability statement describes the expected capabilities of the US Quality Core Servers\nwhich is responsible for responding to USCDI+ Quality V1 queries submitted by US Quality Core Clients.\nIt describes a minimum set of FHIR RESTful operations and search parameters necessary to enable access\nto the set of USCDI+ Quality V1 data that is in scope of this implementation guide.  For more information\nabout which USCDI+ Quality data elements are in scope, please review the [USCDI+ Quality](uscdiquality.html) section\nof this implementation guide.\n\nUS Quality Core Servers **SHALL** support the capabilities described in the [US\nCore Server CapabilityStatement\nSTU6.1](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html).\nSome RESTFUL operations and search parameters described in the US Quality Core Server CapabilityStatement are redundant\nto the US Core Server CapabilityStatement, but are listed here to highlight which\ncapabilities are specifically relevant to USCDI+ Quality V1.\n\nThe US Quality Core Implementation Guide v0.5.0 is derived from the QI-Core Implementation Guide STU6. It adopts\nall profiles within the [QI-Core Implementation Guide STU6](https://hl7.org/fhir/us/qicore/STU6/) to enable a more seamless adoption of this\nimplementation guide.  However, only those profiles that contain USCDI+ Quality V1 data are required to be supported\nby US Quality Core Servers.  The FHIR RESTful operations and search parameters in this capability statement\nreflects this scope.\n"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* implementationGuide = "http://hl7.org/fhir/us/quality-core/ImplementationGuide/hl7.fhir.us.quality-core"
* rest
  * mode = #server
  * documentation = "The US Quality Core Server SHALL:\n\n1. Conform to requirements provided in the US Core Server CapabilityStatement and the base FHIR specification\n2. Support all US Quality Core and US Core profiles that contain at least one in-scope USCDI+ Quality data element, as described in the [USCDI+ Quality page](/uscdiquality.html)\n3. Support all interactions, search parameters, and combined search parameters that have SHALL conformance expectations as described in this CapabilityStatement\n4. Support all USCDI+ Quality flagged data elements, and those flagged as MustSupport from underlying US Core profiles\n5. Ensure resources in 'Any' references conform to US Quality Core profiles if the base resource has a US Quality Core profile\n6. Implement the RESTful behavior according to the FHIR specification for all interactions in this CapabilityStatement\n7. Support JSON source formats for all interactions in this CapabilityStatement\n\nNOTE: US Quality Core and US Core SearchParameters referenced in this CapabilityStatement that are derived from standard FHIR SearchParameters are only defined to document Server and Client expectations, such as comparator expectations, and to support generation tooling.  They SHALL NOT be interpreted as search parameters for searching. Actual searches use the standard FHIR SearchParameters.\n"
  * resource[0]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "subject"
      * extension[+]
        * url = "required"
        * valueString = "event"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "subject"
      * extension[+]
        * url = "required"
        * valueString = "recorded-date"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #AdverseEvent
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-adverseevent"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `subject` | Added in US Quality Core. | Supports subject-scoped retrieval of AdverseEvent resources for quality reporting. This US Quality Core-specific search is needed because AdverseEvent is in scope for USCDI+ Quality but is not profiled by US Core 6.1.0. |\n| `subject` + `event` | Added in US Quality Core. | Supports subject-scoped retrieval filtered by adverse event concept. This US Quality Core-specific combination makes the adverse event concept available as a primary retrieval path for quality logic. |\n| `subject` + `recorded-date` | Added in US Quality Core. | Supports subject-scoped retrieval filtered by recorded date so quality workflows can constrain adverse events to relevant reporting periods. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "subject"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-adverse-event-subject"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "event"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-adverse-event-event"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "recorded-date"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-adverse-event-recorded-date"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #AllergyIntolerance
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-allergyintolerance"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#allergyintolerance). | Supports patient-scoped retrieval of allergy and intolerance data needed for in-scope USCDI+ Quality data access. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-allergy-intolerance-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #CarePlan
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-careplan"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` + `category` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#careplan). | Supports patient-scoped retrieval of care plans filtered to the category relevant for USCDI+ Quality data access. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-care-plan-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-care-plan-category"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #CareTeam
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-careteam"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` + `status` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#careteam). | Supports patient-scoped retrieval of care teams filtered by status for quality workflows. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-care-team-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-care-team-status"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Condition
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-encounter-diagnosis"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-condition-problems-health-concerns"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#condition). | Supports patient-scoped retrieval of conditions needed for in-scope USCDI+ Quality data access. |\n| `patient` + `category` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#condition). | Supports patient-scoped retrieval filtered by condition category, including problem, health concern, and encounter diagnosis use cases. |\n| `patient` + `code` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by condition code. US Quality Core makes this combination explicit as a primary retrieval path for quality logic that filters by diagnosis, problem, or health concern code. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-condition-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-condition-category"
      * type = #token
      * documentation = "The client **MAY** provide a category."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-condition-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Coverage
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-coverage"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#coverage). | Supports patient-scoped retrieval of coverage data needed for in-scope USCDI+ Quality data access. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-coverage-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "type"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Device
    * supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-device|9.0.0"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-device-patient|9.0.0"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "type"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-device-type|9.0.0"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "do-not-perform"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #DeviceRequest
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-devicerequest"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-deviceprohibited"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Added in US Quality Core. | Supports patient-scoped retrieval of device requests for quality reporting. This US Quality Core-specific search is needed because DeviceRequest is in scope for USCDI+ Quality but is not profiled by US Core 6.1.0. |\n| `patient` + `code` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by requested device code. This US Quality Core-specific combination makes the device code available as a primary retrieval path for quality logic. |\n| `patient` + `do-not-perform` | Added in US Quality Core. | Supports negation workflows by enabling retrieval of device requests that indicate the requested action should not be performed. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-device-request-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-device-request-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "do-not-perform"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-device-request-do-not-perform"
      * type = #token
      * documentation = "The client **MAY** provide a token value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * extension[+]
        * url = "required"
        * valueString = "date"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #DiagnosticReport
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-diagnosticreport-note"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-diagnosticreport-lab"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#diagnosticreport). | Supports patient-scoped retrieval of diagnostic reports needed for in-scope USCDI+ Quality data access. |\n| `patient` + `category` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#diagnosticreport). | Supports patient-scoped retrieval filtered by report category, including laboratory and clinical-note report categories. |\n| `patient` + `category` + `date` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#diagnosticreport). | Supports patient-scoped retrieval filtered by report category and date so quality workflows can constrain reports to relevant reporting periods. |\n| `patient` + `code` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#diagnosticreport). | Supports patient-scoped retrieval filtered by report code, including code-oriented retrieval paths used by quality logic. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-diagnostic-report-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-diagnostic-report-category"
      * type = #token
      * documentation = "The client **MAY** provide a category."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-diagnostic-report-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "date"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-diagnostic-report-date"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "type"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * extension[+]
        * url = "required"
        * valueString = "date"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #DocumentReference
    * supportedProfile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-adi-documentreference|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference|9.0.0"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `_id` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#documentreference). | Supports search retrieval of a known DocumentReference by resource id. |\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#documentreference). | Supports patient-scoped retrieval of document references needed for in-scope USCDI+ Quality data access. |\n| `patient` + `type` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#documentreference). | Supports patient-scoped retrieval filtered by document type, including clinical note type retrieval. |\n| `patient` + `category` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#documentreference). | Supports patient-scoped retrieval filtered by document category. |\n| `patient` + `category` + `date` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#documentreference). | Supports patient-scoped retrieval filtered by document category and date so quality workflows can constrain documents to relevant reporting periods. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-documentreference-patient|9.0.0"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-documentreference-id|9.0.0"
      * type = #token
      * documentation = "The client **SHALL** provide a token value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-documentreference-category|9.0.0"
      * type = #token
      * documentation = "The client **MAY** provide a token value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "date"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-documentreference-date|9.0.0"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "type"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-documentreference-type|9.0.0"
      * type = #token
      * documentation = "The client **MAY** provide a token value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "type"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "date"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Encounter
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-encounter"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `_id` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#encounter). | Supports search retrieval of a known Encounter by resource id. |\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#encounter). | Supports patient-scoped retrieval of encounters needed for in-scope USCDI+ Quality data access. |\n| `patient` + `type` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by encounter type. US Quality Core makes this combination explicit as a primary retrieval path for quality logic that filters by visit or service type. |\n| `patient` + `date` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#encounter). | Supports patient-scoped retrieval filtered by encounter date so quality workflows can constrain encounters to relevant reporting periods. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-encounter-id"
      * type = #token
      * documentation = "The client **SHALL** provide an id value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-encounter-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "type"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-encounter-type"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "date"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-encounter-date"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #FamilyMemberHistory
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-familymemberhistory"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Added in US Quality Core. | Supports patient-scoped retrieval of family member history for quality reporting. This US Quality Core-specific search is needed because FamilyMemberHistory is in scope for USCDI+ Quality but is not profiled by US Core 6.1.0. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-family-member-history-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Goal
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-goal"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#goal). | Supports patient-scoped retrieval of goals needed for in-scope USCDI+ Quality data access. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-goal-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Immunization
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-immunization"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-immunizationnotdone"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#immunization). | Supports patient-scoped retrieval of immunizations needed for in-scope USCDI+ Quality data access. |\n| `patient` + `status` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by immunization status. US Quality Core makes this combination explicit for status-sensitive quality workflows, including not-done immunization cases. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-immunization-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-immunization-status"
      * type = #token
      * documentation = "The client **MAY** provide a status."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Location
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-location"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). US Quality Core does not define additional required individual search parameters or required search parameter combinations for this resource. Implementations still support the required interactions in this CapabilityStatement and any applicable US Core requirements independently."
    * interaction
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * referencePolicy = #resolves
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Medication
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medication"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `code` | Added in US Quality Core. | Supports retrieval of Medication resources by clinical code. This search is included as a primary code path for quality logic when Medication is represented as a referenced resource. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchParam
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-code"
      * type = #token
      * documentation = "The client **SHALL** provide a code value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "effective-time"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #MedicationAdministration
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationadministration"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationadministrationnotdone"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Added in US Quality Core. | Supports patient-scoped retrieval of medication administrations for quality reporting. This US Quality Core-specific search is needed because MedicationAdministration is in scope for USCDI+ Quality but is not profiled by US Core 6.1.0. |\n| `patient` + `status` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by administration status for status-sensitive quality workflows. |\n| `patient` + `code` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by medication code. This US Quality Core-specific combination makes the medication code available as a primary retrieval path for quality logic. |\n| `patient` + `effective-time` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by administration time so quality workflows can constrain administrations to relevant reporting periods. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-administration-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-administration-status"
      * type = #token
      * documentation = "The client **MAY** provide a status."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-administration-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "effective-time"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-administration-effective-time"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #MedicationDispense
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationdispense"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationdispensedeclined"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#medicationdispense). | Supports patient-scoped retrieval of medication dispenses needed for in-scope USCDI+ Quality data access. |\n| `patient` + `status` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by dispense status. US Quality Core makes this combination explicit for status-sensitive quality workflows, including declined dispense cases. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-dispense-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-dispense-status"
      * type = #token
      * documentation = "The client **MAY** provide a status."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "intent"
      * extension[+]
        * url = "required"
        * valueString = "do-not-perform"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "intent"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #MedicationRequest
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationrequest"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationprohibited"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` + `intent` + `do-not-perform` | Added in US Quality Core. | Supports negation workflows by enabling retrieval of medication requests that indicate the requested medication should not be performed, while preserving the patient and intent context. |\n| `patient` + `intent` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#medicationrequest). | Supports patient-scoped retrieval of medication requests filtered by intent, including medication orders relevant to quality reporting. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-request-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "intent"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-request-intent"
      * type = #token
      * documentation = "The client **MAY** provide a token value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "do-not-perform"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-medication-request-do-not-perform"
      * type = #token
      * documentation = "The client **MAY** provide a token value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * extension[+]
        * url = "required"
        * valueString = "date"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Observation
    * supportedProfile[0] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-adi-documentation|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-observation-clinical-result"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-care-experience-preference|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-treatment-intervention-preference|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-simple-observation"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-observation-screening-assessment"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancyintent|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-observation-lab"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-occupation|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-bmi|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/pediatric-bmi-for-age|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-height|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-temperature|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/head-occipital-frontal-circumference-percentile|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-heart-rate|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-respiratory-rate|9.0.0"
    * supportedProfile[+] = "http://hl7.org/fhir/us/core/StructureDefinition/pediatric-weight-for-height|9.0.0"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` + `category` + `status` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by observation category and status. US Quality Core makes this combination explicit for status-sensitive quality workflows, including cancelled or otherwise not-final observations. |\n| `patient` + `category` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#observation). | Supports patient-scoped retrieval filtered by observation category for in-scope USCDI+ Quality data access. |\n| `patient` + `category` + `date` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#observation). | Supports patient-scoped retrieval filtered by category and date so quality workflows can constrain observations to relevant reporting periods. |\n| `patient` + `code` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#observation). | Supports patient-scoped retrieval filtered by observation code, including primary code paths used by quality logic. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-observation-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-observation-category"
      * type = #token
      * documentation = "The client **MAY** provide a category."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-observation-status"
      * type = #token
      * documentation = "The client **MAY** provide a status."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-observation-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "date"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-observation-date"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Organization
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-organization"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). US Quality Core does not define additional required individual search parameters or required search parameter combinations for this resource. Implementations still support the required interactions in this CapabilityStatement and any applicable US Core requirements independently."
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * code = #search-type
    * referencePolicy = #resolves
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Patient
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-patient"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `_id` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#patient). | Supports retrieval of a known Patient by resource id, which is the normal starting point for patient-scoped USCDI+ Quality data access. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-patient-id"
      * type = #token
      * documentation = "The client **SHALL** provide an id value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Practitioner
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-practitioner"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). US Quality Core does not define additional required individual search parameters or required search parameter combinations for this resource. Implementations still support the required interactions in this CapabilityStatement and any applicable US Core requirements independently."
    * interaction
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * referencePolicy = #resolves
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #PractitionerRole
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-practitionerrole"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). US Quality Core does not define additional required individual search parameters or required search parameter combinations for this resource. Implementations still support the required interactions in this CapabilityStatement and any applicable US Core requirements independently."
    * interaction
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * referencePolicy = #resolves
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "date"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Procedure
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-procedure"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-procedurenotdone"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#procedure). | Supports patient-scoped retrieval of procedures needed for in-scope USCDI+ Quality data access. |\n| `patient` + `status` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by procedure status. US Quality Core makes this combination explicit for status-sensitive quality workflows, including not-done procedure cases. |\n| `patient` + `date` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#procedure). | Supports patient-scoped retrieval filtered by procedure date so quality workflows can constrain procedures to relevant reporting periods. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-procedure-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-procedure-status"
      * type = #token
      * documentation = "The client **MAY** provide a status."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "date"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-procedure-date"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Provenance
    * supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-provenance|9.0.0"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). US Quality Core does not define additional required individual search parameters or required search parameter combinations for this resource. Implementations still support the required interactions in this CapabilityStatement and any applicable US Core requirements independently."
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * code = #search-type
    * referencePolicy = #resolves
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #RelatedPerson
    * supportedProfile = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-relatedperson"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `_id` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#relatedperson). | Supports search retrieval of a known RelatedPerson by resource id. |\n| `patient` | Added in US Quality Core. | Supports retrieval of related persons associated with a patient for in-scope USCDI+ Quality data access. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-related-person-id"
      * type = #token
      * documentation = "The client **SHALL** provide an id value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-related-person-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "category"
      * extension[+]
        * url = "required"
        * valueString = "authored"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "do-not-perform"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #ServiceRequest
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-servicerequest"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-serviceprohibited"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `_id` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#servicerequest). | Supports search retrieval of a known ServiceRequest by resource id. |\n| `patient` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#servicerequest). | Supports patient-scoped retrieval of service requests needed for in-scope USCDI+ Quality data access. |\n| `patient` + `category` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#servicerequest). | Supports patient-scoped retrieval filtered by service request category. |\n| `patient` + `category` + `authored` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#servicerequest). | Supports patient-scoped retrieval filtered by category and authored date so quality workflows can constrain service requests to relevant reporting periods. |\n| `patient` + `code` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#servicerequest). | Supports patient-scoped retrieval filtered by service request code, including primary code paths used by quality logic. |\n| `patient` + `do-not-perform` | Added in US Quality Core. | Supports negation workflows by enabling retrieval of service requests that indicate the requested action should not be performed. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-id"
      * type = #token
      * documentation = "The client **SHALL** provide an id value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "category"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-category"
      * type = #token
      * documentation = "The client **MAY** provide a category."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "authored"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-authored"
      * type = #date
      * documentation = "The client **MAY** provide a date value."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "do-not-perform"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-service-request-do-not-perform"
      * type = #token
      * documentation = "The client **MAY** provide a token value."
  * resource[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * type = #Specimen
    * supportedProfile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-specimen|9.0.0"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `_id` | Required by [US Core](https://hl7.org/fhir/us/core/STU6.1/CapabilityStatement-us-core-server.html#specimen). | Supports search retrieval of a known Specimen by resource id, including specimens referenced by quality-relevant observations and diagnostic reports. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-specimen-patient|9.0.0"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "_id"
      * definition = "http://hl7.org/fhir/us/core/SearchParameter/us-core-specimen-id|9.0.0"
      * type = #token
      * documentation = "The client **SHALL** provide a token value."
  * resource[+]
    * extension[0]
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "status"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * extension[+]
      * extension[0]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * extension[+]
        * url = "required"
        * valueString = "patient"
      * extension[+]
        * url = "required"
        * valueString = "code"
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
    * type = #Task
    * supportedProfile[0] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-task"
    * supportedProfile[+] = "http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-taskrejected"
    * documentation = "Search requirements are selected according to the rules described in [Search Requirement Selection](us-quality-core-general-requirements.html#search-requirement-selection). The table below summarizes why each required individual search or required search parameter combination is included for this resource.\n\n| Required search | US Core alignment | Rationale |\n|---|---|---|\n| `patient` | Added in US Quality Core. | Supports patient-scoped retrieval of tasks for quality reporting. This US Quality Core-specific search is needed because Task is in scope for USCDI+ Quality but is not profiled by US Core 6.1.0. |\n| `patient` + `status` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by task status for status-sensitive quality workflows. |\n| `patient` + `code` | Added in US Quality Core. | Supports patient-scoped retrieval filtered by task code. This US Quality Core-specific combination makes the task code available as a primary retrieval path for quality logic. |"
    * interaction[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #read
    * interaction[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * code = #search-type
    * referencePolicy = #resolves
    * searchRevInclude = "Provenance:target"
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
    * searchParam[0]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * name = "patient"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-task-patient"
      * type = #reference
      * documentation = "The client **SHALL** provide an id value for the reference."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "status"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-task-status"
      * type = #token
      * documentation = "The client **MAY** provide a status."
    * searchParam[+]
      * extension
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #MAY
      * name = "code"
      * definition = "http://hl7.org/fhir/us/quality-core/SearchParameter/us-quality-core-task-code"
      * type = #token
      * documentation = "The client **MAY** provide a code value."
  * interaction[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #transaction
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #batch
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #search-system
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #history-system