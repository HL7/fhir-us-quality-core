ValueSet: USQualityCoreNegationReasonCodes
Id: us-quality-core-negation-reason-codes
Title: "US Quality Core Negation Reason Codes"
Description: "This value set defines the set of codes that can be used to indicate the reason an action was not taken"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2026-06-30"
* ^publisher = "HL7 International / Clinical Quality Information"
* ^contact.name = "Clinical Quality Information WG"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://www.hl7.org/Special/committees/cqi"
* ^jurisdiction = urn:iso:std:iso:3166#US
* ^purpose = "This value set was defined to support identifying any of the possible negation reason codes as part of US Quality Core profiles. The value set is composed of the codes from [Medical Reason Not Done SCT](http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.526.3.1007), [Patient Reason Not Done SCT](http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.526.3.1008), and concepts that are similar to [System Reason](http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.526.3.1009) as defined and available in the Value Set Authority Center. This value set was defined to support identifying any of the possible negation reason codes as part of US Quality Core profiles. The value set exists to support measure developers need to reference medical, patient, and system reasons for processes not performed and it is a grouping of VSAC value sets.  Therefore, retain binding to the US Quality Core value set in the profiles that use the extension.  It only exists to support bindings to capture a reason for negative."
* ^copyright = "This value set includes content from SNOMED CT, which is copyright © 2002+ International Health Terminology Standards Development Organisation (IHTSDO), and distributed by agreement between IHTSDO and HL7. Implementer use of SNOMED CT is not covered by this agreement"
* include codes from valueset http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1007
* include codes from valueset http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.526.3.1008
* SNOMED_CT#107724000 "Patient transfer (procedure)"
* SNOMED_CT#182856006 "Drug not available - out of stock"
* SNOMED_CT#182857002 "Drug not available - off market"
* SNOMED_CT#185335007 "Appointment canceled by hospital (finding)"
* SNOMED_CT#224194003 "Not entitled to benefits (finding)"
* SNOMED_CT#224198000 "Loss of benefits (finding)"
* SNOMED_CT#242990004 "Drug not available for administration (event)"
* SNOMED_CT#266756008 "Medical care unavailable (situation)"
* SNOMED_CT#270459005 "Patient on waiting list (finding)"
* SNOMED_CT#309017000 "Referred to doctor (finding)"
* SNOMED_CT#419808006 "Finding related to health insurance issues (finding)"
* SNOMED_CT#424553001 "Uninsured medical expenses (finding)"
