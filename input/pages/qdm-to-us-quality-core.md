{:toc}
The US Quality Core Implementation Guide includes the QDM-to–QI-Core mappings
from QI-Core v6.0.0, with minor edits and
[errata](https://jira.hl7.org/browse/FHIR-53324) as well as updated mappings to US Quality Core profiles and elements, as a reference to support the
transition from Quality Data Model (QDM)-based eCQMs to FHIR-based digital
quality measures (dQMs). QDM version 5.6 is the current version used by eCQMs
since 2024 and thus forms the basis for this mapping.

### Introduction

The CMS Quality Data Model (QDM) has been used to express electronic clinical
quality measures (eCQMs) in HQMF since 2012. QDM is a conceptual data model that
has evolved based on feedback, testing and use. The current version (Version 5.6
for eCQM implementation 2024, 2025 and 2026) and QDM's complete history can be
found on the [eCQI Resource Center](https://ecqi.healthit.gov/qdm). Most of the
QDM concepts map directly to US Core 6.1.0, FHIR R4 resources or extensions
represented in US Quality Core.

Each mapping table shows the US Quality Core concept in the right-hand column
and the corresponding QDM datatype(s) and attributes in the left-hand column.
The mapping tables primarily reference the US Quality Core metadata concepts
represented in QDM. The tables also include some US Quality Core concepts
identified as beneficial by measure developers and implementers; such elements
appear in the respective table’s middle column (under US Quality Core) and have
no corresponding left-hand column QDM attributes. The effort mapped the intended
meaning of each QDM datatype and attribute to a US Quality Core resource
metadata element. In some cases, multiple QDM datatypes map to a single US
Quality Core. Since QDM is a conceptual data model some of the elements may not
have a direct mapping to a US Quality Core profile or one of the items in its
respective Key Element Table. Content in the US Quality Core profile Key Element
Table tabs is based on US Core 6.1.0 requirements, or directly from FHIR 4.0.1
in the absence of a respective US Core profile.

In addition to the US Quality Core to QDM comparisons presented with each US
Quality Core resource, this section of the implementation guide presents the
mapping directly from QDM concepts. Thus, the IG provides a view of the mappings
in both directions (US Quality Core to QDM, and QDM to US Quality Core). This
section is divided into 55 sections, one for each QDM concept, or QDM datatype.
Each QDM datatype includes a general description of the concept and a table
mapping each of the QDM datatype-related attributes to US Quality Core metadata
elements. Refer to the [eCQI Resource Center](https://ecqi.healthit.gov/qdm) for
the full QDM 5.6 documentation.

### Adverse Event

QDM defines Adverse Event as any untoward medical occurrence associated
with the clinical care delivery, whether or not considered drug related.
The concepts aligns with the [FHIR R4 resource Adverse Event.](https://hl7.org/fhir/r4/adverseevent-definitions.html#key_AdverseEvent)
The FHIR resource provides clearer expressivity as compared with QDM.

The HL7 Patient Care Workgroup documented some [use cases](https://confluence.hl7.org/display/PC/Adverse+Event+Use+Cases) and [supporting information](https://confluence.hl7.org/display/PC/Adverse+Event+and+consequence) for using this resource; however, most adverse event information is more identifiable in clinical records as findings, conditions, or observations. Thus, measure developers may find more effective information retrieval by using the condition, simple observation, or specific observation profiles to identify triggers indicating potential adverse events. References for information regarding potential adverse event triggers: [CMS Hospital-Acquired Condition Reduction Program.](https://www.cms.gov/medicare/quality-initiatives-patient-assessment-instruments/value-based-programs/hac/hospital-acquired-conditions)
Also useful: [Institute for Healthcare Improvement Trigger Tool for Measuring Adverse Drug Events (requires registration)](https://www.ihi.org/resources/Pages/Tools/TriggerToolforMeasuringAdverseDrugEvents.aspx)

Much of the detail about adverse events is present in separate risk management systems based on incident reports rather than the electronic health record (EHR) except for some details in unstructured progress notes. For those using this “Adverse Event” QDM datatype, QDM includes an attribute code that represents the specific type of event that occurred, consistent with [AdverseEvent.event](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.event).

QDM does not include an attribute to address the additional elements available in US Quality Core: [AdverseEvent.suspectEntity](StructureDefinition-us-quality-core-adverseevent-definitions.html#diff_AdverseEvent.suspectEntity) (the suspected cause), or the [AdverseEvent.resultingCondition](StructureDefinition-us-quality-core-adverseevent-definitions.html#diff_AdverseEvent.resultingCondition). As an example to differentiate these elements:
* [AdverseEvent.event](StructureDefinition-us-quality-core-adverseevent-definitions.html#diff_AdverseEvent.event) = fall
* [AdverseEvent.resultingCondition](StructureDefinition-us-quality-core-adverseevent-definitions.html#diff_AdverseEvent.resultingCondition) = fracture
* [AdverseEvent.suspectEntity](StructureDefinition-us-quality-core-adverseevent-definitions.html#diff_AdverseEvent.suspectEntity) = area rug

QDM version 5.6 (and earlier versions) only address one of these elements, the event.
Therefore, QDM AdverseEvent code maps to AdverseEvent.event. Measure developers seeking to retrieve data about the cause of an AdverseEvent may be able to relate the occurrence timing of a potential causative event and the AdverseEvent.event timing. Further detail about the AdverseEvent will require use of FHIR or potentially a subsequent version of QDM after QDM 5.6.

| **QDM Context**    | **US Quality Core v0.5.0**       | **Comments**                                               |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------- |
| Adverse Event      | [AdverseEvent](StructureDefinition-us-quality-core-adverseevent.html)        |                                                            |
|                    | [AdverseEvent.actuality](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.actuality)                          |    Although not specified in QDM, US Quality Core provides the ability to differentiate between potential versus actual events                                                        |
| **QDM Attributes** |                    |                                                            |
| code               | [AdverseEvent.event](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.event)               | Type of the event itself in relation to the subject; reference SNOMED-CT event hierarchy to represent the event in an eCQM. Note: QDM does not include an attribute to address additional elements available in US Quality Core: AdverseEvent.suspectEntity (the suspected cause), or the AdverseEvent.resultingCondition. |
| type               | [AdverseEvent.category](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.category)         |                                                            |
| severity           | [AdverseEvent.severity](StructureDefinition-us-quality-core-adverseevent-definitions.html#AdverseEvent.severity)         |                                                            |
| relevantdateTime   | [AdverseEvent.date](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.date)                 |                                                            |
| facilityLocations  | [AdverseEvent.location](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.location)         |                                                            |
| authorDatetime     | [AdverseEvent.recordedDate](StructureDefinition-us-quality-core-adverseevent-definitions.html#AdverseEvent.recordedDate) |                                                            |
| id                 | [AdverseEvent.id](StructureDefinition-us-quality-core-adverseevent-definitions.html#AdverseEvent.id)                     |                                                            |
| recorder           | [AdverseEvent.recorder](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.recorder)         |                                                            |
|                    | [AdverseEvent.suspectEntity.instance](StructureDefinition-us-quality-core-adverseevent-definitions.html#key_AdverseEvent.suspectEntity.instance)         | The actual instance of what caused the adverse event. May be a substance, medication, medication administration, medication statement or a device.              |
{: .grid}


### Allergy/Intolerance

Allergy is used to address immune-mediated reactions to a substance such
as type 1 hypersensitivity reactions, other allergy-like reactions,
including pseudo-allergy.

Intolerance is a record of a clinical assessment of a propensity, or a
potential risk to an individual, to have a non-immune mediated adverse
reaction on future exposure to the specified substance, or class of
substance.

| **QDM Context**  | **US Quality Core v0.5.0** | **Comments** |
| ------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Allergy/Intolerance | [AllergyIntolerance](StructureDefinition-us-quality-core-allergyintolerance.html)    |       |
|                     | [AllergyIntolerance.clinicalStatus](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.clinicalStatus)      | Identifies if active, inactive, resolved; while not a QDM attribute, this is an important element for retrieving active allergies or intolerances.    |
|                     | [AllergyIntolerance.type](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.type)   | Defines difference between Allergy and Intolerance; while not a QDM attribute, this is an important element for differentiating between allergies and intolerances.    |
|                     | [AllergyIntolerance.verificationStatus](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.verificationStatus)   | Identifies if unconfirmed, confirmed, refuted, entered-in-error; while not a QDM attribute, this is an important element for retrieving confirmed allergies or intolerances.   |
|                     | [AllergyIntolerance.category](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.category)  | Helpful to identify classes of potential allergens such as food, medication, environment, biologic; while not a QDM attribute, this may be a helpful element for some use cases.    |
| **QDM Attributes**  |     |    |
| code                | [AllergyIntolerance.code](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.code)  | USCoreAllergySubstance; RxNorm for medication ingredients   |
| id                  | [AllergyIntolerance.id](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#AllergyIntolerance.id)    |           |
| prevalencePeriod    | [AllergyIntolerance.onset\[x\]](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.onset[x])    | Prevalence Period start time maps to AllergyIntolerance.onset[x]. Implementers may need to “map” existing allergy onset timings (e.g., day, age, year, etc.) to a corresponding dateTime to allow calculation of measure or CDS expressions.     |
| authorDatetime      | [AllergyIntolerance.recordedDate](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.recordedDate)    |  Indicates when recorded in the record, not necessarily the onset date             |
| type                | [AllergyIntolerance.reaction.manifestation](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.reaction.manifestation)   |   Clinical symptoms/signs associated with the event     |
| severity            | [AllergyIntolerance.reaction.severity](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.reaction.severity)   | Indicates seriousness, e.g., mild, moderate severe   |
|                     | [AllergyIntolerance.criticality](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#key_AllergyIntolerance.criticality)  | Indicates potential for clinical harm, e.g., low, high, unable-to-assess; not present as an attribute in QDM but may be helpful for some use cases   |
| recorder            | [AllergyIntolerance.recorder](StructureDefinition-us-quality-core-allergyintolerance-definitions.html#AllergyIntolerance.recorder)    |  The individual entering the data about the allergy or intolerance. Note this element is included in QDM but it is not included in the Key Element Table for US Quality Core AllergyIntolerance as it does not have a clear use case; i.e., no existing measures or clinical decision support usage requires the recorder or even the asserter of the allergy or intolerance.   |
{: .grid}


### Assessment

QDM defines Assessment as a resource used to define specific observations that clinicians use to guide treatment of the patient. An assessment can be a single question, or observable entity with an expected response, an organized collection of questions intended to solicit information from patients, providers or other individuals, or a single observable entity that is part of such a collection of questions. US Core 6.1.0 includes a number of specific observation profiles providing greater specificity in defining observations. US Quality Core inherits five of the observation profiles directly from US Core as no additional constraints are necessary:
*	[US Core Observation Occupation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-occupation.html)
*	[US Core Observation Pregnancy Intent Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html)
*	[US Core Observation Pregnancy Status Profile ]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html)
*	[US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
*	[US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)

US Quality Core derives from QI-Core, which adds additional constraints to the US Core Observation Screening Assessment and the US Core Simple Observation profiles:
*	[US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html) – generally used with for evaluation surveys and assessment tools
*	[US Quality Core Simple Observation Profile](StructureDefinition-us-quality-core-simple-observation.html) – represents any type of observation that is not classified as vital signs, laboratory, imaging, or other more specific observation types. For example, gestational age at birth as a standalone observation (i.e., not part of a survey or assessment tool).

#### Assessment, Order

Assessment, Order uses the ServiceRequest resource. The codes for ordering specific observations should reference the code element specified in the respective profiles: US Quality Core Observation Screening Assessment, US Quality Core Simple Observation; US Core Observation Occupation, US Core Observation Pregnancy Intent, US Core Pregnancy Status, US Core Observation Sexual Orientation, or US Core Smoking Status Observation.

| **QDM Context**   | **US Quality Core v0.5.0**   | **Comments**    |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Assessment, Order**      | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)    |              |
|                            | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)     | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Assessment, Order” and “Assessment, Recommended” datatypes. 	   |
|                            | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)     | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**         |            |             |
| Code                       | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)     |      What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)                      |
| id                         | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)  |                       |
| Reason                     | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)      |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)     |
| Author dateTime            | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)                           | When the request transitioned to being actionable.    |
| Negation Rationale          | See Below |
| Requester                   | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)   |    Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Assessment, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - with a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Assessment, Performed

QDM defines Assessment as a resource used to define specific
observations that clinicians use to guide treatment of the patient. An
assessment can be a single question, or observable entity with an
expected response, an organized collection of questions intended to
solicit information from patients, providers or other individuals, or a
single observable entity that is part of such a collection of questions.

"Assessment, Performed" maps to one of several US Quality Core or US Core profiles as applicable for the information desired:
*	[US Quality Core Simple Observation Profile](StructureDefinition-us-quality-core-simple-observation.html)
*	[US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html)
*	[US Core Observation Occupation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-occupation.html)
*	[US Core Observation Pregnancy Intent Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html)
*	[US Core Observation Pregnancy Status Profile ]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html)
*	[US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
*	[US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)



| **QDM Context**     | **US Quality Core v0.5.0**  | **Comments**        |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Assessment, Performed: General Use Case**   | [Observation](StructureDefinition-us-quality-core-simple-observation.html)           |       |
|                            | [Observation.category](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.category)   | Category helps to narrow the request to the class of observation required to meet measure intent. Each US Quality Core or US Core profile has a specific binding to concepts appropriate to the respective profile. Note that QDM does not have an attribute comparable to category, the element may be helpful in expressing a quality measure.        |
|                            | [Observation.status](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.status)    | Constrain status to -  final, amended, corrected. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Assessment, Performed” datatype.  |
| **QDM Attributes**         |     |     |
| code                       | [Observation.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.code)    |  Note specific bindings based on the US Quality Core or US Core profile used.     |
| id                         | [Observation.id](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.id)            |          |
| method                     | [Observation.method](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.method)    |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.  |
| relatedTo                  | [Observation.basedOn](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.basedOn)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.           |
|                             | [Observation.partOf](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.partOf)    | A larger event of which this particular Observation is a component or step. For example, an observation as part of a procedure.    |
|                             | [Observation.derivedFrom](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.derivedFrom)  |  Allows reference to the activity that led to the observation. |
| negationRationale           | See Below |
| reason                      | [Observation.basedOn](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.basedOn)   | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.    |
| result                      | [Observation.value\[x\]](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.value[x])  |          |
| interpretation              | [Observation.interpretation](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.interpretation)    | Explanation of significance of the observation result (e.g., critical, high, low)  |
| relevantDatetime            | [Observation.effective\[x\] dateTime](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])     |   Time observation occurred if a point in time.  |
| relevantPeriod              | [Observation.effective\[x\] Period](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])   |  Time observation occurred if it occurs over a period of time. |
| authorDatetime              | [Observation.issued](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.issued)     |   Time observation result made available.   |
| component                   | [Observation.component](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.component)   |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Many measures address components of a panel of simple observations as single elements. Note that the [US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html) allows reference to components by identifying the parent screening assessment and using the Observation.hasMember element to reference the individual observations within the set. Therefore, component is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles. |
| component.code              | [Observation.component.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.component.code)  |   See comment about component.  |
| component.result            | [Observation.component.value\[x\]](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.component.value[x])   |   See comment about component.   |
| performer                   | [Observation.performer](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.performer)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished. |
{: .grid}

##### Negation Rationale for Assessment, Performed
Use [US Quality Core Observation Cancelled](StructureDefinition-us-quality-core-observationcancelled.html) and reference the code element specified in the respective observation profile:
* [Observation.status](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.status) - With a value of "cancelled" (as implied by the fixed value in the profile)
* [Observation.extension:notDoneReason](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Observation.issued](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.issued) - When this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Observation that was not performed

#### Assessment, Recommended

Assessment, Recommended uses the ServiceRequest resource. The codes for recommending specific observations should reference the code element specified in the respective profile:
*	[US Quality Core Simple Observation Profile](StructureDefinition-us-quality-core-simple-observation.html)
*	[US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html)
*	[US Core Observation Occupation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-occupation.html)
*	[US Core Observation Pregnancy Intent Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html)
*	[US Core Observation Pregnancy Status Profile ]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html)
*	[US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
*	[US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)

| **QDM Context**    | **US Quality Core v0.5.0**  | **Comments**  |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Assessment, Recommended**   | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)     |             |
|                               | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Assessment, Order” and “Assessment, Recommended” datatypes.    |
|                               | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”   |
| **QDM Attributes**     |              |                |
| code                   | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)  |   What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)     |
| id                     | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)   |         |
| reason                 | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)   |    Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)    |
| authorDatetime         | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)  | When the request transitioned to being actionable.    |
| negationRationale      | See Below |
| requester              | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)    |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Assessment, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


### Care Experience

QDM defines Care Experience as the understanding and involvement derived from the direct participation of an individual in the maintenance or improvement of health. QDM represents two kinds of care experience: Patient Care Experience and Provider Care Experience. While generally interpreted as patient or provider satisfaction, experience may also represent understanding, involvement and other factors about the care received or given. Most often organizations obtain such information using questionnaires. Use cases are welcome to help provide examples for us of this concept. The Care Experience concept best fits with the FHIR Observation resource.

QDM’s “Care Experience” maps to either one of two US Quality Core profiles, dependent on the type of information desired:
* [US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html) – generally used with for evaluation surveys and assessment tools; if the care experience information is obtained using a survey, the US Quality Core Observation Screening Assessment Profile is appropriate.
* [US Quality Core Simple Observation Profile](StructureDefinition-us-quality-core-simple-observation.html) – If care experience is expressed as a single finding or observation, the US Quality Core Simple Observation profile is appropriate.


#### Patient Care Experience

QDM “Patient Care Experience” maps to [US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html) or [US Quality Core Simple Observation](StructureDefinition-us-quality-core-simple-observation.html), as applicable, for the information desired:


| **QDM Context**  | **US Quality Core v0.5.0**  | **Comments**  |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Patient Care Experience**  | [Observation](StructureDefinition-us-quality-core-simple-observation.html)  |      |
|                              | [Observation.status](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.status)  | Constrain status to -  final, amended, corrected. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Assessment, Performed” datatype.  |
| **QDM Attributes**    |       |
| code                  | [Observation.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.code)   |  Note specific bindings based on the US Quality Core or US Core profile used.   |
| id                    | [Observation.id](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.id)     |               |
|                       | [Observation.effective\[x\] dateTime](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x]) |   Time observation occurred if a point in time. Although not present in QDM’s “Patient Care Experience” datatype, this element could be useful in expressing measures.  |
|                       | [Observation.effective\[x\] Period](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])   |   Time observation occurred if it occurs over a period of time. Although not present in QDM’s “Patient Care Experience” datatype, this element could be useful in expressing measures.    |
| authorDatetime        | [Observation.issued](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.issued)      |   Time observation result made available.    |
| recorder              | [Observation.performer](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.performer)  | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished. [US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html) |
{: .grid}

#### Provider Care Experience

QDM “Provider Care Experience” maps to [US Quality Core Observation Screening Assessment Profile](StructureDefinition-us-quality-core-observation-screening-assessment.html) or [US Quality Core Simple Observation](StructureDefinition-us-quality-core-simple-observation.html), as applicable, for the information desired:

| **QDM Context**    | **US Quality Core v0.5.0**    | **Comments**         |
| ---------------------------- | -------------------------------------------------------------- | ------------------------------------------- |
| **Provider Care Experience** | [Observation.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.code)     |   Note specific bindings based on the US Quality Core or US Core profile used   |
| **QDM Attributes**  |             |                    |
| code                | [Observation.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.code)       |  Note specific bindings based on the US Quality Core or US Core profile used  |
| id                  | [Observation.id](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.id)           |             |
|                     | [Observation.effective\[x\] dateTime](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x]) | Time observation occurred if a point in time. Although not present in QDM’s “Provider Care Experience” datatype, this element could be useful in expressing measures. |
|                     | [Observation.effective\[x\] Period](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])   | Time observation occurred if it occurs over a period of time. Although not present in QDM’s “Provider Care Experience” datatype, this element could be useful in expressing measures. |
| authorDatetime      | [Observation.issued](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.issued)  | Time observation result made available.|
| recorder            | [Observation.performer](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.performer) | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished. |
{: .grid}

### Care Goal

QDM defines Care Goal as a defined target or measure to be achieved in
the process of patient care, that is, an expected outcome. A typical
goal is expressed as a change in status expected at a defined future
time. That change can be an observation represented by other QDM
categories (diagnostic tests, laboratory tests, symptoms, etc.)
scheduled for some time in the future and with a particular value. A
goal can be found in the plan of care (care plan), the structure used by
many stakeholders to define the management actions for the various
conditions, problems, or issues identified for the target of the plan.
This structure, through which the goals and care-planning actions and
processes can be organized, planned, communicated, and checked for
completion, is represented in QDM as a Record Artifact in which Care
Goal is found.

| **QDM Context**    | **US Quality Core v0.5.0**  | **Comments** |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Care Goal**      | [Goal](StructureDefinition-us-quality-core-goal.html)           |   Describes the intended objective(s) for a patient, group or organization  |
|                    | [Goal.achievementStatus](StructureDefinition-us-quality-core-goal-definitions.html#Goal.achievementStatus) |  QDM does not include an attribute to determine the status of a goal. US Quality Core inherits US Core and USCDI requirements to include this element that indicates concepts such as proposed, planned, accepted, active, on-hold, completed, cancelled, rejected, entered in error with a required binding to [value set GoalLifecyleStatus](http://hl7.org/fhir/R4/valueset-goal-status.html).  |
| **QDM Attributes** |         |              |
| code               | [Goal.description](StructureDefinition-us-quality-core-goal-definitions.html#Goal.description)    |  Code or test describing the goal. Description has an extensible binding to [US Core Goal Codes.]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-goal-description.html)  |
| id                 | [Goal.id](StructureDefinition-us-quality-core-goal-definitions.html#Goal.id)    |              |
| statusDate         |                         |              |
| targetOutcome      | [Goal.target.detail\[x\]](StructureDefinition-us-quality-core-goal-definitions.html#Goal.target.detail[x]) |  US Core 6.1.0 (USCDI) includes target outcome with a due date, but it does not include information about the target outcome. Thus the target outcome nor the target due date is not included in the US Quality Core Key Elements Table. |
| relevantPeriod     | [Goal.start\[x\]](StructureDefinition-us-quality-core-goal-definitions.html#Goal.start[x])                 |  When the goal pursuit begins. US Core 6.1.0 (USCDI) includes startDate (date) with binding to GoalStartEvent, events that might initiate a goal; examples include admission to hospital, discharge from hospital, completion time of procedure, childbirth. US Quality Core includes the start timing (date) and the triggering event with a preferred binding to [GoalStartEvent.](http://hl7.org/fhir/R4/valueset-goal-start-event.html)            |
|                    | [Goal.target.due\[x\]](StructureDefinition-us-quality-core-goal-definitions.html#Goal.target.due[x])       |  QDM does not include a target due date for a goal. US Core 6.1.0 (USCDI) and US Quality Core STU 6 include the target due date in their respective profile Key Element Tables. However, likelihood of retrieving a target due date may be limited and those using this element in measure expressions should work with implementers to determine feasibility.            |
| statusDate         | [Goal.statusDate](StructureDefinition-us-quality-core-goal-definitions.html#Goal.statusDate)               |  Date when goal status took effect. Neither US Core nor US Quality Core include this element in the Key Elements Table for this profile.    |
| relatedTo          | [Goal.addresses](StructureDefinition-us-quality-core-goal-definitions.html#Goal.addresses)                 |  Issues addressed by this goal. Neither US Core nor US Quality Core include this element in the Key Elements Table for this profile.            |
| performer          | [Goal.expressedBy](StructureDefinition-us-quality-core-goal-definitions.html#Goal.expressedBy)             | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM performer attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished. US Quality Core does not include this element in the Key Elements Table for this profile.       |
{: .grid}



### Communication

QDM defines Communication as the transmission, receipt, or
acknowledgement of information sent from a source to a recipient, such
as from one clinician to another regarding findings, assessments, plans
of care, consultative advice, instructions, educational resources, etc.
The following text from the FHIR Communication and Procedure Resources
may help to differentiate when to use Communication.

[***FHIR Communication Resource***](http://hl7.org/fhir/communication.html)

This resource is a record of a communication. A communication is a
conveyance of information from one entity, a sender, to another entity,
a receiver. The sender and receivers may be patients, practitioners,
related persons, organizations, or devices. Communication use cases
include:

  - A reminder or alert delivered to a responsible provider

  - A recorded notification from the nurse to the on-call physician (or
    any other specified person) that a patient's temperature exceeds a
    value

  - A notification to a public health agency of a patient presenting
    with a communicable disease reportable to the public health agency

  - Patient educational material sent by a provider to a patient

  - Unable to deliver lab results to ordering physician

Non-patient specific communication use cases may include:

  - A nurse call from a hall bathroom

  - Advisory for battery service from a pump

**Boundaries and Relationships (Section 8.22.2) - Communication and
Encounter**

  - The Communication is about the transfer of information (which might
    or might not occur as part of an encounter), while Encounter is
    about the coming together (in person or virtually) of a Patient with
    a Practitioner. Communication does not deal with the duration of a
    call, it represents the fact that information was transferred at a
    particular point in time.

  - The phone calls involving the Patient should be handled
    using [Encounter](http://hl7.org/fhir/encounter.html). Phone calls
    not involving the patient (e.g. between practitioners or
    practitioner to relative) that are tracked for billing or other
    purposes can use Communication to represent the information
    transferred but are not ideal to represent the call itself. A better
    mechanism for handling such calls will be explored in a future
    release.



#### Communication, Performed


| **QDM Context**    | **US Quality Core v0.5.0**  | **Comments**   |
| ---------------------------- |-----------------------------------------------------|--------------------------------------------------------- |
| **Communication, Performed** | [Communication](StructureDefinition-us-quality-core-communication.html)    |                       |
|                              | [Communication.status](StructureDefinition-us-quality-core-communication-definitions.html#Communication.status)   | QDM is a conceptual data model and it does not include a status attribute since it is incorporated in the name of the QDM datatype. US Quality Core requires specific detail about status. Constrain to completed.   |
| **QDM Attributes**      |             |                |
| code                    | [Communication.topic](StructureDefinition-us-quality-core-communication-definitions.html#Communication.topic)         |    Description of the purpose/content with preferred binding to [Communication Topic](http://terminology.hl7.org/ValueSet/communication-topic)    |
| id                      | [Communication.id](StructureDefinition-us-quality-core-communication-definitions.html#Communication.id)      |                    |
| category                | [Communication.category](StructureDefinition-us-quality-core-communication-definitions.html#Communication.category) |  QDM includes the attribute category allowing specification of the class of the communication (e.g., alert, notification, reminder, instruction). However, no current measures require this attribute as a specific category has not been significant to measure intent. Therefore, this element is not present in the US Quality Core profile Key Elements Table.   |
| medium                  | [Communication.medium](StructureDefinition-us-quality-core-communication-definitions.html#Communication.medium)  |  How communication occurs (e.g., physical presence, online written, email, handwritten, etc.). This element is not present in the US Quality Core profile Key Elements Table.  |
| sentDatetime            | [Communication.sent](StructureDefinition-us-quality-core-communication-definitions.html#Communication.sent)    |     When sent     |
| receivedDatetime        | [Communication.received](StructureDefinition-us-quality-core-communication-definitions.html#Communication.received)  | When received  |
| authorDatetime          | [Communication.extension:recorded](StructureDefinition-us-quality-core-communicationnotdone-definitions.html#Communication.extension:recorded) | Use of this QDM attribute is restricted to the QDM negation rationale use case. It does not apply to a communication with any status other than “not-done”. See Negation Rationale for Communication, Performed. |
| relatedTo               | [Communication.basedOn](StructureDefinition-us-quality-core-communication-definitions.html#Communication.basedOn)  | An order, proposal or plan fulfilled in whole or in part by this Communication. No current measures require this attribute. Therefore, this element is not present in the US Quality Core profile Key Elements Table  |
|                         | [Communication.inResponseTo](StructureDefinition-us-quality-core-communication-definitions.html#Communication.inResponseTo) | Response to a communication   |
| sender                  | [Communication.sender](StructureDefinition-us-quality-core-communication-definitions.html#Communication.sender)  |  Message sender  |
| recipient               | [Communication.recipient](StructureDefinition-us-quality-core-communication-definitions.html#Communication.recipient)  | Message recipient  |
| negationRationale       | See Below   |
{: .grid}

##### Negation Rationale for Communication, Performed

Use [US Quality Core Communication Not Done](StructureDefinition-us-quality-core-communicationnotdone.html), which contains:
* [Communication.status](StructureDefinition-us-quality-core-communicationnotdone-definitions.html#Communication.status) - With a value of "not-done" (as implied by the fixed value in the profile)
* [Communication.statusReason](StructureDefinition-us-quality-core-communicationnotdone-definitions.html#Communication.statusReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Communication.extension:recorded](StructureDefinition-us-quality-core-communicationnotdone-definitions.html#Communication.extension:recorded) - dateTime when this was made available
* [Communication.topic.extension:notDoneValueSet](StructureDefinition-us-quality-core-communicationnotdone-definitions.html#Communication.topic.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Communication that was not performed

### Diagnosis

QDM defines Condition/Diagnosis/Problem as a practitioner’s
identification of a patient’s disease, illness, injury, or condition.
This category contains a single datatype to represent all of these
concepts: Diagnosis. A practitioner determines the diagnosis by means of
examination, diagnostic test results, patient history, and/or family
history.

Based on changes in US Core STU5, US Quality Core now has two methods for expressing conditions, [US Quality Core Condition Problems and Health Concerns Profile](StructureDefinition-us-quality-core-condition-problems-health-concerns.html), and [US Quality Core Condition Encounter Diagnosis Profile](StructureDefinition-us-quality-core-condition-encounter-diagnosis.html). Please reference the respective profile pages for explanation of the rationale for using each of these profiles. Briefly, the Condition Problems and Health Concerns Profile meets the US Core Data for Interoperability (USCDI) version 2 ‘Problems’ and ‘Health Concerns’ and SDOH Problems/Health Concerns requirements. The Condition Encounter Diagnosis Profile further meets the USCDI v2 requirement to define Encounter Diagnosis.


| **QDM Context** | **US Quality Core v0.5.0**  | **Comments**  |
| ----------------------------------- | ------------------------ | ---------------------------------------------------------------------------- |
| **Condition - Diagnosis - Problem** | [Condition Problems and Health Concerns](StructureDefinition-us-quality-core-condition-problems-health-concerns.html)    |     |
|                                     | [ConditionProblemsHealthConcerns.clinicalStatus](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.clinicalStatus)         | QDM is a conceptual data model and it does not include a status attribute since it is incorporated in the name of the QDM datatype. US Quality Core requires specific detail about status. Clinical status defines active, recurrence, relapse, inactive, remission, resolved with required binding to [ConditionClinicalStatusCodes](http://hl7.org/fhir/R4/valueset-condition-clinical.html)  |
|                                     | [ConditionProblemsHealthConcerns.verificationStatus](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.verificationStatus) | Verification status defines confirmed, unconfirmed, provisional, differential, refuted, entered-in-error with required binding to [ConditionVerificationStatus](http://hl7.org/fhir/R4/valueset-condition-ver-status.html). QDM does not contain this attribute but it is valuable to determine metadata about a documented condition. |
|                                     | [ConditionProblemsHealthConcerns.category](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.category)                     | Category defines the class of condition documentation, e.g., problem-list-item, encounter-diagnosis, health-concern. QDM does not contain this attribute but it is valuable to determine metadata about a documented condition. |
| **QDM Attributes**           |    |                                                                     |
| code                         | [ConditionProblemsHealthConcerns.code](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.code)    |  Identification of the condition with extensible binding to [US Core Condition Codes.](http://hl7.org/fhir/us/core/ValueSet-us-core-condition-code.html)                      |
| id                           | [ConditionProblemsHealthConcerns.id](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.id)   |                    |
| prevalencePeriod             | [ConditionProblemsHealthConcerns.onset\[x\]](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.onset[x])                   |Estimated or actual date, date-time, or age. Note that some clinical products default condition documentation to date entered with option to change to date of onset.    |
|                              | [ConditionProblemsHealthConcerns.abatement\[x\]](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.abatement[x])           | When in resolution/remission. May be dateTime, Age, Period Range, string.   |
| authorDatetime               | [ConditionProblemsHealthConcerns.recordedDate](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.recordedDate) <br> [ConditionProblemsHealthConcerns.assertedDate](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.extension:assertedDate)   |   Recorded date is date record was first recorded. <br> Asserted date the condition was first asserted.   |
| severity                      | [ConditionProblemsHealthConcerns.severity](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.severity)      | Subjective severity of the condition (e.g., severe, moderate, mild). This element has limited feasibility and it is not in the Key Elements Table for US Core or US Quality Core for Condition Diagnosis and Health Concern or Condition Encounter Diagnosis.    |
| anatomicalLocationSite        | [ConditionProblemsHealthConcerns.bodySite](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.bodySite)      |   Anatomical location, if relevant. This element has limited feasibility and it is not in the Key Elements Table for US Core or US Quality Core for Condition Diagnosis and Health Concern or Condition Encounter Diagnosis. Often, condition.code indicates the body site.   |
| recorder                      | [ConditionProblemsHealthConcerns.recorder](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.recorder)          | Individual who recorded the record and takes responsibility for its content. This element has limited utility for a measure use case and it is not in the Key Elements Table for US Core or US Quality Core for Condition Diagnosis and Health Concern or Condition Encounter Diagnosis.  |
|                               | [ConditionProblemsHealthConcerns.asserter](StructureDefinition-us-quality-core-condition-problems-health-concerns-definitions.html#Condition.asserter)                     | Individual who is making the condition statement. This element has limited utility for a measure use case and it is not in the Key Elements Table for US Core or US Quality Core for Condition Diagnosis and Health Concern or Condition Encounter Diagnosis.   |
{: .grid}


### Device

QDM defines Device as an instrument, apparatus, implement, machine, contrivance,
implant, in-vitro reagent, or other similar or related article, including a
component part or accessory, intended for use in the diagnosis, cure,
mitigation, treatment, or prevention of disease and not dependent on being
metabolized to achieve any of its primary intended purposes.

FHIR defines the [Device Resource](http://hl7.org/fhir/R4/device.html) as a
type of a manufactured item that is used in the provision of healthcare without
being substantially changed through that activity. The device may be a medical
or non-medical device.

FHIR and US Core further differentiate devices into two "classes":
* Devices that interact with the human body but do not stay in it are referred
to as non-implantable medical devices.
* Implantable devices are those which stay in the human body with a medical
objective for an extended period of time, or even a lifetime.

[Definition reference: Imam W. How to use ISO 13485:2016 to manage implantable
devices, *ISO 13485 Blog*. July 4, 2016. Available at: https://advisera.com/13485academy/blog/2017/07/04/how-to-use-iso-134852016-to-manage-implantable-medical-devices/.
Accessed 28 January 2020.]

The FHIR [Device Resource](http://hl7.org/fhir/R4/device.html) addresses both
implantable and non-implantable devices. US Core only references [Implantable
Device]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-implantable-device.html).
US Quality Core inherits Implantable Device from US Core and builds directly from FHIR
for the US Quality Core Device Resource.

#### Device, Applied
QDM originally designed Device, Applied to allow access to documentation of
device usage. However, evaluation over time indicates that all documentation
about usage of a device occurs as an observation. Thus, information about an
implanted pacemaker status check, utilization of a patient-use Continuous
Positive Airway Pressure (CPAP) device, results from a glucometer, or use of a
wheelchair or cane should use the QDM datatype, Assessment, Performed, or
US Quality Core Observation. Use of Device, Applied has been synonymous with
Procedure, Performed, i.e., placement of or adjustment to a device.

"Device Applied" has been retired in QDM 5.6 in favor of using "Procedure, Performed" or
"Assessment, Performed" as appropriate.



#### Device, Order – Non-Patient-use Devices

| **QDM Context**         | **US Quality Core v0.5.0**     | **Comments**  |
| ----------------------- | ------------------------------------------------ | ---------------------------------------------------- |
| **Device Request**      | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)   |                                    |
|                         | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)   | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Device, Order” and “Device, Recommended” datatypes.  |
| **Device, Order**       | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)      |
| **QDM Attributes**      |                       |              |
| code                    | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)  |     What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)          |
| id                      | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                   |           |
| reason                  | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)   |   Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)   |
| authorDatetime          | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)   | When the request transitioned to being actionable.   |
| negationRationale       | See Below |
| requester               | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)     |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Device, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Device, Order – Personal Use Devices

| **QDM Context**         | **US Quality Core v0.5.0**    | **Comments**      |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| **Device Request**      | [DeviceRequest](StructureDefinition-us-quality-core-devicerequest.html)  |                   |
|                         | [DeviceRequest.status](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.status)     | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Device, Order” and “Device, Recommended” datatypes.  |
| **Device, Order**       | [DeviceRequest.intent](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.intent)     | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**      |                      |                  |
| code                    | [DeviceRequest.code\[x\]](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.code[x])       |    Device requested with preferred binding to [FHIRDeviceTypes.](http://hl7.org/fhir/R4/valueset-device-kind.html)      |
| id                      | [DeviceRequest.id](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.id)                   |              |
| reason                  | [DeviceRequest.reasonReference](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.reasonReference)   |  Linked reason for the request (e.g., condition or observation). This element is not included in the US Quality Core profile Key Elements Table since feasibility of retrieval is limited.  |
| authorDatetime          | [DeviceRequest.authoredOn](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.authoredOn)             | FHIR allows dateTime or Period for desired time or schedule for use.                                                                     |
| negationRationale       | See Below |
| requester               | [DeviceRequest.requester](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.requester)      |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}



##### Negation Rationale for Device, Order – Personal Use Devices

Use [US Quality Core DeviceNotRequested](StructureDefinition-us-quality-core-devicenotrequested.html), which contains:
* [DeviceRequest.modifierExtension:doNotPerform](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.modifierExtension:doNotPerform) - with a value of "true" (as implied by the fixed value in the profile)
* [DeviceRequest.status](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.status) - With a value of "completed"
* [DeviceRequest.extension:doNotPerformReason](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.extension:doNotPerformReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [DeviceRequest.authoredOn](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.authoredOn) - dateTime when this was made available
* [DeviceRequest.code\[x\].extension:doNotPerformValueSet](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.code%5Bx%5D.extension:doNotPerformValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific DeviceRequest that was not performed



#### Device, Recommended – Non-Patient-use Devices

| **QDM Context**       | **US Quality Core v0.5.0**  | **Comments**      |
| --------------------- | ----------------- | ----------------- |
| **Device Request**    | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)   |            |
|                       | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)    | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Device, Order” and “Device, Recommended” datatypes. |
| **Device, Order**     | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)    | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”   |
| **QDM Attributes**    |                               |                                                                                  |
| code                  | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)  |  What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)   |
| id                    | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                     |         |
| reason                | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)     |   Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)   |
| authorDateTime        | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)     |   When the request transitioned to being actionable  |
| negationRationale     | See Below |
| requester             | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)       |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Device, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Device, Recommended – Personal Use Devices

| **QDM Context**      | **US Quality Core v0.5.0**  | **Comments**     |
| -------------------- | ----------------- | ---------------- |
| **Device Request**   | [DeviceRequest](StructureDefinition-us-quality-core-devicerequest.html)                                                 |                    |
|                      | [DeviceRequest.status](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.status)         |  Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Device, Order” and “Device, Recommended” datatypes.   |
| **Device, Order**    | [DeviceRequest.intent](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.intent)         |   Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”.   |
| **QDM Attributes**   |                   |                  |
| code                 | [DeviceRequest.code\[x\]](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.code[x])     |   Device requested with preferred binding to [FHIRDeviceTypes.](http://hl7.org/fhir/R4/valueset-device-kind.html)   |
| id                   | [DeviceRequest.id](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.id)                 |                   |
| reason               | [DeviceRequest.reasonReference](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.reasonReference)    |   Linked reason for the request (e.g., condition or observation). This element is not included in the US Quality Core profile Key Elements Table since feasibility of retrieval is limited.   |
| authorDatetime       | [DeviceRequest.authoredOn](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.authoredOn) |   FHIR allows dateTime or Period for desired time or schedule for use.   |
| negationRationale    | See Below |
| requester            | [DeviceRequest.requester](StructureDefinition-us-quality-core-devicerequest-definitions.html#DeviceRequest.requester)   |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Device, Recommended – Personal Use Devices

Use [US Quality Core DeviceNotRequested](StructureDefinition-us-quality-core-devicenotrequested.html), which contains:
* [DeviceRequest.modifierExtension:doNotPerform](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.modifierExtension:doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [DeviceRequest.status](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.status) - With a value of "completed"
* [DeviceRequest.extension:doNotPerformReason](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.extension:doNotPerformReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [DeviceRequest.authoredOn](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.authoredOn) - dateTime when this was made available
* [DeviceRequest.code\[x\].extension:doNotPerformValueSet](StructureDefinition-us-quality-core-devicenotrequested-definitions.html#DeviceRequest.code%5Bx%5D.extension:doNotPerformValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific DeviceRequest that was not performed



### Diagnostic Study

QDM defines Diagnostic Study as any kind of medical test performed as a specific test or series of steps to aid in diagnosing or detecting disease (e.g., to establish a diagnosis, measure the progress or recovery from disease, confirm that a person is free from disease). The QDM differentiates diagnostic studies from laboratory tests in that diagnostic studies are those that are not performed in organizations that perform testing on samples of human blood, tissue, or other substances from the body. Diagnostic studies may make use of digital images and textual reports. Such studies include but are not limited to imaging studies, cardiology studies (electrocardiogram, treadmill stress testing), pulmonary-function testing, vascular laboratory testing, and others.



US Quality Core derives from QI-Core, which has added specific constraints on the US Core 6.1.0 profile that address such non-laboratory tests. This US Core v6.1.0 profile addresses (USCDI) requirements for Diagnostic Imaging and Clinical Tests Data Classes including all non-laboratory clinical test results (e.g., radiology and other clinical observations generated from procedures). It includes content represented in the previous US Core v5.0.1 and US Quality Core STU5 version profiles Clinical Test Result, and Imaging Result:

* •	[US Quality Core Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html) – non-laboratory, non-imaging tests; this profile is sufficiently broad that it should be used instead of the [US Quality Core Simple Observation](StructureDefinition-us-quality-core-simple-observation.html) profile for all non-laboratory test results.


#### Diagnostic Study, Order

“Diagnostic Study, Order” should reference orders for studies that will generate results for activities that meet criteria for Observation Clinical Result.


| **QDM Context**                | **US Quality Core v0.5.0**      | **Comments**     |
| ------------------------------ | ------------------------------------------------ | ------------------------------------------------------------ |
| **Diagnostic Study, Order**    | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)                                                  |     |
|                                | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)         | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Diagnostic Study, Order” and “Diagnostic Study, Recommended” datatypes. |
|                                | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)         |  Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**             |                         |                 |
| code                           | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)             |    What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)    |
| id                             | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                 |              |
| reason                         | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode) |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime                 | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn) | When the request transitioned to being actionable.  |
| negationRationale              | See Below |
| requester                      | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)   |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Diagnostic Study, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


#### Diagnostic Study, Performed

Individual studies may use [US Quality Core DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-us-quality-core-diagnosticreport-note.html) to provide information about an individual study (e.g., a cardiac ultrasound, MRI, etc.) although some have considered use of other reporting resources and artifacts. Since new studies regularly become available and the nature of existing studies change over time, a complete list of studies to reference a desired result cannot be assured. Therefore, a quality measure or clinical decision support (CDS) artifacts seeking a specific result value should use [US Quality Core Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html) to request a retrieve of the result value desired. This practice will enable implementers to determine which is the best source for the desired observation. LOINC observable entities may indicate specific methods for determination of results. Measure and CDS developers can reference direct reference codes or value sets using such LOINC codes to specify the type of testing considered acceptable to provide sufficient fidelity to their requests.


| **QDM Context**                 | **US Quality Core  v0.5.0**      | **Comments**    |
| ------------------------------- | ------------------------------------------------------------------------------------ | ----------------------------------------- |
| **Diagnostic Study, Performed** | [Observation Clinical Result Profile](StructureDefinition-us-quality-core-observation-clinical-result.html) |           |
|                                 | [ObservationClinicalResult.category](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#key_Observation.category) | Category helps to narrow the request to the class of observation required to meet measure intent. Each US Quality Core or US Core profile has a specific binding to concepts appropriate to the respective profile. ClinicalTestResult has a required binding to  [US Core Clinical Result Observation Category.]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-clinical-result-observation-category.html)   Note that QDM does not have an attribute comparable to category, the element may be helpful in expressing a quality measure.|
| **QDM Attributes**       |             |               |
| code                     | [ObservationClinicalResult.code](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.code)     |   Note specific binding to [LOINCCodes](http://hl7.org/fhir/R4/valueset-observation-codes.html)     |
| id                       | [ObservationClinicalResult.id](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.id)         |    |
| method                   | [ObservationClinicalResult.method](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.method) |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.   |
| facilityLocation         | N/A       |   Although QDM includes this attribute it has not been used in existing measures with respect to “Diagnostic Study, Performed”. There is also no clear element to which to map in the Observation resource |
| negationRationale        | See Below |
| reason                   | N/A       | There is no comparable concept element in the Observation resource |
| relatedTo                | [ObservationClinicalResult.basedOn](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.basedOn) | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles   |
| result                   | [ObservationClinicalResult.value\[x\]](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.value[x]) | Result Value  |
| interpretation           | [ObservationClinicalResult.interpretation](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.interpretation) | Explanation of significance of the observation result (e.g., critical, high, low) |
| resultDatetime           | [ObservationClinicalResult.issued](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.issued) |   Time observation result made available. |
| relevantDatetime         | [ObservationClinicalResult.effective\[x\] dateTime](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.effective[x])  |   Time observation occurred if a point in time.  |
| relevantPeriod           | [ObservationClinicalResult.effective\[x\] Period](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.effective[x])  |   Time observation occurred if it occurs over a period of time.   |
| status                   | [ObservationClinicalResult.status](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.status) | Constrain status to - final, amended, corrected. |
| authorDatetime           | [ObservationClinicalResult.issued](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.issued) | Time observation result made available. |
| component                | [ObservationClinicalResult.component](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.component) | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Many measures address components of an observation as single elements. Therefore, component is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles |
| component.code           | [ObservationClinicalResult.component.code](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.component.code) |   See comment about component.   |
| component.result         | [ObservationClinicalResult.component.value\[x\]](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.component.value[x])  |    See comment about component.       |
| performer                | [ObservationClinicalResult.performer](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.performer) |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM performer attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Diagnostic Study, Performed

Use [US Quality Core Observation Cancelled](StructureDefinition-us-quality-core-observationcancelled.html) and reference the code element specified in the respective observation profile:
* [Observation.status](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.status) - With a value of "cancelled" (as implied by the fixed value in the profile)
* [Observation.extension:notDoneReason](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Observation.issued](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.issued) - dateTime when this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Observation that was not performed

#### Diagnostic Study, Recommended

“Diagnostic Study, Recommended” should reference recommendations for studies that will generate results for activities that meet criteria for Observation Clinical Result.


| **QDM Context**     | **US Quality Core v0.5.0**   | **Comments**     |
| ------------------- | ------------------------------------- | ------------------------------------------------------------ |
| **Diagnostic Study, Recommended** | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)    |                  |
|                                   | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Diagnostic Study, Order” and “Diagnostic Study, Recommended” datatypes.  |
|                                   | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”    |
| **QDM Attributes**  |             |                         |
| code                | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)  | What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html) |
| id                  | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                      |     |
| reason              | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)      |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime      | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)      | When the request transitioned to being actionable.     |
| negationRationale   | See Below |
| requester           | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Diagnostic Study, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


### Encounter

QDM defines Encounter as an identifiable grouping of healthcare-related
activities characterized by the entity relationship between the subject
of care and a healthcare provider; such a grouping is determined by the
healthcare provider. A patient encounter represents interaction between
a healthcare provider and a patient with a face-to-face patient visit to
a clinician’s office, or any electronically remote interaction with a
clinician for any form of diagnostic treatment or therapeutic event.

#### Encounter Timing

Implementation considerations must be considered when referencing
encounter periods (start to end time).  Some clinical sites may leave
Encounters "open" until all documentation has been completed which may
take 72 hours or more.  However, the actual encounter may have lasted
for a much shorter time period (e.g., 15 minutes for an ambulatory
encounter). This issue is addressed in The Office of the National
Coordinator for Health IT (ONC) Issue Tracking System as item
[QDM-235](https://oncprojectracking.healthit.gov/support/projects/QDM/issues/QDM-235?filter=recentlyviewed).
Two approaches clinical sites have used to manage this issue include:

* Include a patient check-in and check-out time as part of the visit
documentation. These times represent when the patient arrives and
leaves, respectively, and these times are used for the Encounter
relevant period. However, patient arrival at a location does not
necessarily mean the start of the encounter (e.g. a patient arrives
an hour earlier than he or she is actually seen by a practitioner).

* Default an Encounter end as 23:59 on the date of the Encounter date
if it is left open to allow completion of documentation and update
the end time if the practitioner closing the chart enters a specific
time that the encounter ended.

Undoubtedly, other clinical sites have implemented other solutions to
documenting end times for ambulatory visits. Quality measure and
clinical decision support (CDS) artifact authors should consider such
issues when testing the validity and reliability of retrieved responses
to data queries.



#### Defining Arrival Time

Encounter.period provides the start and stop times of an encounter.
Some measures require specific reference to encounter _admissionTime_
while others require reference to a concept called _arrivalTime_.
The meaning of Encounter.period start cannot reference both timings.
Therefore, by convention and based on previous discussions with various HL7 workgroups,
Encounter.period _startTime_ represents _admissionTime_ for hospitalizations.
Therefore, to reference _arrivalTime_ QDM and US Quality Core use Encounter.location
to indicate the physical place where the initial encounter services occur,
and Encounter.location.period to indicate the _arrivalTime_ and the _departureTime_.
Thus, the measure query can differentiate between _admissionTime_ used to
determine length of stay and _arrivalTime_ used to indicate when the patient
presented for care at the location which is prior to the formal completion of the admission process.

An example of an encounter can be found [here](Encounter-encounter-ed-example.html)

#### Encounter-Related Diagnoses and Procedures

**US Quality Core v0.5.0 note**: The content below details information that was present in QI-Core 6.0.0 for Encounter-Related Diagnoses and Procedures. In US Quality Core v0.5.0, support for the Claim profile is not required for conformance. See the [USCDI+ Quality page](uscdiquality.html) for additional information about mappings to USCDI+ Quality V1 elements in US Quality Core v0.5.0.

Versions of QI-Core prior to 6.0.0 have used the [Encounter.diagnosis](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.diagnosis) element to reference to the list of diagnosis/diagnoses and procedures relevant to the encounter.
The [Encounter.diagnosis.usevalue](http://hl7.org/fhir/R4/valueset-diagnosis-role.html)
helped to differentiates if the diagnosis or procedure role with respect to the encounter,
e.g., the admission diagnosis (AD), the discharge diagnosis (DD), the chief complaint (CC),
a comorbidity diagnosis (CM), a pre-op diagnosis (pre-op), a post-op diagnosis (post-op)
or a billing diagnosis (billing). In versions prior to QI-Core 6.0.0, QI-Core _principal diagnosis_ was specified by
Encounter.diagnosis.use= _billing_, and Encounter.diagnosis.rank=1 with similar modeling for
principal procedures. In versions prior to QI-Core 6.0.0, QI-Core identified _present on admission (POA)_
using Encounter.diagnosis.onAdmission.

Feedback from implementers and standards experts indicated that concepts such as _principal diagnosis_,
_principal procedure_, and _present on admission_ were more appropriately retrieved using the [Claim profile](StructureDefinition-us-quality-core-claim.html).
Medical record coders review documentation and work with physicians to provide the adjudicated
determination of what represents a _principal diagnosis_, a _principal procedure_, and the final
_present on admission_ flag for each diagnosis. Therefore, the [Claim.diagnosis.sequence](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.sequence) = 1 plus
[Claim.diagnosis.diagnosis\[x\]](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.diagnosis[x]) defines a _principal diagnosis_. The [Claim.diagnosis.onAdmission](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.onAdmission) plus
[Claim.diagnosis.diagnosis\[x\]](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.diagnosis[x]) defines which diagnoses are _present on admission_. The [Claim.procedure.sequence](StructureDefinition-us-quality-core-claim-definitions.html#Claim.procedure.sequence) = 1
plus [Claim.procedure.procedure\[x\]](StructureDefinition-us-quality-core-claim-definitions.html#Claim.procedure.procedure[x]) defines a _principal procedure_.

For this reason, QI-Core 6.0.0 (and hence US Quality Core v0.5.0) no longer includes Encounter.diagnosis in the Key Elements Table of
the profile. This also aligns with the US Core 6.1.0 that use [Encounter.reasonCode](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonCode) and
[Encounter.reasonReference](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonReference)
for diagnoses or procedures managed during an encounter. Note the [Encounter.reasonCode](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonCode)
preferred binding to [Encounter Reason Code value set](http://hl7.org/fhir/R4/valueset-encounter-reason.html) allows use of SNOMED-CT clinical findings,
procedures, context-dependent categories, and events; [Encounter.reasonReference](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonReference) allows reference to [US Quality Core ConditionProblemsHeatlhConcerns](StructureDefinition-us-quality-core-condition-problems-health-concerns.html), [US Quality Core ConditionEncounterDiagnosis](StructureDefinition-us-quality-core-condition-encounter-diagnosis.html), [US Quality Core Procedure](StructureDefinition-us-quality-core-procedure.html), [US Quality Core SimpleObservation](StructureDefinition-us-quality-core-simple-observation.html), and [US Quality Core ImmunzationRecommendation](StructureDefinition-us-quality-core-immunizationrecommendation.html).

#### Encounter, Order

| **QDM Context**      | **US Quality Core v0.5.0**  | **Comments**   |
| -------------------- | -------------------------------------- | ------------------------------------------------------------ |
| **Encounter, Order** | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)   |                                                              |
|                      | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  |  Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Encounter, Order” and “Encounter, Recommended” datatypes.  |
|                      | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**   |                  |                  |
| code                 | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)     |  What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)    |
| id                   | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                  |                  |
| reason               | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)  |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html) |
| authorDatetime       | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)  | When the request transitioned to being actionable.  |
| facilityLocation     | [ServiceRequest.locationCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.locationCode)   |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM “Encounter, Requested” _location_ attribute was to differentiate where an encounter is expected to take place. Discussions with standards experts and vendor implementers at HL7 meetings indicate the request for an encounter should use the scheduling and/or appointment process (these are two different resources in HL7 FHIR). Only in those resources would the concept of the expected location. While the ServiceRequest resource includes a locationCode element with example binding to the [ServiceDeliveryLocationRoleType](http://terminology.hl7.org/5.0.0/ValueSet-v3-ServiceDeliveryLocationRoleType.html), the US Quality Core ServiceRequest profile does not include the item in the Key Element Tale.  |
| priority             | [ServiceRequest.modifierExtension:isElective](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.extension)  | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM “Encounter, Requested” _priority_ attribute was to differentiate elective encounters from non-elective encounters. Discussions with standards experts and vendor implementers at HL7 meetings indicate the request for an encounter should use the scheduling and/or appointment process (these are two different resources in HL7 FHIR). Only in those resources would the concept of priority be identified. Thus, the concept is not a clinical one. A procedure may have a priority but not an encounter. Therefore, the US Quality Core ServiceRequest profile does not include the modifierExtension:isElective in the Key Element Tale. |
| negationRationale    | See Below |
| requester            | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)   | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Encounter, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Encounter, Performed

| **QDM Context**           | **US Quality Core v0.5.0**  | **Comments**  |
| ------------------------- | ----------------- | ------------- |
| **Encounter, Performed**  | [Encounter](StructureDefinition-us-quality-core-encounter.html)     |         |
|                           | [Encounter.status](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.status)   | Constrain to - arrived, triaged, in-progress, on-leave, finished Note: most retrospective eCQMs will constrain Encounter.status to “finished”. Measures designed to monitor active encounters should consider using “in-progress”. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Encounter, Performed”. |
| **QDM Attribute**         |                   |               |
| code                      | [Encounter.type](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.type)       | Uses extensible binding to value set: [USCoreEncounterType]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-encounter-type.html)  |
| id                        | [Encounter.id](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.id)                 |               |
| class                     | [Encounter.class](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.class)           | Classification of the encounter (e.g., ambulatory, hospital, virtual) with extensible binding to value set:  [ActEncounterCode](http://terminology.hl7.org/5.0.0/ValueSet-v3-ActEncounterCode.html)  |
| relatedTo                 | [Encounter.basedOn](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.basedOn)       | Prior versions of US Quality Core included a Must Support for basedOn to reference the ServiceRequest generating the encounter. However, there has been no use of this element. Therefore, it no longer appears in the Encounter profile Key Element Table.  |
| relevantPeriod            | [Encounter.period](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.period)         | start and end time of encounter                                                                                      |
| diagnoses                 |                 |                                                     |
| diagnosis (code)          | [Encounter.reasonCode](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonCode) <br> or <br>[Encounter.reasonReference](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonReference)  | [Encounter.reasonCode](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonCode) has preferred binding to [Encounter Reason Code value set](http://hl7.org/fhir/R4/valueset-encounter-reason.html). [Encounter.reasonReference](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonReference) allows reference to [US Quality Core ConditionProblemsHeatlhConcerns](StructureDefinition-us-quality-core-condition-problems-health-concerns.html), [US Quality Core ConditionEncounterDiagnosis](StructureDefinition-us-quality-core-condition-encounter-diagnosis.html), [US Quality Core Procedure](StructureDefinition-us-quality-core-procedure.html), [US Quality Core SimpleObservation](StructureDefinition-us-quality-core-simple-observation.html), and [US Quality Core ImmunzationRecommendation](StructureDefinition-us-quality-core-immunizationrecommendation.html). |
| presentOnAdmissionIndicator (code) | [Claim.diagnosis.onAdmission](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.onAdmission) <br> plus <br> [Claim.diagnosis.diagnosis\[x\]](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.diagnosis[x]) defines which diagnoses are _present on admission_. | Indicator of whether the Encounter diagnosis was present at the time of admission. Note: this element uses the value set (required) diagnosis-on-admission (the same value set as used with the claim resource)  |
| rank (Integer)            | * _principal diagnosis_ is <br> [Claim.diagnosis.sequence](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.sequence) = 1 <br> plus <br> [Claim.diagnosis.diagnosis\[x\]](StructureDefinition-us-quality-core-claim-definitions.html#Claim.diagnosis.diagnosis[x]) <br> * _principal procedure_ is <br> [Claim.procedure.sequence](StructureDefinition-us-quality-core-claim-definitions.html#Claim.procedure.sequence) = 1 <br> plus <br>  [Claim.procedure.procedure\[x\]](StructureDefinition-us-quality-core-claim-definitions.html#Claim.procedure.procedure[x])   | Note change in QI-Core STU6  |
| procedures                | [Encounter.reasonCode](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonCode) <br> or <br>[Encounter.reasonReference](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonReference)   | [[Encounter.reasonCode](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonCode) has preferred binding to [Encounter Reason Code value set](http://hl7.org/fhir/R4/valueset-encounter-reason.html). [Encounter.reasonReference](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.reasonReference) allows reference to [US Quality Core ConditionProblemsHeatlhConcerns](StructureDefinition-us-quality-core-condition-problems-health-concerns.html), [US Quality Core ConditionEncounterDiagnosis](StructureDefinition-us-quality-core-condition-encounter-diagnosis.html), [US Quality Core Procedure](StructureDefinition-us-quality-core-procedure.html), [US Quality Core SimpleObservation](StructureDefinition-us-quality-core-simple-observation.html), and [US Quality Core ImmunzationRecommendation](StructureDefinition-us-quality-core-immunizationrecommendation.html). |
| lengthOfStay              | [Encounter.length](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.length)           |    The QDM concept length of stay is expressed using CQL expressions rather than a specific Encounter profile element. Therefore, this element is no longer included in the Encounter profile Key Element Table.      |
| authorDatetime            | Not Addressed      |    This QDM attribute is not addressed in the FHIR resource. And encounter occurs or it does not.    |
| admissionSource           | [Encounter.hospitalization.admitSource](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.hospitalization.admitSource)  |  The QDM concept hospital admission source has not been used in CMS measures to-date. In an effort to streamline US Quality Core v0.5.0, this element is no longer included in the Encounter profile Key Element Table.  It is available from the Snapshot Table but it is not clear that the information is available in clinical records even though it may be in administrative records.   |
| dischargeDisposition      | [Encounter.hospitalization.dischargeDisposition](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.hospitalization.dischargeDisposition) | Category or kind of location to which the patient is discharged. E.g., home, hospice, long-term care, etc.   |
| facilityLocations         |                     |                          |
| code                      | [Encounter.location.location](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.location.location)   |   The location the encounter takes place.    |
| locationPeriod            | [Encounter.location.period](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.location.period)       |  The time during which the patient is present at a specific location. Measures use the location period to identify the arrival and departure times for a location, distinguishing those times from the Encounter.period which provides a hospital _admissionTime_ and _dischargeTime_.   |
| participant               | [Encounter.participant.individual](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.participant.individual)    |   QDM includes this attribute to designate the individual responsible the patient’s care during this encounter. However, any given encounter may have more than one participant so using this element to specify attribution of care is challenging. Further   clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished. Therefore, US Quality Core STU 6 has removed this element from the Key Elements Table. It is not used in measures to-date.    |
|                           | [Encounter.serviceProvider](StructureDefinition-us-quality-core-encounter-definitions.html#Encounter.serviceProvider)| Encounter.serviceProvider identifies the organization that is primarily responsible for the Encounter’s services. Since US Core Encounter includes serviceProvider as a USCDI element, US Quality Core STU 6 includes Encounter.serviceProvider in the Key Elements Table. Unlike details about a participant, the organization responsible for the encounter should be available. |
{: .grid}

#### Encounter, Recommended

| **QDM Context**             | **US Quality Core v0.5.0**    | **Comments**                  |
| --------------------------- | ---------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Encounter, Recommended**  | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)   |                                                              |
|                             | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Encounter, Order” and “Encounter, Recommended” datatypes.	 |
|                             | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”   |
| **QDM Attributes**    |                          |                                                              |
| code                  | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)                 |    What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)  |
| id                    | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                     |                 |
| reason                | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)     | Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime        | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)     | When the request transitioned to being actionable.  |
| facilityLocation      | [ServiceRequest.locationCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.locationCode) |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM “Encounter, Requested” _location_ attribute was to differentiate where an encounter is expected to take place. Discussions with standards experts and vendor implementers at HL7 meetings indicate the request for an encounter should use the scheduling and/or appointment process (these are two different resources in HL7 FHIR). Only in those resources would the concept of the expected location. While the ServiceRequest resource includes a locationCode element with example binding to the [ServiceDeliveryLocationRoleType](http://terminology.hl7.org/5.0.0/ValueSet-v3-ServiceDeliveryLocationRoleType.html), the [US Quality Core ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html) profile does not include the item in the Key Element Tale. |
| priority              | [ServiceRequest.modifierExtension:isElective](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.extension)| Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM “Encounter, Requested” _priority_ attribute was to differentiate elective encounters from non-elective encounters. Discussions with standards experts and vendor implementers at HL7 meetings indicate the request for an encounter should use the scheduling and/or appointment process (these are two different resources in HL7 FHIR). Only in those resources would the concept of priority be identified. Thus, the concept is not a clinical one. A procedure may have a priority but not an encounter. Therefore, the US Quality Core ServiceRequest profile does not include the modifierExtension:isElective in the Key Element Tale. |
| negationRationale      | See Below |
| requester              | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)   |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.  |
{: .grid}



##### Negation Rationale for Encounter, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html), which contains:
* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

### Family History

QDM defines Family History as a diagnosis or problem experienced by a
family member of the patient. Typically, a family history will not
contain very much detail, but the simple identification of a diagnosis
or problem in the patient’s family history may be relevant to the care
of the patient.


| **QDM Context**    | **US Quality Core v0.5.0**        | **Comments**                    |
| ------------------ | ----------------------------------------------------------------- | ------------------------------- |
| **Family History** | [FamilyMemberHistory](StructureDefinition-us-quality-core-familymemberhistory.html)                                               |              |
|                    | [FamilyMemberHistory.status](StructureDefinition-us-quality-core-familymemberhistory-definitions.html#FamilyMemberHistory.status) | While QDM does not have an attribute comparable to status, as a conceptual model, status is required for us of most US Quality Core profiles. Constrain to partial, completed |
| **QDM Attributes** |                          |                                 |
| code               | [FamilyMemberHistory.condition.code](StructureDefinition-us-quality-core-familymemberhistory-definitions.html#FamilyMemberHistory.condition.code) | Condition suffered by relation. Extensible binding to [Condition/Problem/DiagnosisCodes](http://hl7.org/fhir/R4/valueset-condition-code.html)  |
| id                 | [FamilyMemberHistory.id](StructureDefinition-us-quality-core-familymemberhistory-definitions.html#FamilyMemberHistory.id)     |                                 |
| authorDatetime     | [FamilyMemberHistory.date](StructureDefinition-us-quality-core-familymemberhistory-definitions.html#FamilyMemberHistory.date) |  When history was recorded or last updated   |
| relationship       | [FamilyMemberHistory.relationship](StructureDefinition-us-quality-core-familymemberhistory-definitions.html#FamilyMemberHistory.relationship)     | Relationship to the subject. Preferred binding to [FamilyMember](http://terminology.hl7.org/ValueSet/v3-FamilyMember)  |
| recorder           | N/A        |  There is no comparable element in the FHIR FamilyMemberHistory resource and there is no use case evident for such information     |
{: .grid}



### Immunization

QDM defines Immunization as vaccines administered to patients in
healthcare settings but does not include non-vaccine agents. The [FHIR
Immunization
Recommendation](http://hl7.org/fhir/immunizationrecommendation.html)
resource is specifically designed to provide an immunization forecast
from a forecasting engine to a provider, basically to carry clinical
decision support recommendations specific to immunizations and,
therefore, is not consistent with the intent of the QDM datatype
"Immunization, Order" or "Immunization, Administered." The FHIR
[Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) references
an appraisal of an immunization that was administered to determine if it
is valid with respect to the expected immunization schedule. The
[US Core
Immunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html)
profile is most consistent with the QDM datatype *Immunization,
Administered*. The mapping tables provided include mapping from QDM
*Immunization, Administered* and a reference to the FHIR [Immunization
Evaluation](http://hl7.org/fhir/immunizationevaluation.html) resource.
Note, the mapping table includes additional metadata about immunizations
that QDM does not address, but that may be relevant to quality measures
or clinical decision support (CDS) artifacts.



#### Immunization, Administered

| **QDM Context**     | **US Quality Core v0.5.0**        | **Comments**                                       |
| ------------------------------ | --------------------------- | -------------------------------------------------- |
| **Immunization, Administered** | [Immunization](StructureDefinition-us-quality-core-immunization.html)                                          |                         |
|                                | [Immunization.status](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.status)   | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Immunization, Administered”. Constrain to “completed”     |
| **QDM Attributes**   |                    |                                                    |
| code                 | [Immunization.vaccineCode](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.vaccineCode)       |  Vaccine product type with extensible binding to [CVX Vaccines Administered Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.6/expansion).  |
| id                   | [Immunization.id](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.id)                         |            |
| dosage               | [Immunization.doseQuantity](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.doseQuantity)     |  Amount of vaccine administered. In most measure use cases, immunization dose is not required. Therefore, this element is not present in the US Quality Core profile Key Elements Table. |
| negationRationale    | See Below |
| route                | [Immunization.route](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.route)                   |  How the vaccine entered the body. In most measure use cases, immunization route is not required. Therefore, this element is not present in the US Quality Core profile Key Elements Table.   |
| reason               | [Immunization.reasonCode](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.reasonCode)         |  Why the immunization occurred. In most measure use cases, immunization rationale is not required. Therefore, this element is not present in the US Quality Core profile Key Elements Table.  |
| relevantDatetime     | [Immunization.occurrence\[x\]](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.occurrence[x]) |   Vaccine administration date.     |
| authorDatetime       | [Immunization.recorded](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.recorded)             |  When the immunization was first captured in the subject's record. This QDM attribute is most useful for the negation rationale use case – i.e., documentation why an immunization did not happen. Since the meaning is the timing of information capture, this element may also not be helpful to determine when vaccines given elsewhere were administered. |
| performer            | [Immunization.performer.actor](StructureDefinition-us-quality-core-immunization-definitions.html#Immunization.performer)     |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.  |
{: .grid}



##### Negation Rationale for Immunization, Administered

Use [US Quality Core ImmunizationNotDone](StructureDefinition-us-quality-core-immunizationnotdone.html), which contains:
* [Immunization.status](StructureDefinition-us-quality-core-immunizationnotdone-definitions.html#Immunization.status) - With a value of "not-done" (as implied by the fixed value in the profile)
* [Immunization.statusReason](StructureDefinition-us-quality-core-immunizationnotdone-definitions.html#Immunization.statusReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Immunization.recorded](StructureDefinition-us-quality-core-immunizationnotdone-definitions.html#Immunization.recorded) - dateTime
* [Immunization.vaccineCode.extension:notDoneValueSet](StructureDefinition-us-quality-core-immunizationnotdone-definitions.html#Immunization.vaccineCode.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific immunization that was not administered


#### Immunization, Order

This QDM context references the US Quality Core MedicationRequest profile as
there is no other FHIR resource to reference an order for an
immunization. The mapping uses the US Quality Core MedicationRequest resource
with the MedicationRequest.intent = *order* and
MedicationRequest.setting set to the setting most appropriate for the
intended meaning of the quality measure or clinical decision support
(CDS) expression.



| **QDM Context**         | **US Quality Core v0.5.0**   | **Comments**    |
| ----------------------- | ---------------------------------------------- | ----------------------------------------------------------------------------------------- |
| **Immunization, Order** | [MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)                                               |           |
|                         | [MedicationRequest.status](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.status)   |    While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Immunization, Order”. Constrain to active, completed.  |
|                         | [MedicationRequest.intent](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.intent)   |    Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order) |
| **QDM Attributes**   |                 |                  |
| code                 | [MedicationRequest.medication\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.medication[x])   | The QDM “Immunization, Order” datatype uses the US Quality Core MedicationRequest profile which has an extensible binding to [MedicationClinicalDrug (RxNorm)](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion). For Immunizations, can use the same Vaccine product type with extensible binding to [CVX Vaccines Administered Value Set](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.6/expansion) as with “Immunization, Administered”. |
| id                   | [MedicationRequest.id](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.id)        |             |
| activeDatetime       | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)<br> with <br> [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period    | QDM defines active dateTime as when the order indicates the first immunization administration should occur. Active dateTime is most often used to specify immunizations for which administration is intended at a specific time in the future. FHIR allows specification of the period during which the immunization should occur (start dateTime to end dateTime)   |
| authorDatetime       | [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.authoredOn)    |       |
| dosage               | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Amount of medication to be administered. Range, quantity    |
| route                | [MedicationRequest.dosageInstruction.route](StructureDefinition-us-quality-core-medicationrequest.html#MedicationRequest.dosageInstruction.route)   |   How drug should enter body.   |
| reason               | [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.reasonCode)  | The reason for ordering or not ordering the medication. This element has not been used by existing quality measures. It is not present in the US Quality Core profile Key Elements Table.  |
| supply               | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)  | Amount to be dispensed in one fill    |
| negationRationale    | See Below |
| requester            | [MedicationRequest.requester](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.requester)  | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM performer attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}



##### Negation Rationale for Immunization, Order

Use [US Quality Core MedicationNotRequested](StructureDefinition-us-quality-core-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [MedicationRequest.status](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.status) - With a value of "completed"
* [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - dateTime when this was made available
* [MedicationRequest.medication\[x\].extension:notDoneValueSet](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.medication[x].extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific MedicationRequest that was not performed

### Individual Characteristics

QDM’s approach to defining information about participants in the
healthcare process by defining specific attributes of healthcare participants. These
properties of a patient, clinician, provider, or facility include
demographics, behavioral factors, social or cultural factors, available
resources, and preferences. Behaviors reference responses or actions
that affect (either positively or negatively) health or healthcare.
Included in this category are mental health issues, adherence issues
unrelated to other factors or resources, coping ability, grief issues,
and substance use/abuse. Social/cultural factors are characteristics of
an individual related to family/caregiver support, education, and
literacy (including health literacy), primary language, cultural beliefs
(including health beliefs), persistent life stressors, spiritual and
religious beliefs, immigration status, and history of abuse or neglect.
Resources are means available to a patient to meet health and healthcare
needs, which might include caregiver support, insurance coverage,
financial resources, and community resources to which the patient is
already connected and from which the patient is receiving benefit.
Preferences are choices made by patients and their caregivers relative
to options for care or treatment (including scheduling, care experience,
and meeting of personal health goals) and the sharing and disclosure of
their health information.

FHIR more effectively represents these concepts in the Level 3
Administration Module – base data that is linked into other modules for
clinical content, finance/billing, workflow, etc. The Administration
Module specifies information about the patient, related person,
practitioner and organization that is the basis of healthcare-related
interactions such as encounters. QDM version 5.5 adopted a similar
approach to such information by adding a new concept called *Entities.
Entities* represent concepts that can be used to specify details about
an actor (or performer) participant in any activity represented by a QDM
datatype. These *entities* are analogous to the FHIR resources *Patient,
RelatedPerson, Practitioner,* and *Organization,* respectively called
*Patient, CarePartner, Practitioner* and *Organization* in QDM. The
mapping tables show these direct relationships to FHIR resources.
However, to maintain backward compatibility with prior QDM versions, QDM
5.5 retains the concept of Patient Characteristics for some metadata
about a patient; most of these characteristics map directly to metadata
elements in the FHIR Patient resource. QDM 5.5 removed the Provider
Characteristics QDM *datatype* in favor of the Practitioner and
Organization entities since there had been little, if any, use of these
QDM elements.

Accommodating patient-related metadata requires US Quality Core extensions for
several elements including:

  - Clinical Trial – Patients may be excluded from some quality measures
    or clinical decision support (CDS) workflows if they are
    participating in clinical trials. It is often necessary to determine
    the nature of the trial as exclusions may only apply if the clinical
    trial addresses the same clinical condition as the measure or CDS
    artifact, or if treatments potentially used in the clinical trial or
    the measure or CDS intervention conflict.

QDM 5.5 also added a new QDM *datatype Related Person* to allow
reference to an individual who has a personal or non-healthcare-specific
professional relationship with a patient. Modeled the same as the
*CarePartner* entity, the *Related Person* is an individual from whose
record clinical information should be retrieved to support care provided
to the index patient. 

  - Example 1: An infant’s gestational age at the time of birth may be
    calculated as the difference between the days between the mother’s
    estimated date of delivery (EDD) and the actual birth date. The
    mother’s EDD might be entered directly on the infant’s record as an
    observable entity about a *Related Person* (the infant’s mother).
    Alternatively, a cross-context query might request the information
    from the *Related Person’s* (mother’s) record.

  - Example 2: An organ recipient risk factor may include a donor’s
    positive Hepatitis C antibody result. The result relates to the
    donor (Related Person) whether that result is present on the
    recipient’s record or if the a cross-context query to the donor’s
    record retrieves the information.

#### QDM Entities

| **QDM Entities & Attributes** | **US Quality Core v0.5.0**  | **Comment**    |
| ----------------------------- | --------------------------------------------------------------- | ---------------------------------------------------------- |
| **Patient**                   | [Patient](StructureDefinition-us-quality-core-patient.html)       |                |
| identifier                    | [Patient.identifier.value](StructureDefinition-us-quality-core-patient-definitions.html#Patient.identifier.value)        |                |
| id                            | [Patient.id](StructureDefinition-us-quality-core-patient-definitions.html#Patient.id)        |                |
| **Care Partner**              | [RelatedPerson](StructureDefinition-us-quality-core-relatedperson.html)         | Related Person |
| identifier                    | [RelatedPerson.identifier](StructureDefinition-us-quality-core-relatedperson-definitions.html#RelatedPerson.identifier)     |                |
| id                            | [RelatedPerson.id](StructureDefinition-us-quality-core-relatedperson-definitions.html#RelatedPerson.id)         |                |
| relationship                  | [RelatedPerson.relationship](StructureDefinition-us-quality-core-relatedperson-definitions.html#RelatedPerson.relationship)     |                |
| **Practitioner**              | [Practitioner](StructureDefinition-us-quality-core-practitioner.html)           |                |
| identifier                    | [Practitioner.identifier](StructureDefinition-us-quality-core-practitioner-definitions.html#Practitioner.identifier) <br> (or specific practitioner identifier types: [Practitioner.identifier:ein](StructureDefinition-us-quality-core-practitioner-definitions.html#Practitioner.identifier:ein))   |                |
| id                            | [Practitioner.id](StructureDefinition-us-quality-core-practitioner-definitions.html#Practitioner.id)     |                |
| role                          | [PractitionerRole.code](StructureDefinition-us-quality-core-practitionerrole-definitions.html#PractitionerRole.code)           |                |
| specialty                     | [PractitionerRole.specialty](StructureDefinition-us-quality-core-practitionerrole-definitions.html#PractitionerRole.specialty)            |                |
| qualification                 | [Practitioner.qualification.code](StructureDefinition-us-quality-core-practitioner-definitions.html#Practitioner.qualification.code) |                |
| **Organization**              | [Organization](StructureDefinition-us-quality-core-organization.html)         |                |
| identifier                    | [Organization.identifier](StructureDefinition-us-quality-core-organization-definitions.html#Organization.identifier) <br> (or specific organizational identifier types: [Organization.identifier:ccn](StructureDefinition-us-quality-core-organization-definitions.html#Organization.identifier:ccn), [Organization.identifier:ein](StructureDefinition-us-quality-core-organization-definitions.html#Organization.identifier:ein))                |                |
| id                            | [Organization.id](StructureDefinition-us-quality-core-organization-definitions.html#Organization.id)   |                |
| organizationType              | [Organization.type](StructureDefinition-us-quality-core-organization-definitions.html#Organization.type)   | QDM attribute name update in QDM 5.6     |
| **Location**                  | [Location](StructureDefinition-us-quality-core-location.html)    | New in QDM 5.6   |
| identifier                    | [Location.identifier.value](StructureDefinition-us-quality-core-location-definitions.html#Location.identifier)    | New in QDM 5.6   |
| id                            | [Location.id](StructureDefinition-us-quality-core-location-definitions.html#Location.id)             | New in QDM 5.6 |
| locationType                  | [Location.type](StructureDefinition-us-quality-core-location-definitions.html#Location.type)         | New in QDM 5.6   |
{: .grid}

#### Patient Characteristics

| **QDM Attribute**  | **US Quality Core v0.5.0**        | **Comments**    |
| ------------------------------------ | ------------------------------------------------------------ | --------------------------------------------------- |
| **Race**      |                                                                                                                    |  See US CoreRaceExtension for details   |
| code          | [Patient.extension:race](StructureDefinition-us-quality-core-patient-definitions.html#Patient.extension:race)               |  URL: <http://hl7.org/fhir/us/core/StructureDefinition/us-core-race>        |
| id            |                                                                                                                    |          |
|               | [tribalAffiliation](StructureDefinition-us-quality-core-patient-definitions.html#key_Patient.extension:tribalAffiliation) | USCDI version 3 added a new concept, [tribalAffiliation](StructureDefinition-us-quality-core-patient-definitions.html#key_Patient.extension:tribalAffiliation), using US Core Tribal Affiliation Extension <br/> URL: <http://hl7.org/fhir/us/core/StructureDefinition/us-core-tribal-affiliation> |
|**Ethnicity**  |                                                                                                                    |          |
| code          | [Patient.extention:ethnicity](StructureDefinition-us-quality-core-patient-definitions.html#Patient.extension:ethnicity)     | URL: <http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity> |
| id            |                                                                                                                    |          |
| **Sex**       |                                                                                                                    |          |
| code          | [Patient.extension:birthsex](StructureDefinition-us-quality-core-patient-definitions.html#Patient.extension:birthsex)       | When created, QDM's focus was to address the concept of sex as identified at birth. Hence, this birthsex is the most direct mapping to the intent of QDM.  |
|               | [Sex](StructureDefinition-us-quality-core-patient-definitions.html#key_Patient.extension:sex) |  USCDI version 3 Sex extension <http://hl7.org/fhir/us/core/StructureDefinition/us-core-sex> with binding: [Created specifically to support United States USCDI v3 data element "Sex" (required)](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1240.3/expansion), a data element used for general documentation of sex representation: concepts limited to Male, Female, Patient Sex Unknown, asked-declined.  |
| id            |                                                                                                                    |          |
| **Birthdate** |                                                                                                                    |          |
| birthDatetime | [Patient.birthdate](StructureDefinition-us-quality-core-patient-definitions.html#Patient.birthDate)                         |  Fixed code 21112-8   |
| id            |                                                                                                                    |          |
| **Clinical Trial Participant** |    | Clinical Trial Participant should be handled as an Observation (i.e., Assessment, Performed) in QDM rather than a Patient Characteristic |
| **Expired**        |                                                                                                                    |           |
| code               | [Patient.deceased\[x\] boolean](StructureDefinition-us-quality-core-patient-definitions.html#Patient.deceased[x])           |           |
| id                 |                                                                                                                    |           |
| cause              |                     | Expiration cause requires use of Observation  |
| expirationDatetime | [Patient.deceased\[x\] dateTime](StructureDefinition-us-quality-core-patient-definitions.html#Patient.deceased[x])          |            |
| **Payer**          | [Coverage](StructureDefinition-us-quality-core-coverage.html)                                                               |            |
| code               | [Coverage.payor](StructureDefinition-us-quality-core-coverage-definitions.html#Coverage.payor)    | US Quality Core currently maps to policy holder which actually references the person who owns the policy, not the payor. |
| relevantPeriod     | [Coverage.period](StructureDefinition-us-quality-core-coverage-definitions.html#Coverage.period)                            |             |
| id                 | [Coverage.id](StructureDefinition-us-quality-core-coverage-definitions.html#Coverage.id)                                    |             |
| **Patient Characteristic (generic)** |                    |                     |
| N/A                                  |                    |    Requires definition for modeling a characteristic to US Quality Core and FHIR     |
{: .grid}

#### QDM *datatype* - Related Person

| **QDM Attribute**   | **US Quality Core v0.5.0**     | **Comments** |
| ------------------- | -------------------------------------------------------- | ------------ |
| **Related Person**  | [RelatedPerson](StructureDefinition-us-quality-core-relatedperson.html)    |              |
| identifier          | [RelatedPerson.identifier](StructureDefinition-us-quality-core-relatedperson-definitions.html#RelatedPerson.identifier)     |              |
| id                  | [RelatedPerson.id](StructureDefinition-us-quality-core-relatedperson-definitions.html#RelatedPerson.id)                     |              |
| linkedPatientId     | N/A                                                                                                                | Not present in US Quality Core    |
| code                | [RelatedPerson.relationship](StructureDefinition-us-quality-core-relatedperson-definitions.html#RelatedPerson.relationship) |  The nature of the relationship; preferred binding to [PatientRelationshipType](http://hl7.org/fhir/R4/valueset-relatedperson-relationshiptype.html)  |
{: .grid}

### Intervention

QDM defines Intervention as a course of action intended to achieve a result in
the care of persons with health problems that does not involve
direct physical contact with a patient. Examples include patient
education and therapeutic communication.

#### Procedure Vs Intervention

FHIR references both of these concepts using the *Procedure* resource,
specifically noting a process that involves verification of the
patient's comprehension or to change the patient's mental state would be
a Procedure. Therefore, both QDM *datatypes*, Procedure and Intervention
are included in this section of the QDM to US Quality Core mapping especially
since all of the QDM attributes for each of these QDM *datatypes* are
identical.



#### Intervention, Performed

| **QDM Context**             | **US Quality Core v0.5.0**                                            | **Comments**                   |
| --------------------------- | ----------------------------------------------------------- | ------------------------------ |
| **Intervention, Performed** | [Procedure](StructureDefinition-us-quality-core-procedure.html)      |                                |
| **QDM Attributes**      |                                             |                                                 |
| status                  | [Procedure.status](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.status)   | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the QDM datatype name “Procedure, Performed”. Constrain to “completed”   |
| code                    | [Procedure.code](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.code)       | Identification of the procedure. Extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html) |
| id                      | [Procedure.id](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.id)           |        |
| relatedTo               | [Procedure.basedOn](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.basedOn) |   A reference to a resource that contains details of the request for this procedure. There has not been a use case for this element in existing measures; therefore, it is not included in the US Quality Core profile Key Elements Table. |
| method                  | N/A                            | Procedure.method does not exist in FHIR. Rather than create an extension, US Quality Core's approach is to assume the Procedure.code includes reference to the method.  |
| rank                    | [Claim.procedure.sequence](StructureDefinition-us-quality-core-claim-definitions.html#Claim.procedure.sequence)  | Used to identify a principal procedure in the content of an encounter. See discussion in the QDM “Encounter, Performed” section indicating the rationale for using the Claim profile to identify principal or primary procedures and conditions. |
| priority                | N/A   | This QDM attribute is intended to reference elective from non-elective procedures. See discussion regarding “Encounter, Order” _priority_ which was created to differentiate elective encounters from non-elective encounters. Similar to the encounter discussion, a given procedure is not inherently elective or non-elective, the urgency is based on a patient’s status and other factors. Information about urgency, elective, non-elective may be found a scheduling or appointment application which may generate a tag for a procedure in the clinical record. This item is not present in the FHIR Procedure resource. Measure developers should work with clinical sites to determine the most effective method for identifying procedure priority. |
| anatomicalLocationSite  | [Procedure.bodySite](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.bodySite)  |   Target body sites with preferred binding to [SNOMEDCT Body Structures](http://hl7.org/fhir/R4/valueset-body-site.html). Existing measures have not provided a use case for this element. Therefore, the element does not appear in the US Quality Core profile Key Elements Table.   |
| reason                  | [Procedure.reasonCode](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.reasonCode)  |  Code reason procedure is performed. Preferred binding to [Procedure Reason Codes](http://hl7.org/fhir/R4/valueset-procedure-reason.html).     |
| result                  | [Simple Observation](StructureDefinition-us-quality-core-simple-observation.html) or [Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html) that includes the element [SimpleObservation.partOf](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.     |        [Procedure.report](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.report) references [DiagnosticReport-note](StructureDefinition-us-quality-core-diagnosticreport-note.html), DocumentReference, Composition (histology result, pathology report, surgical report, etc.); the latter two are not US Quality Core resources. However, based on feedback suggested that a procedure result might be better identified as [Simple Observation](StructureDefinition-us-quality-core-simple-observation.html) or [Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html) that includes the element [SimpleObservation.partOf](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.partOf) resources referencing the [ObservatonClinicalResult.partOf](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.partOf), or the [SimpleObservation.partOf](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.partOf) element to reference the procedure to which it applies.  |
| negationRationale       | See Below |
| relevantDatetime        | [Procedure.performed\[x\] dateTime](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.performed[x])   |  When the procedure was performed (as a single point in time).   |
| relevantPeriod          | [Procedure.performed\[x\] Period](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.performed[x])     |   When the procedure was performed (over a period of time).      |
| incisionDatetime        | [Procedure.extension:incisionDateTime](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.extension)   |    The first incision time. Existing measures do not use this element; therefore, it is not included in the US Quality Core profile Key Elements Table.       |
| authorDatetime          | [Procedure.extension:recorded](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.extension:recorded)  | When the procedure was first captured in the subject’s record. This element is useful for historical procedures and for the QDM negation rationale concept.   |
|                         | [Procedure.usedReference](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.usedReference) <br> [Procedure.usedCode](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.usedCode)         |      These elements help to add reference to a device, medication, or substance used as part of a procedure the US Quality Core element to address the device is used by the procedure. However, feedback has suggested that implementers prefer a direct, precoordinated code for the procedure that also indicates the type of device used rather than having to connect a specific item/device used to perform the procedure. Thus, while modeling allows usedCode or usedReference, feasibility is very limited. For that reason, these elements are not included in the US Quality Core profile Key Elements Table.   |
| components              | N/A                            | Procedure does not include component.    |
| component.code          | N/A                            | N/A                                      |
| component.result        | N/A                            | N/A                                      |
| performer               | [Procedure.performer.actor](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.performer.actor)      |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished    |
{: .grid}



##### Negation Rationale for Intervention, Performed

Use [US Quality Core ProcedureNotDone](StructureDefinition-us-quality-core-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.status) - With a value of "not-done" (as implied by the fixed value in the profile)
* [Procedure.statusReason](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.extension:recorded) - dateTime when this was made available
* [Procedure.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Procedure that was not performed



#### Intervention, Order

| **QDM Context**     | **US Quality Core v0.5.0**         | **Comments**                                                 |
| --------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Intervention, Order**     | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)                                             |                |
|                             | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)    | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Intervention, Order” and “Intervention, Recommended” datatypes.  |
|                             | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)     | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order) |
| **QDM Attributes**  |                                              |                                                              |
| code                | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)    |   What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)  |
| id                  | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                    |                   |
| reason              | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)    | Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)   |
| authorDatetime      | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)    | When the request transitioned to being actionable.   |
| negationRationale   | See Below |
| requester           | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)      |     Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.        |
{: .grid}


##### Negation Rationale for Intervention, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Intervention, Recommended

| **QDM Context**                 | **US Quality Core v0.5.0**          | **Comments**        |
| ------------------------------------ | -------------------------------------------------------------- | ------------------------------------------------------------ |
| **Intervention, Recommended**   | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)    |                                                              |
|                                 | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)    | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Intervention, Order” and “Intervention, Recommended” datatypes.    |
|                                 | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)    | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”        |
| **QDM Attributes**    |                                        |                                                              |
| code                  | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code) |   What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)     |
| id                    | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)     |                |
| reason                | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)      |    Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime        | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)      | When the request transitioned to being actionable. |
| negationRationale     | See Below |
| requester             | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)        |    Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Intervention, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


### Laboratory Test

QDM defines Laboratory Test as a medical procedure that involves testing a sample of blood, urine, or other body fluids or specimens. Tests can help determine a diagnosis, plan treatment, check to see if treatment is working, or monitor the disease over time. This QDM data category for Laboratory Test is only used for information about the subject of record.


Rather than directly referencing the [US Core Laboratory Result Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-lab.html), QI-Core 5.0.0 builds on that profile to add further constraint requirements and US Quality Core inherits that as [US Quality Core Laboratory Result Observation](StructureDefinition-us-quality-core-observation-lab.html). The reason for this approach is to assure the profile Key Elements Table includes elements such as  interpretation, specific result datatypes, and additional constraints.


Each laboratory test may be ordered individually or in a panel. Many use panels for convenience for ordering laboratory tests. Since new laboratory panels regularly become available and the myriad of potential laboratory panels available, a complete list cannot be assured. LOINC observable entities may indicate specific methods for determination of results. Measure and CDS developers can reference direct reference codes or value sets using such LOINC codes to specify the type of testing considered acceptable to provide sufficient fidelity to their requests.


#### Laboratory Test, Order

“Laboratory Test, Order” should reference orders for studies that will generate results for activities that meet criteria for Observation Lab Result.


| **QDM Context**      | **US Quality Core v0.5.0**               | **Comments**                                                 |
| --------------------------------------- | -------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Laboratory Test, Order**  | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)       |                                                              |
|                             | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Laboratory Test, Order” and “Laboratory Test, Recommended” datatypes. |
|                             | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**    |                                          |                                                              |
| code                  | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)   |  What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)   |
| id                    | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)       |                  |
| reason                | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)        |   Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime        | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)        | When the request transitioned to being actionable.                                                             |
| negationRationale     | See Below |
| requester             | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)      | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Laboratory Test, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Laboratory Test, Performed


| **QDM Context**    | **US Quality Core v0.5.0**         |**Comments**                           |
| ------------------ | -----------------------  | ------------------------------------- |
| **Laboratory Test, Performed** | [Laboratory Result Observation](StructureDefinition-us-quality-core-observation-lab.html)               |                            |
| **QDM Attribute**  |             |                            |
| code               | [Observation.code](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.code)         |   Note specific bindings based on the US Quality Core or US Core profile used.  |
| id                 | [Observation.id](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.id)             |                            |
| method             | [Observation.method](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.method)     |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.  |
| negationRationale  | See Below |
| reason             | [Observation.basedOn](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.basedOn)   | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.    |
| result             | [Observation.value\[x\]](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.value[x])           |                            |
| interpretation     | [Observation.interpretation](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.interpretation) |  Explanation of significance of the observation result (e.g., critical, high, low).    |
| relatedTo          | [Observation.partOf](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.partOf)   | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.   |
| resultDatetime     | [Observation.issued](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.issued)   |  Time observation result made available.  |
| relevantDatetime   | [Observation.effective\[x\]](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.effective[x])   | Time observation occurred if a point in time.   |
| relevantPeriod     | [Observation.effective\[x\]](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.effective[x])   | Time observation occurred if it occurs over a period of time.  |
| status             | [Observation.status](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.status)   | Constrain status to -  final, amended, corrected. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Assessment, Performed” datatype.  |
| authorDatetime     | [Observation.issued](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.issued)   | Time observation result made available. |
| referenceRangeHigh | [Observation.referenceRange.high](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.referenceRange.high)   |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.  |
| referenceRangeLow  | [Observation.referenceRange.low](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.referenceRange.low)     | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.   |
| component          | [Observation.component](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.component)     |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Many measures address components of a panel of simple observations as single elements. Therefore, _component_ is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles   |
| component.code     | [Observation.component.code](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.component.code)      |   See comment about component.  |
| component.result   | [Observation.component.value\[x\]](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.component.value[x])    |  See comment about component.  |
| component.referenceRangeHigh | [Observation.component.referenceRange](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.component.referenceRange)   |   See comment about component.  |
| component.referenceRangeLow  | [Observation.component.referenceRange](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.component.referenceRange)   |  See comment about component.  |
| performer         | [Observation.performer](StructureDefinition-us-quality-core-observation-lab-definitions.html#Observation.performer)   |    Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Laboratory Test, Performed

Use [US Quality Core Observation Cancelled](StructureDefinition-us-quality-core-observationcancelled.html) and reference the code element specified in the respective observation profile:

* [Observation.status](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.status) - With a value of "cancelled" (as implied by the fixed value in the profile)
* [Observation.extension:notDoneReason](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Observation.issued](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.issued) - When this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Observation that was not performed

#### Laboratory Test, Recommended

| **QDM Context**      | **US Quality Core v0.5.0**               | **Comments**                                                 |
| ------------------------------------------ | ----------------------------------------------------------------------- | -------------------------------------------- |
| **Laboratory Test, Recommended**  | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)      |                                                              |
|                                   | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)       | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, _status_ is implied by the name “Laboratory Test, Order” and “Laboratory Test, Recommended” datatypes.   |
|                                   | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)       | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”    |
| **QDM Attributes**  |                               |                                                              |
| code                | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)   |   What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)  |
| id                  | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)       |                    |
| reason              | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)   |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html) |
| authorDatetime      | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)   | When the request transitioned to being actionable.   |
| negationRationale   | See Below |
| requester           | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)     | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.  |
{: .grid}

##### Negation Rationale for Laboratory Test, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


### Medication

QDM defines Medication as clinical drugs or chemical substances intended
for use in the medical diagnosis, cure, treatment, or prevention of
disease. Medications are defined as direct referenced values or value
sets containing values derived from code systems such as RxNorm. QDM
defines five contexts for Medication, each of which is listed below
referencing the US Core or FHIR resource which provides the expected
context:

#### Medication, Active

This QDM context correlates with a medication on a patient’s active medication
list. In QI-Core STU3, Medication, Active was mapped to MedicationStatement.
However, consistent with US Core STU4 and subsequent versions, medication list should use
MedicationRequest and not MedicationStatement. The mapping table provides
guidance about how to use MedicationRequest.requester to specify medications
ordered directly, those reported by a physician and those reported by the
patient for a medication list.

Include all MedicationRequest resources with an intent = "order" representing authorized medication orders directly derived from the system’s orders.

The MedicationRequest **SHALL** include all practitioner-reported and "self-reported" medications reported by the Provider, Patient or Related Person.

* **SHALL** use reported[x] to indicate the MedicationRequest record was captured as a secondary “reported” record rather than an original primary source-of-truth record. It may also indicate the source of the report
* When recording "self-reported" or "self-prescribed" medications **SHALL** use intent = “plan”
* When recording "self-prescribed" orders, **SHOULD** use the requester to indicate the Patient or RelatedPerson as the prescriber


| **QDM Context**  | **US Quality Core v0.5.0**     | **Comments**          |
| ----------------------- | ----------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| **Medication, Active**  | [MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)              |      |
|                         | [MedicationRequest.status](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.status)    | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Medication, Order”. Constrain to active, completed  |
|                         | [MedicationRequest.intent](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.intent)    | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)    |
|                         | [MedicationRequest.reported[x]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.reported[x])   | When recording "self-reported" or "self-prescribed" medications **SHALL** use reported[x] to indicate the MedicationRequest record was captured as a secondary “reported” record rather than an original primary source-of-truth record; "self-prescribed" medication **SHOULD** indicate the MedicationRequest.requester as the patient or related person.     |
|                         | [MedicationRequest.category](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.category) | Type of medication usage using [Medication Category Codes](http://hl7.org/fhir/R4/valueset-medicationrequest-category.html) |
| **QDM Attribute**   |                                |                          |
| code                | [MedicationRequest.medication\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.medication[x])  |   Medication to be taken an extensible binding to [MedicationClinicalDrug (RxNorm)](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion).   |
| id                  | [MedicationRequest.id](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.id)   |                          |
| dosage              | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x])  | Amount of medication per dose     |
| frequency           | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) | Amount of medication to be administered. Range, quantity |
| route               | [MedicationRequest.dosageInstruction.route](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)  |   How drug should enter body   |
|                     | [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.reasonCode)  |   The reason for ordering or not ordering the medication. This element has not been used to-date in quality measures; it is not included in the US Quality Core profile Key Elements Table  |
| relevantDatetime    | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime  |    Timing – when medication should be administered; Timing.event when the event occurs    |
| relevantPeriod      | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period | Length/Range of lengths, or (Start and/or End) limits   |
|                     | [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.authoredOn)   |  When request was originally authored. Not referenced in QDM  |
| recorder            | [MedicationRequest.requester](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.requester)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.  |
{: .grid}

#### Medication, Administered

This QDM context correlates with a record of a patient consuming or
otherwise being administered a medication. It references individual
medication administration events and, therefore, may not reference
frequency of administration. Note that a separate QDM and US Core
profile address Immunization, Administered.


| **QDM Context**   | **US Quality Core v0.5.0**    | **Comments**      |
| ---------------------------- | -------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **Medication, Administered** | [MedicationAdministration](StructureDefinition-us-quality-core-medicationadministration.html)    |                          |
|                              | [MedicationAdministration.status](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.status)  |    While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Medication, Administered”. Constrain status to “In-progress” or “completed” Note: Measures that look for evidence of potential adverse events might use MedicationAdministration.status = on-hold, or stopped as possible indicators of such events. |
|                              | [MedicationAdministration.category](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.category)  | Type of medication usage using [Medication Category Codes](http://hl7.org/fhir/R4/valueset-medicationrequest-category.html). Allows specification of Inpatient, Outpatient, Community |
| **QDM Attributes**   |                                            |                                                                         |
| code                 | [MedicationAdministration.medication\[x\]](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.medication[x])  |Medication to be taken an extensible binding to [MedicationClinicalDrug (RxNorm)](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion).   |
| id                   | [MedicationAdministration.id](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.id) |               |
| dosage               | [MedicationAdministration.dosage.dose](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.dosage.dose)   | Simple Quantity - Amount of medication for one administration  |
| route                | [MedicationAdministration.dosage.route](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.dosage.route)  |  Path of substance into the body with preferred binding to [SNOMEDCT Route Codes](http://hl7.org/fhir/R4/valueset-route-codes.html).  |
| frequency            | [MedicationAdministration.request](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.request)  | Reference to original MedicationRequest with content about prescription. Generally, retrieval of medication administration events applies to locations that administer medications directly to a patient (e.g., hospital settings, skilled nursing facilities, Community-Based Residential Facilities (CBRFs), outpatient surgery centers). Linkage to the original authorizing prescription has not been considered relevant for the existing measure use cases requiring only to retrieve information about one or more administration events.  |
|                      | [MedicationAdministration.dosage.rate\[x\]](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.dosage.rate[x])     | The rate, dose quantity per unit of time (e.g., infusion rate). This element has not been the focus of measures to date, therefore, it is not included in the US Quality Core profile Key Elements Table.     |
|                      | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)        | Timing schedule (e.g., every 8 hours). [MedicationAdministration.request](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.request) provides reference to the applicable [MedicationRequest ](StructureDefinition-us-quality-core-medicationrequest.html)for this information. Generally, retrieval of medication administration events applies to the hospital setting with a few exceptions. Linkage to the original authorizing prescription has not been considered relevant for the existing measure use cases requiring only to retrieve information about one or more administration events. |
| reason               | [MedicationAdministration.reasonCode](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.reasonCode)               | Reason administration performed, e.g., none, given as ordered, emergency. Preferred binding to [ReasonMedicationGivenCodes](http://hl7.org/fhir/R4/valueset-reason-medication-given-codes.html).|
| relevant dateTime    | [MedicationAdministration.effective\[x\] dateTime](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.effective[x])|   Start and end time of administration – dateTime if given at a single point in time.  |
| relevant Period      | [MedicationAdministration.effective\[x\] Period](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.effective[x])  |  Start and end time of administration – period if given at over a time interval (e.g., an infusion).   |
| author dateTime      | [MedicationAdministration.extension:recorded](StructureDefinition-us-quality-core-medicationadministrationnotdone-definitions.html#MedicationAdministration.extension:recorded)        |   Recorded time is used exclusively for the QDM negation rationale concept.      |
| Negation Rationale   | See Below |
| Performer            | [MedicationAdministration.performer.actor](StructureDefinition-us-quality-core-medicationadministration-definitions.html#MedicationAdministration.performer.actor)     |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.     |
{: .grid}



##### Negation Rationale for Medication, Administered

Use [US Quality Core MedicationAdministrationNotDone](StructureDefinition-us-quality-core-medicationadministrationnotdone.html), which contains:

* [MedicationAdministration.status](StructureDefinition-us-quality-core-medicationadministrationnotdone-definitions.html#MedicationAdministration.status) - With a value of "not-done" (as implied by the fixed value in the profile)
* [MedicationAdministration.statusReason](StructureDefinition-us-quality-core-medicationadministrationnotdone-definitions.html#MedicationAdministration.statusReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [MedicationAdministration.extension:recorded](StructureDefinition-us-quality-core-medicationadministrationnotdone-definitions.html#MedicationAdministration.extension:recorded) - dateTime when this was made available
* [MedicationAdministration.medication\[x\].extension:notDoneValueSet](StructureDefinition-us-quality-core-medicationadministrationnotdone-definitions.html#MedicationAdministration.medication[x].extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific MedicationAdministration that was not performed

#### Medication, Discharge

This QDM context specifically references the discharge medication list
provided to a patient at the time of discharge from an inpatient
setting. The list may include reference to new prescriptions sent to a
pharmacy for dispensing and self-administration after discharge. It may
also include over-the-counter medications and those medications already
present in the patient’s home for which new prescriptions are not
necessary. The QDM Medication, Discharge concept is mapped to
MedicationRequest as a request to the patient to take the medication
with MedicationRequest.intent = *plan* and MedicationRequest.setting =
*discharge.*

MedicationRequest.intent should always be *order* even if the medication is
patient reported and the order is not processed as an e-prescription.
The reporter is specified as MedicationRequest.reported[x] which is a
reportedBoolean and uses reportedReference (patient, practitioner,
practitionerRole, relatedPerson, organization).

This change should also be used to reference the mapping from QDM Medication,
Order which can address order or recommended.



| **QDM Context**              | **US Quality Core v0.5.0**       | **Comments**          |
| ---------------------------- | ----------------------------------------------------------------- | ---------------------------------------------------------------- |
| **Medication, Discharge**    | [MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)    |             |
| Medication, Discharge active | [MedicationRequest.status](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.status)  | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Medication, Order”. Constrain to active, completed  |
|                              | [MedicationRequest.intent](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.intent)     | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**   |                      |                           |
| code                 | [MedicationRequest.medication\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.medication[x])   | Medication to be taken an extensible binding to [MedicationClinicalDrug (RxNorm)](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion)  |
| id                   | [MedicationRequest.id](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.id)    |             |
| dosage               | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Amount of medication to be administered. Range, quantity |
| supply               | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity)  | Amount to be dispensed in one fill  |
| daysSupplied         | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Number of days supply per dispense  |
| frequency            | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)  | When medication should be administered. Timing schedule (e.g., every 8 hours)  |
| refills              | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) | Number of refills allowed. Integer |
| route                | [MedicationRequest.dosageInstruction.route](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route)  |  How drug should enter body |
| setting              | [MedicationRequest.category](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.category)  | Type of medication usage using [Medication Category Codes](http://hl7.org/fhir/R4/valueset-medicationrequest-category.html) For MedicationDischarge, constrain category to “Community”.   |
| reason               | [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.reasonCode)  | The reason for ordering or not ordering the medication. This element has not been used to-date in quality measures; it is not included in the US Quality Core profile Key Elements Table.      |
| relevantDatetime     | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime  |   Timing – when the medication should be administered; Event – when the event occurs.   |
| relevantPeriod       | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period   |  Length/Range of lengths or (Start and/or End) limits  |
| authorDatetime       | [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.authoredOn)  |  When request was originally authored  |
| negationRationale    | See Below |
| prescriber           | [MedicationRequest.requester](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.requester) |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.  |
{: .grid}


##### Negation Rationale for Medication, Discharge

Use [US Quality Core MedicationNotRequested](StructureDefinition-us-quality-core-medicationnotrequested.html), which contains:
* [MedicationRequest.doNotPerform](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [MedicationRequest.status](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.status) - With a value of "completed"
* [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - dateTime when this was made available
* [MedicationRequest.medication\[x\].extension:notDoneValueSet](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.medication[x].extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific MedicationRequest that was not performed

#### Medication, Dispensed

This QDM context maps to the US Quality Core MedicationDispense profile,
indicating information about medications that have been dispensed.


| **QDM Context**           | **US Quality Core v0.5.0**             | **Comments**                         |
| ------------------------- | ------------------------------------------------ | --------------------------------------------------------------------------- |
| **Medication, Dispensed** | [MedicationDispense](StructureDefinition-us-quality-core-medicationdispense.html)       |        |
|                           | [MedicationDispense.status](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.status)  | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Medication, Dispensed”. Constrain MedicationDispense.status to completed |
| **QDM Attributes** |                         |                                     |
| code               | [MedicationDispense.medication\[x\]](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.medication[x])   |    What medication was supplied; extensible binding to [Medication Clinical Drug](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion)     |
| id                 | [MedicationDispense.id](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.id)      |             |
| dosage             | [MedicationDispense.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-us-quality-core-medicationdispense-definitions.html#key_MedicationDispense.dosageInstruction.doseAndRate.dose[x]) |    Amount of medication per dose    |
| supply             | [MedicationDispense.quantity](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.quantity)      |   Amount dispensed    |
| daysSupplied       | [MedicationDispense.daysSupply](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.daysSupply)  |   Amount of medication expressed as a timing amount.  |
| frequency          | [MedicationDispense.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.timing) |  When medication should be administered   |
| refills            | [MedicationDispense.authorizingPrescription](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)   | Medication order that authorizes the dispense. Reference authorizing prescription ([MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)) which contains [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) (number of refills authorized) |
| route              | [MedicationDispense.dosageInstruction.route](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.dosageInstruction.route)  | How drug should enter body. Most quality measures indicate the route by choosing RxNorm concepts specific to the routes acceptable to meet measure intent. Therefore, this element has not been used in measures with the “Medication, Dispense” QDM datatype and the element is not present in the MedicationDispense profile Key Elements Table.  |
| setting            | [MedicationDispense.category](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.category)    | Type of medication usage, with required binding to value set [MedicationRequest Category Codes](http://hl7.org/fhir/R4/valueset-medicationrequest-category.html).  Inpatient, Outpatient, Community, Discharge  |
| reason             | [MedicationDispense.statusReason\[x\]](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.statusReason[x])   | Reason for the current status.  |
| relatedTo          | [MedicationDispense.authorizingPrescription](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)  | Medication order that authorizes the dispense. Reference authorizing prescription ([MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)).  |
| relevant dateTime  | [MedicationDispense.whenHandedOver](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.whenHandedOver)    | When provided to patient or representative. Recommendations from pharmacy experts suggest that all medication dispensing events include a time for MedicationDispense.whenPrepared (i.e., when the dispensed product was packaged and reviewed. The time the medication was handed over to the patient or representative may not be populated.) Note that medications not picked up are restocked such that a MedicationDispense.status = completed will assure the patient or representative received the medication even if whenHandedOver is not available. Therefore, measure developers should consider including the time whenPrepared if whenHandedOver is null and status = completed.                                |
| relevant Period    | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period     |   The anticipated time from starting to stopping an ordered or dispensed medication can also be computed in an expression and derived from the duration attribute   |
| author dateTime    | [MedicationDispense.extension:recorded](StructureDefinition-us-quality-core-medicationdispensedeclined-definitions.html#MedicationDispense.extension:recorded)  | Used only for QDM negation rationale concept, to indicate the time for documentation of reason not dispensed   |
| Negation Rationale | See Below |
| Prescriber         | [MedicationDispense.authorizingPrescription](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.authorizingPrescription)  | Reference authorizing prescription (MedicationRequest) which contains [MedicationRequest.requester](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.requester)    |
| dispenser          | [MedicationDispense.performer.actor](StructureDefinition-us-quality-core-medicationdispense-definitions.html#MedicationDispense.performer.actor)   |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}



##### Negation Rationale for Medication, Dispensed

Use [US Quality Core MedicationDispenseDeclined](StructureDefinition-us-quality-core-medicationdispensedeclined.html), which contains:
* [MedicationDispense.status](StructureDefinition-us-quality-core-medicationdispensedeclined-definitions.html#MedicationDispense.status) - With a value of "declined" (as implied by the fixed value in the profile)
* [MedicationDispense.statusReason\[x\]](StructureDefinition-us-quality-core-medicationdispensedeclined-definitions.html#MedicationDispense.statusReason[x]) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [MedicationDispense.extension:recorded](StructureDefinition-us-quality-core-medicationdispensedeclined-definitions.html#MedicationDispense.extension:recorded) - dateTime when this was made available
* [MedicationDispense.medication\[x\].extension:notDoneValueSet](StructureDefinition-us-quality-core-medicationdispensedeclined-definitions.html#MedicationDispense.medication[x].extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific MedicationDispense that was not performed

The MedicationDispensed.status is fixed to "declined" which is defined as "The dispense was declined and not performed." Considering the clinical workflow, only the pharmacist likely performs the "decline" status - based on medication interaction or on failure of insurance authorization (e.g., medication interaction, denial of insurance authorization, treatment abandonment due to co-pay cost). But the patient would not enter the status, only the pharmacist would do so. The use case likely still works for the measure developer intent (that a valid reason exists for not dispensing the medication). However, if the measure developer wants to address patient's decisions to avoid dispensing, the patient will likely not show up at the pharmacy for the medication to be dispensed - hence, there will be no dispensing event. The best way to capture that scenario may be to assure the MedicationRequest includes a Patient reason.

#### Medication, Order

This QDM context references the US Quality Core MedicationRequest profile with
MedicationRequest.intent = *order* and MedicationRequest.setting
as the most appropriate for the intended meaning of the quality
measure or clinical decision support (CDS) expression.


| **QDM Context**          | **US Quality Core v0.5.0**    | **Comments**      |
| ------------------------ | -------------------------------------------------------------------------- | --------------------------------------------------------- |
| **Medication, Order**    | [MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)    |    |
| Medication, Order active | [MedicationRequest.status](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.status) | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Medication, Order”. Constrain to active, completed   |
|                          | [MedicationRequest.intent](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.intent) | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
|                          | [MedicationRequest.reported[x]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.reported[x])  | When recording “self-prescribed” medications **SHALL** use reported[x] to indicate the MedicationRequest record was captured as a secondary “reported” record rather than an original primary source-of-truth record    |
| **QDM Attributes**   |                   |                  |
| code                 | [MedicationRequest.medication\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.medication[x]) | Medication to be taken an extensible binding to [MedicationClinicalDrug (RxNorm)](https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1010.4/expansion) |
| id                   | [MedicationRequest.id](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.id)  |               |
| dosage               | [MedicationRequest.dosageInstruction.doseAndRate.dose\[x\]](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.doseAndRate.dose[x]) | Amount of medication to be administered. Range, quantity    |
| supply               | [MedicationRequest.dispenseRequest.quantity](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.quantity) | Amount to be dispensed in one fill  |
| daysSupplied         | [MedicationRequest.dispenseRequest.expectedSupplyDuration](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.expectedSupplyDuration) | Number of days supply per dispense |
| frequency            | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing)  | When medication should be administered. Timing schedule (e.g., every 8 hours)    |
| refills              | [MedicationRequest.dispenseRequest.numberOfRepeatsAllowed](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dispenseRequest.numberOfRepeatsAllowed) |  Number of refills allowed. Integer |
| route                | [MedicationRequest.dosageInstruction.route](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.route) | How drug should enter body |
| setting              | [MedicationRequest.category](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.category) | Type of medication usage using [Medication Category Codes](http://hl7.org/fhir/R4/valueset-medicationrequest-category.html) |
| reason               | [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.reasonCode) | The reason for ordering or not ordering the medication. This element has not been used to-date in quality measures; it is not included in the US Quality Core profile Key Elements Table. |
| relatedTo            | [MedicationRequest.basedOn](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.basedOn) | What request fulfills. There has not yet been a use case requiring this element. Therefore, it is not included in the US Quality Core profile Key Elements Table.    |
| relevantDatetime     | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.event](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.event) dateTime  |  Timing – when the medication should be administered; Event – when the event occurs.   |
| relevantPeriod       | [MedicationRequest.dosageInstruction.timing](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.dosageInstruction.timing) <br> with <br> [Timing.repeat.bounds\[x\]](http://hl7.org/fhir/R4/datatypes-definitions.html#Timing.repeat.bounds_x_) Period     | Length/Range of lengths or (Start and/or End) limits    |
| authorDatetime       | [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.authoredOn)   |   When request was originally authored   |
| negationRationale    | See Below |
| prescriber           | [MedicationRequest.requester](StructureDefinition-us-quality-core-medicationrequest-definitions.html#MedicationRequest.requester)   | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}


##### Negation Rationale for Medication, Order

Use [US Quality Core MedicationNotRequested](StructureDefinition-us-quality-core-medicationnotrequested.html), which contains:

* [MedicationRequest.doNotPerform](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [MedicationRequest.status](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.status) - With a value of "completed"
* [MedicationRequest.reasonCode](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.reasonCode) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [MedicationRequest.authoredOn](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.authoredOn) - dateTime when this was made available
* [MedicationRequest.medication\[x\].extension:notDoneValueSet](StructureDefinition-us-quality-core-medicationnotrequested-definitions.html#MedicationRequest.medication[x].extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific MedicationRequest that was not performed



### Participation

QDM defines Participation as a patient’s coverage by a program such as
an insurance or medical plan or a payment agreement. Such programs can
include patient-centered medical home, disease-specific programs, etc.
Definitions modeled similar to the FHIR R4
[Coverage](http://hl7.org/fhir/R4/coverage.html) resource.


| **QDM Context**         | **US Quality Core v0.5.0**    | **Comments**          |
| ----------------------- | ---------------------------------------------------------- | --------------------- |
| **Participation**       | [Coverage](StructureDefinition-us-quality-core-coverage.html)                                        |                             |
|                         | [Coverage.status](StructureDefinition-us-quality-core-coverage-definitions.html#key_Coverage.status) | While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name ”Participation”. Constrain to “active” |
| **QDM Attributes**      |                                                                                             |                             |
| code                    | [Coverage.type](StructureDefinition-us-quality-core-coverage-definitions.html#key_Coverage.type)     | Coverage category such as medical or accident. Required binding to https://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.114222.4.11.3591   |
| id                      | [Coverage.id](StructureDefinition-us-quality-core-coverage-definitions.html#Coverage.id)         |                              |
| participationPeriod     | [Coverage.period](StructureDefinition-us-quality-core-coverage-definitions.html#key_Coverage.period) | Coverage start and end dates |
{: .grid}



### Physical Exam

QDM defines Physical Exam as the evaluation of the patient’s body and/or
mental status exam to determine its state of health. The techniques of
examination can include palpation (feeling with the hands or fingers),
percussion (tapping with the fingers), auscultation (listening), visual
inspection or observation, inquisition and smell. Measurements may
include vital signs (blood pressure, pulse, respiration) as well as
other clinical measures (such as expiratory flow rate and size of lesion).
Physical exam includes psychiatric examinations.

US Core STU6 added twelve observation profiles that address specific elements of physical examinations. The following table lists each profile and the respective data element codes referenced in each of those profiles.


| **Profile**         | **Data element codes**                                                                                                                       |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| [US Core Vital Signs Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-vital-signs.html)    | Vital Signs (panel) – **Fixed Value:** 85353-1                                    |
|  [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html)                       | Head Occipital-Frontal Circumference Percentile - **Fixed Value:** 8289-1 |
| [US Core Blood Pressure Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html)      |   •Blood Pressure Systolic and Diastolic – **Fixed Value:** 85354-9<br>•Systolic Blood Pressure – **Fixed Value:** 8480-6<br>•Diastolic Blood Pressure – **Fixed Value:** 8462-4<br>•valueQuantity - **Fixed Value:** mm[Hg]<br> |
|[US Core BMI Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html) |•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br> •ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set - **Fixed Value:** kg/m2<br>|
|[US Core Body Height Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html)  |•Body Height – **Fixed Value:** 8302-2<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - - Coded responses from the common UCUM units for vital signs value set - **Binding:** [BodyLengthUnits](http://hl7.org/fhir/R4/valueset-ucum-bodylength.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
| [US Core Body Temperature Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html) | •Body Temperature – **Fixed Value:** 8310-5<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - - Coded responses from the common UCUM units for vital signs value set –  **Binding:** [BodyTemperatureUnits](http://hl7.org/fhir/R4/valueset-ucum-bodytemp.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
| [US Core Body Weight Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html)     | •Body Weight – **Fixed Value:** 29463-7<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code – Coded responses from the common UCUM units for vital signs value set – **Binding:** [BodyWeightUnits](http://hl7.org/fhir/R4/valueset-ucum-bodyweight.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
|[US Core Head Circumference Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html)| •Head Circumference – **Fixed Value:** 9843-4<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set - **Binding:** [BodyLengthUnits](http://hl7.org/fhir/R4/valueset-ucum-bodylength.html) ([required](http://hl7.org/fhir/R4/terminologies.html#required))|
|[US Core Heart Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html)| •Vital Signs – Heart Rate – **Fixed Value:**  8867-4<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - **Fixed Value:** /min|
|[US Core Pediatric BMI for Age Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html)| •Pediatric BMI for Age – **Fixed Value:** 59576-9<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org |
|[US Core Pediatric Weight for Height Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html)| •Pediatric Weight for Height – **Fixed Value:** 77606-2<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set. **Fixed Value:** %|
|[US Core Pulse Oximetry Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html)| •Pulse Oximetry – **Fixed Value:** 59408-5<br>•O2 Saturation - **Fixed Value:** 2708-6<br>•Flow rate **Fixed Value:** 2708-6<br>•Flow rate Value quantity **Fixed Value:** L/min<br>•Concentration **Fixed Value:** 3150-0<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code – **Fixed Value:** % |
|[US Core Respiratory Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html)| •Vital Signs – Respiratory Rate – **Fixed Value:** 9279-1<br>•ValueQuantity.system - **Fixed Value:** http://unitsofmeasure.org<br>•ValueQuantity.code - Coded responses from the common UCUM units for vital signs value set - **Fixed Value:** /min|
{: .grid}


#### Physical Exam, Order

QDM “Physical Exam, Order” should use ServiceRequest with *intent* = order for the specific examination requested.


| **QDM Context**   | **US Quality Core v0.5.0**        | **Comments**            |
| -------------------- | -------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Physical Exam, Order**   | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)         |          |
|                            | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)   | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Physical Exam, Order” and “Physical Exam, Recommended” datatypes.  |
|                            | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)   | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order)  |
| **QDM Attributes**      |                           |                                                              |
| code                    | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)     |    What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)  |
| id                      | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)                  |            |
| reason                  | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)  | Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime          | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)  | When the request transitioned to being actionable. |
| anatomicalLocationSite  | N/A    |  No comparable element in the ServiceRequest resource. This element has not been used in measures to-date as the requested procedure / action code can reference the respective anatomical site. |
| negationRationale       | See Below |
| requester               | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Physical Exam, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed


#### Physical Exam, Performed

QDM “Physical Exam, Performed” should reference the specific US Core vital signs profiles directly as appropriate. Some results may also be identified using the US Quality Core Observation Clinical Result profile. The US Quality Core Simple Observation profile may be appropriate for other physical examination observations not covered by the Observation Clinical Result profile.

| **QDM Context**   | **US Quality Core v0.5.0**    | **Comments**     |
| -------------------------------------- | ---------------------------------------- | ----------------------------------------------------------------------- |
| **Physical Exam, Performed - General** | [US Quality Core Simple Observation](StructureDefinition-us-quality-core-simple-observation.html) <br> [US Quality Core Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html)  |        |
|                                        | [Observation.status](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.status)   | Constrain status to -  final, amended, corrected. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Physical Exam, Performed” datatype. |
|                                        | [Observation.category](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.category) | Category helps to narrow the request to the class of observation required to meet measure intent. Each US Quality Core or US Core profile has a specific binding to concepts appropriate to the respective profile. Note that QDM does not have an attribute comparable to category, the element may be helpful in expressing a quality measure. |
| **QDM Attributes**     |                        |                     |
| code                   | [Observation.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.code)  |   Note specific bindings based on the US Quality Core or US Core profile used. |
| id                     | [Observation.id](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.id)              |                       |
| anatomicalLocationSite | [Observation.bodySite](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.bodySite)  |                       |
| relatedTo              | [Observation.basedOn](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.basedOn)    | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.   |
| negationRationale      | See Below |
| reason                 | [Observation.basedOn](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.basedOn)    | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Therefore, it is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.  |
| result                  | [Observation.value\[x\]](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.value[x])   |                         |
|                         | [Observation.interpretation](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.interpretation)  |    Explanation of significance of the observation result (e.g., critical, high, low)  |
| relevantDatetime        | [Observation.effective\[x\] dateTime](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])   |   Time observation occurred if a point in time.   |
| relevantPeriod          | [Observation.effective\[x\] Period](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])     |   Time observation occurred if it occurs over a period of time.     |
| authorDatetime          | [Observation.issued](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.issued) |  Time observation result made available   |
| component               | [Observation.component](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.component)    |      Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. Many measures address components of a panel of simple observations as single elements. Therefore, component is not in the profile Key Elements Table; it can be found in the Snapshot Table tab of the respective profiles.  |
| component.code          | [Observation.component.code](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.component.code)    | See comment about component |
| component.result        | [Observation.component.value\[x\]](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.component.value[x])  | See comment about component  |
| performer               | [Observation.performer](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.performer)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.  |
{: .grid}

##### Negation Rationale for Physical Exam, Performed

Use [US Quality Core Observation Cancelled](StructureDefinition-us-quality-core-observationcancelled.html) and reference the code element specified in the respective observation profile:

* [Observation.status](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.status) - With a value of "cancelled" (as implied by the fixed value in the profile)
* [Observation.extension:notDoneReason](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.extension:notDoneReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Observation.issued](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.issued) - When this was made available
* [Observation.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-observationcancelled-definitions.html#Observation.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Observation that was not performed


#### Physical Exam, Recommended

QDM “Physical Exam, Recommended” should use ServiceRequest with *intent* = plan for the specific examination recommended.

| **QDM Context**                | **US Quality Core v0.5.0**            | **Comments**                                                 |
| ------------------------------ | ----------------------------------------------------------------- | ------------------------------------------------------------ |
| **Physical Exam, Recommended** | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)  |             |
|                                | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, _status_ is implied by the name “Physical Exam” and “Physical Exam, Recommended” datatypes.  |
|                                | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan”   |
| **QDM Attributes**     |                         |                 |
| code                   | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code) |  What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)  |
| id                     | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)     |             |
| reason                 | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)   |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime         | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)   | When the request transitioned to being actionable.  |
| anatomicalLocationSite | N/A   |  No comparable element in the ServiceRequest resource. This element has not been used in measures to-date as the requested procedure / action code can reference the respective anatomical site.  |
| negationRationale      | See Below |
| requester              | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)     |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Physical Exam, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed



### Procedure

QDM defines Procedure as an act whose immediate and primary outcome
(post-condition) is the alteration of the physical condition of the subject. A
*procedure* may be a surgery or other type of physical manipulation of a
person’s body in whole or in part for purposes of making observations and
diagnoses or providing treatment.

#### Procedure Vs Intervention

FHIR references both of these concepts using the Procedure resource, specifically
noting a process that involves verification of the patient’s comprehension or
to change the patient’s mental state would be a Procedure.

#### Procedure Vs Task

Some use cases have considered differentiating a FHIR Procedure Resource
from a FHIR core Task Resource. For example, should a request to perform
medication reconciliation be classified as a Task or a Procedure? The
FHIR [Procedure Resource](http://hl7.org/fhir/procedure.html) Boundaries
and Relationships (Section 9.3.2) provides some distinction between a
[Task](http://hl7.org/fhir/task.html) and a
[Procedure](http://hl7.org/fhir/procedure.html):

*A [Task](http://hl7.org/fhir/task.html) is
a workflow step such as cancelling an order, fulfilling an order,
signing an order, merging a set of records, admitting a patient.
Procedures are actions that are intended to result in a physical or
mental change to or for the subject (e.g. surgery, physiotherapy,
training, counseling).
A [Task](http://hl7.org/fhir/task.html) resource
often exists in parallel with clinical resources. For example,
a [Task](http://hl7.org/fhir/task.html) might
request fulfillment of
a [ServiceRequest](http://hl7.org/fhir/servicerequest.html) ordering
a Procedure.*

Based on the guidance provided above, the workflow step to reconcile
medication lists may be considered a Task to perform the Procedure that
includes reviewing the medication list with the patient to assure it is
correct and to education the patient about proper medication usage.


The sponsoring work group is specifically seeking feedback on the following
suggestions for use of Task rather than Procedure for workflow steps that require
attestation such as medication list review or reconciliation:
Example: A workflow step to review or to reconcile medication lists may be considered
a Task to perform the Procedure that includes reviewing the medication list with the
patient to assure it is correct and to educate the patient about proper medication usage.
Thus, a Task can reference the Task.focus as a procedure.

QDM 5.6 does not address Task; therefore, there is no direct mapping
from QDM Intervention or Procedure to the FHIR Task resource. The
mapping presented is from QDM to US Quality Core referencing the FHIR Procedure
resource.

Consistent with the method for specifying QDM’s concept negation rationale, a [TaskRejected](StructureDefinition-us-quality-core-taskrejected.html) is represented with the following content:
* [Task.status](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.status) with valueset-task-status constrained to "rejected" (The potential performer who claimed ownership of the task has decided not to execute it prior to performing any action.)
* [Task.statusReason](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.statusReason) binding to Negation Reason Codes (extensible)
* [Task.code](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.code) (Codes to identify how the task manages fulfillment of activities - the specific choice depends on the measure context) the direct reference code, it needs a cardinality of 1..1 and binding to the code or value set (it would need a notDoneValueSet url: [notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to reference the value set not performed)
* [Task.focus](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.focus) to reference the Resource (likely procedure) the task was acting on
* [Task.encounter](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.encounter) (Healthcare event during which this task originated)
* [Task.for](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.for) (Beneficiary of the Task) Reference (us-quality-core-patient)
* [Task.executionPeriod](StructureDefinition-us-quality-core-taskrejected-definitions.html#Task.executionPeriod) for the period/dateTime - the timing the task was rejected and the reason.

#### Procedure Priority

Procedure: *priority* has the following definition:

*Priority indicates the urgency of the procedure or the encounter
referenced. In \[electronic clinical quality measures\] (eCQMs) the
priority attribute will help specify elective from urgent encounters
(e.g., hospital admissions) or procedures. Priority is a codeable concept
(i.e., may use a direct reference code or a value set). For example,
priority is used to express an elective procedure or encounter from an
emergency procedure or encounter.*


As noted in the QDM to US Quality Core Mapping for Encounter-Related Diagnoses
and Procedures, a specific measure may have interest in evaluating care
provided for elective procedures (e.g., hip surgery due to
osteoarthritis) while excluding emergency, non-planned procedures (e.g.,
hip surgery due to acute fracture). The procedure code does not
necessarily allow differentiation of the two concepts. A
[ServiceRequest.priority](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.priority) does have the ability to differentiate the
urgency with which the *request* (or order) should be fulfilled.
However, there is no current usage in existing measures and the ServiceRequest.priority
element is not included in the ServiceRequest Key Element Table. There is no
element within the FHIR Procedure resource to address the issue. Based on lack
of a current use case US Quality Core has not added an extension to address Procedure.priority
and, as a result, there is no direct mapping from the QDM Procedure priority attribute to US Quality Core.

#### Procedure, Performed


| **QDM Context**         | **US Quality Core v0.5.0**                                            | **Comments**                   |
| ----------------------- | ----------------------------------------------------------- | ------------------------------ |
| **Procedure, Performed**| [Procedure](StructureDefinition-us-quality-core-procedure.html)                                   |                                  |
| **QDM Attributes**  |                                                                                              |                                  |
| status              | [Procedure.status](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.status)   | While QDM does not have an attribute comparable to status, as a conceptual model, _status_ is implied by the QDM datatype name “Procedure, Performed”. Constrain to “completed”  |
| code                | [Procedure.code](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.code)       |  Identification of the procedure. Extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html)  |
| id                  | [Procedure.id](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.id)           |                                  |
| relatedTo           | [Procedure.basedOn](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.basedOn) | A reference to a resource that contains details of the request for this procedure. There has not been a use case for this element in existing measures; therefore, it is not included in the US Quality Core profile Key Elements Table. |
| method              | N/A           | Procedure.method does not exist in FHIR. Rather than create an extension, US Quality Core’s approach is to assume the Procedure.code includes reference to the method, therefore, this element does not exist in the US Quality Core profile   |
| rank                | [Claim.procedure.sequence](StructureDefinition-us-quality-core-claim-definitions.html#Claim.procedure.sequence)) | Used to identify a principal procedure in the context of an encounter. See discussion in the QDM “Encounter, Performed” section indicating the rationale for using the Claim profile to identify principal or primary procedures and conditions. |
| priority            | N/A           |   This QDM attribute is intended to reference elective from non-elective procedures. See discussion regarding “Encounter, Order” priority which was created to differentiate elective encounters from non-elective encounters. Similar to the encounter discussion, a given procedure is not inherently elective or non-elective, the urgency is based on a patient’s status and other factors. Information about urgency, elective, non-elective may be found a scheduling or appointment application which may generate a tag for a procedure in the clinical record. This item is not present in the FHIR Procedure resource. Measure developers should work with clinical sites to determine the most effective method for identifying procedure priority.  |
| anatomicalLocationSite  | [Procedure.bodySite](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.bodySite)  |    Target body sites with preferred binding to [SNOMEDCT Body Structures](http://hl7.org/fhir/R4/valueset-body-site.html). Existing measures have not provided a use case for this element. Therefore, the element does not appear in the US Quality Core profile Key Elements Table.    |
| reason                  | [Procedure.reasonCode](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.reasonCode)   |  Code reason procedure is performed. Preferred binding to [Procedure Reason Codes](http://hl7.org/fhir/R4/valueset-procedure-reason.html) |
| result                  | [Simple Observation](StructureDefinition-us-quality-core-simple-observation.html) or [Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html) that includes the element [SimpleObservation.partOf](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.partOf) to reference the procedure to which it applies.  |  [Procedure.report](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.report) references [DiagnosticReport-note](StructureDefinition-us-quality-core-diagnosticreport-note.html), DocumentReference, Composition (histology result, pathology report, surgical report, etc.); the latter two are not US Quality Core resources. However, based on feedback suggested that a procedure result might be better identified as  [Simple Observation](StructureDefinition-us-quality-core-simple-observation.html) or [Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html) resources referencing the [SimpleObservation.partOf](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.partOf) or [ObservationClinicalResult.partOf](StructureDefinition-us-quality-core-observation-clinical-result-definitions.html#Observation.partOf) element to reference the procedure to which it applies.  |
| Negation Rationale      | See Below |
| Relevant dateTime       | [Procedure.performed\[x\] dateTime](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.performed[x]) | When the procedure was performed (as a single point in time).  |
| Relevant Period         | [Procedure.performed\[x\] Period](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.performed[x])   | When the procedure was performed (over a period of time).  |
| Incision dateTime       | [Procedure.extension:incisionDateTime](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.extension) | The first incision time. Existing measures do not use this element; therefore, it is not included in the US Quality Core profile Key Elements Table.  |
| Author dateTime         | [Procedure.extension:recorded](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.extension:recorded)   | When the procedure was first captured in the subject’s record. This element is useful for historical procedures and for the QDM negation rationale concept.  |
|                         | [Procedure.usedReference](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.usedReference) <br> [Procedure.usedCode](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.usedCode)| These elements help to add reference to a device, medication, or substance used as part of a procedure the US Quality Core element to address the device is used by the procedure. However, feedback has suggested that implementers prefer a direct, precoordinated code for the procedure that also indicates the type of device used rather than having to connect a specific item/device used to perform the procedure. Thus, while modeling allows usedCode or usedReference, feasibility is very limited. For that reason, these elements are not included in the US Quality Core profile Key Elements Table.  |
| Components              | N/A                            | Procedure does not include component.  |
| Component code          | N/A                            | N/A                                                                                                       |
| Component result        | N/A                            | N/A                                                                                                       |
| Performer               | [Procedure.performer.actor](StructureDefinition-us-quality-core-procedure-definitions.html#Procedure.performer.actor)      | Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM requester attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Procedure, Performed

Use [US Quality Core ProcedureNotDone](StructureDefinition-us-quality-core-procedurenotdone.html), which contains:
* [Procedure.status](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.status) - With a value of "not-done" (as implied by the fixed value in the profile)
* [Procedure.statusReason](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.statusReason) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [Procedure.extension:recorded](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.extension:recorded) - dateTime when this was made available
* [Procedure.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-procedurenotdone-definitions.html#Procedure.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific Procedure that was not performed

#### Procedure, Order

| **QDM Context**      | **US Quality Core v0.5.0**    | **Comments**          |
| -------------------- | ------------------------------------------------------------------------ | ------------------------------------------------------------ |
| **Procedure, Order** | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)        |                                                              |
|                      | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, _status_ is implied by the name “Procedure, Order” and “Procedure, Recommended” datatypes.   |
|                      | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate an order from a recommendation. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “order” (include children: original-order, reflex-order, filler-order, instance-order) |
| **QDM Attributes**  |                                                       |                                                              |
| code                | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)  |   What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html) |
| id                  | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)    |                       |
| reason              | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode) |  Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)  |
| authorDatetime      | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn) | When the request transitioned to being actionable.   |
| negationRationale   | See Below |
| requester           | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)    |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.    |
{: .grid}

##### Negation Rationale for Procedure, Order

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed

#### Procedure, Recommended

| **QDM Context**            | **US Quality Core v0.5.0**          | **Comments**                                                 |
| -------------------------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| **Procedure, Recommended** | [ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)   |                                                              |
|                            | [ServiceRequest.status](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.status)  | Constrain to active, completed. While QDM does not have an attribute comparable to status, as a conceptual model, _status_ is implied by the name “Procedure, Order” and “Procedure, Recommended” datatypes. |
|                            | [ServiceRequest.intent](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.intent)  | Required to differentiate a recommendation from an order. The intent value set allows such differentiation using “order” for orders and “plan” for recommendation. Constrain only to “plan    |
| **QDM Attributes** |                                       |                                                              |
| code               | [ServiceRequest.code](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.code)   |  What is requested, extensible binding to [US Core Procedure Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-procedure-code.html) |
| id                 | [ServiceRequest.id](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.id)   |                              |
| reason             | [ServiceRequest.reasonCode](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.reasonCode)  |    Explanation/justification for procedure or service with extensible binding to [US Core Condition Codes]({{site.data.fhir.ver.uscore}}/ValueSet-us-core-condition-code.html)   |
| authorDateTime     | [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.authoredOn)   |   When the request transitioned to being actionable.  |
| negationRationale  | See Below |
| requester          | [ServiceRequest.requester](StructureDefinition-us-quality-core-servicerequest-definitions.html#ServiceRequest.requester)  |  Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _requester_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that requested the procedure or service. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.   |
{: .grid}

##### Negation Rationale for Procedure, Recommended

Use [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html) and reference the code element specified in the respective observation profile:

* [ServiceRequest.doNotPerform](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.doNotPerform) - With a value of "true" (as implied by the fixed value in the profile)
* [ServiceRequest.status](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.status) - With a value of "completed"
* [ServiceRequest.extension:reasonRefused](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.extension:reasonRefused) - Use value set [NegationReasonCodes](ValueSet-us-quality-core-negation-reason.html)
* [ServiceRequest.authoredOn](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.authoredOn) - dateTime when this was made available
* [ServiceRequest.code.extension:notDoneValueSet](StructureDefinition-us-quality-core-servicenotrequested-definitions.html#ServiceRequest.code.extension:notDoneValueSet) - Use [us-quality-core-notDoneValueSet](StructureDefinition-us-quality-core-notDoneValueSet.html) to indicate the specific ServiceRequest that was not performed



### Substance

#### Substance, Administered; Substance, Order; Substance Recommended

QDM defines Substance as a homogeneous material with a definite
composition that includes allergens, biological materials, chemicals,
foods, drugs and materials. QDM distinguishes between medications from
non-medication substances by separately listing medication datatypes.
Substance may or may not have a code or be classified by a code system
such as RxNorm. Examples of a substance may include environmental agents
(e.g., pollen, dust) and food (e.g., vitamins). Where a measure can use
medication terminology (e.g., egg albumin) to represent QDM concept Substance,
measure developers should consider expressing intent using the Substance mappings listed in this QDM-to-US Quality Core section.

Ideally, use of a substance-related resource should be driven by use
cases and examples. Two such use cases currently exist in the quality
measure community:

* Identifying blood products (a biological product in FHIR
resources) ordered or administered within specific time
relationships to other data elements – The FHIR Resource,
[BiologicallyDerivedProduct](http://hl7.org/fhir/biologicallyderivedproduct.html),
possibly using Procedure and ServiceRequest might have promise.
However, the resource is still in development. Therefore, until
further information is available, rather than expressing the QDM
*datatype* Substance, Administration to address administration of
blood transfusion, quality measure and clinical decision support
(CDS) authors should consider using the procedure resource with a
code representing transfusion.
*  Determining exclusive newborn feeding with human breast milk
during the initial stay in the hospital after birth
– Currently, FHIR R4 includes a
[NutritionOrder](http://hl7.org/fhir/nutritionorder.html) resource
to reference a request for a specific diet, or supplements to a
diet. However, a resource for documenting administration of
nutrition-related substances is still in development.
The focus of the FHIR R5 resource NutritionIntake is interoperable messaging between
nutrition applications and the EHR (i.e., not EHR to EHR nutrition information sharing).  Therefore, for
this use case a quality measure or a clinical decision support (CDS)
author could reference a NutritionOrder for an exclusive breast milk
diet for the infant; however, such an expression could not reference
clinical intake and output records to determine if anything other
than human breast milk was administered to the infant.
Summarizing discussion among HL7 workgroups in late 2023, the US Quality Core resource best suited
to retrieve information about enteral intake is Observation (i.e., US Quality Core SimpleObservation).
The following guidance may help measure developers trying to express retrieval of enteral intake data using SimpleObservation:

    * SimpleObservation.code = with binding to a direct reference code or value set indicating observation of enteral intake
    * SimpleObservation.value with binding to a direct reference code or value set indicating the nutritional product of interest to the measure intent.



NOTE – There is no specific QDM datatype to address the  [Nutrition Order](StructureDefinition-us-quality-core-nutritionorder.html) US Quality Core STU 6 profile.
Since no current eCQM uses this profile, determination of key elements is challenging. The following table
may help measure developers determine what to use for potential use cases:


| **Nutrition Order**                                    | **US Quality Core v0.5.0**                 | **Comments**                                          |
| -------------------------------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------- |
| **Substance, Order/Recommended - For Diet Orders** | [NutritionOrder](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder)  | Limited to orders for diets or diets with supplements |
| Substance Order/Recommended Activity               | [NutritionOrder.status](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.status) | Determination of which order status is appropriate to retrieve, specifically  constrain to active, completed. Profile has required binding to [RequestStatus](http://hl7.org/fhir/R4/valueset-request-status.html).  |
| Substance, Order                                   | [NutritionOrder.intent](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.intent) | Enables differentiation of order versus plan. Required binding to [RequestIntent](http://hl7.org/fhir/R4/valueset-request-intent.html). Constrain to “order” and child concepts   |
| Substance, Recommended                             | [NutritionOrder.intent](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.intent) | Enables differentiation of order versus plan. Required binding to [RequestIntent](http://hl7.org/fhir/R4/valueset-request-intent.html). Constrain to “plan” |
| **QDM Attributes**   |                       |                                                       |
| ORAL DIET                         | [NutritionOrder.oralDiet](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.oralDiet) |  Oral Diet Components  |
| code (to represent a diet order)  | [NutritionOrder.oralDiet.type](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.oralDiet.type)  |   Type of oral diet or diet restrictions that describe what can be consumed orally   |
| ENTERAL FORMULA                   | [NutrientOrder.enteralFormula](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.enteralFormula)  |  Enteral Formula Components  |
| code (to represent a enteral formula) | [NutrientOrder.eternalFormula.baseFormulaType](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.enteralFormula.baseFormulaType)   |    Type of enteral or infant formula    |
| negationRationale           | N/A           |                                                       |
| authorDatetime              | [NutritionOrder.dateTime](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.dateTime)  | Date and time nutrition order was requested  |
| relevantPeriod              | [NutritionOrder.enteralFormula.administration.schedule](StructureDefinition-us-quality-core-nutritionorder-definitions.html#NutritionOrder.enteralFormula.administration.schedule)  |  Likely not relevant for measure use cases. Not present in US Quality Core Key Elements Table.   |
{: .grid}



### Symptom

QDM defines Symptom as an indication that a person has a condition or
disease. Some examples include headache, fever, fatigue, nausea,
vomiting, and pain. Symptoms are subjective manifestations of the
disease perceived by the patient. As an example to differentiate symptom
from finding, the patient’s subjective symptom of fever is distinguished
from the temperature (a finding). For a finding, there is either a
source of a temperature-measuring device together with a recorder
of the device (electronically) or an individual (healthcare provider,
patient, etc.).

Note: Definitions regarding symptom on the FHIR condition resource
Boundaries and Relationships (Section 9.2.2:
<http://hl7.org/fhir/condition.html>):

* \[The Condition\] resource is not typically used to record
information about subjective and objective information that might
lead to the recording of a Condition resource. Such signs and
symptoms are typically captured using
the [Observation](http://hl7.org/fhir/R4/observation.html) resource;
although in some cases a persistent symptom, e.g. fever, headache
may be captured as a condition before a definitive diagnosis can be
discerned by a clinician. By contrast, headache may be captured as
an Observation when it contributes to the establishment of a
meningitis Condition.

* Use the [Observation](http://hl7.org/fhir/R4/observation.html) resource
when a symptom is resolved without long term management, tracking,
or when a symptom contributes to the establishment of a condition.

* Use Condition when a symptom requires long term management,
tracking, or is used as a proxy for a diagnosis or problem that is
not yet determined.

Based on the FHIR referenced provided above, the QDM *datatype* Symptom
maps to the FHIR Observation resource.

| **QDM Context**    | **US Quality Core v0.5.0**         | **Comments**                                                                     |
| ------------------ | ---------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| **Symptom**        | [Simple Observation](StructureDefinition-us-quality-core-simple-observation.html)     |                  |
|                    | [Observation.status](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.status)  | Constrain status to - preliminary, final, amended, corrected. While QDM does not have an attribute comparable to status, as a conceptual model, status is implied by the name “Symptom” datatype.  |
|                    | [Observation.category](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.category)  | Category helps to narrow the request to the class of observation required to meet measure intent. Each US Quality Core or US Core profile has a specific binding to concepts appropriate to the respective profile. Note that QDM does not have an attribute comparable to category, the element may be helpful in expressing a quality measure.   |
| **QDM Attributes** |              |                                                                                  |
| code               | [Observation.value\[x\]](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.value[x])   | Note specific bindings based on the US Quality Core or US Core profile used.  |
| id                 | [Observation.id](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.id)     |                                               |
| severity           | [Observation.interpretation](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.interpretation) | Explanation of significance of the observation result (e.g., critical, high, low). |
| prevalencePeriod   | [Observation.effective\[x\]](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.effective[x])   | Time observation occurred if a point in time, or a period. Most likely Symptom will be recorded as a point in time.    |
| recorder           | [Observation.performer](StructureDefinition-us-quality-core-simple-observation-definitions.html#Observation.performer)    |   Although QDM includes this attribute it has not been used in existing measures and a clear use case has not been established. The original purpose for the QDM _performer_ attribute was to designate the individual/organization responsible for reporting the measure results is the same individual/organization that performed the observation or task. However, clinical software generally tracks the individual user entering data and linking that individual to a clinical role, a specialty, or an organization is not easily accomplished.     |
{: .grid}


