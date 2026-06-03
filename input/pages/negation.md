{:toc}

{: #USQualityCore-Negation}

###  US Quality Core Negation Profile Index

US Quality Core includes ten specific negation profiles, parallel to the existing action-related profile:

| **US Quality Core Positive Profile**                                                                                                                                                    | **US Quality Core Negation Profile**                                                                                                                                                                    | **Base Resource**                                                                |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [USQualityCore Communication](StructureDefinition-us-quality-core-communication.html)*                       | [USQualityCore Communication Not Done](StructureDefinition-us-quality-core-communicationnotdone.html)*                       | [Communication]({{site.data.fhir.path}}communication.html)                       |
| [USQualityCore DeviceRequest](StructureDefinition-us-quality-core-devicerequest.html)                       | [USQualityCore Device Not Requested](StructureDefinition-us-quality-core-devicenotrequested.html)                           | [DeviceRequest]({{site.data.fhir.path}}devicerequest.html)                       |
| [USQualityCore Immunization](StructureDefinition-us-quality-core-immunization.html)                         | [USQualityCore Immunization Not Done](StructureDefinition-us-quality-core-immunizationnotdone.html)                         | [Immunization]({{site.data.fhir.path}}immunization.html)                         |
| [USQualityCore MedicationAdministration](StructureDefinition-us-quality-core-medicationadministration.html) | [USQualityCore MedicationAdministration Not Done](StructureDefinition-us-quality-core-medicationadministrationnotdone.html) | [MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html) |
| [USQualityCore MedicationDispense](StructureDefinition-us-quality-core-medicationdispense.html)             | [USQualityCore MedicationDispense Declined](StructureDefinition-us-quality-core-medicationdispensedeclined.html)            | [MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)             |
| [USQualityCore MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)               | [USQualityCore Medication Not Requested](StructureDefinition-us-quality-core-medicationnotrequested.html)                   | [MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)               |
| [USQualityCore Simple Observation](StructureDefinition-us-quality-core-simple-observation.html)             | [USQualityCore Observation Cancelled](StructureDefinition-us-quality-core-observationcancelled.html)                        | [Observation]({{site.data.fhir.path}}observation.html)                           |
| [USQualityCore Procedure](StructureDefinition-us-quality-core-procedure.html)                               | [USQualityCore Procedure Not Done](StructureDefinition-us-quality-core-procedurenotdone.html)                               | [Procedure]({{site.data.fhir.path}}procedure.html)                               |
| [USQualityCore ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)                     | [USQualityCore Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html)                         | [ServiceRequest]({{site.data.fhir.path}}servicerequest.html)                     |
| [USQualityCore Task](StructureDefinition-us-quality-core-task.html)                                         | [USQualityCore Task Rejected](StructureDefinition-us-quality-core-taskrejected.html)                                        | [Task]({{site.data.fhir.path}}task.html)                                         |

Profiles marked with an asterisk (`*`) are not part of the conformance expectations of this guide because they do not include USCDI+ Quality flagged data elements. See the [Summary of Conformance Requirements](general-requirements.html#summary-of-conformance-requirements) and the [USCDI+ Quality out-of-scope profile summary](uscdiquality.html#summary-list-of-out-of-scope-profiles-for-conformance).

The <a href="StructureDefinition-us-quality-core-observationcancelled.html">USQualityCore ObservationCancelled</a> profile **SHOULD** be used to represent negation statements for all specific observation profiles including:

-   [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile](http://hl7.org/fhir/us/core/StructureDefinition/head-occipital-frontal-circumference-percentile)
-   [US Core Blood Pressure Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-blood-pressure)
-   [US Core BMI Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-bmi)
-   [US Core Body Height Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-height)
-   [US Core Body Temperature Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-temperature)
-   [US Core Body Weight Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-body-weight)
-   [US Core Head Circumference Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-head-circumference)
-   [US Core Heart Rate Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-heart-rate)
-   [US Core Pediatric BMI for Age Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/pediatric-bmi-for-age)
-   [US Core Pediatric Weight for Height Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/pediatric-weight-for-height)
-   [US Core Pulse Oximetry Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-pulse-oximetry)
-   [US Core Respiratory Rate Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-respiratory-rate)
-   [US Core Smoking Status Observation Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-smokingstatus)
-   [US Core Observation Sexual Orientation Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-sexual-orientation)
-   [US Core Observation Pregnancy Intent Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancyintent)
-   [US Core Observation Pregnancy Status Profile](http://hl7.org/fhir/us/core/StructureDefinition/us-core-observation-pregnancystatus)
-   [USQualityCore Simple Observation Profile](StructureDefinition-us-quality-core-simple-observation.html)
-   [USQualityCore Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html)
-   [USQualityCore Laboratory Result Observation](StructureDefinition-us-quality-core-observation-lab.html)
-   [USQualityCore Observation Screening Assessment](StructureDefinition-us-quality-core-observation-screening-assessment.html)

Each of the US Quality Core negation rationale profiles define at least the following information:

-   What activity/event did not occur (typically in terms of a value set or list of codes)
-   Explicit indication that the action/event did not occur (such as doNotPerform or a status of notDone)
-   Date, and optionally, a time a clinician indicated a reason for avoiding the activity/event
-   The reason the activity/event did not occur (Preferably represented using one of an established set of [Negation Reason Codes](ValueSet-us-quality-core-negation-reason.html))

**NOTE:** Although these aspects are all present within each negation profile defined by US Quality Core, they are represented differently in the various FHIR resources. As a result, each negation profile uses a combination of constraints and extensions to ensure complete representation of negated actions or events within US Quality Core.

### Using US Quality Core Negation Profiles

 **Extent of Negation**

The negation profiles in US Quality Core can be used to make two different types of negative statements:

1.  Documentation that a specific activity was not performed for a given reason
2.  Documentation that none of the activities in a given value set were performed for a given reason

#### Documenting one member of a value set was not performed for a given reason.

In the following example the measure numerator criterion allows for documentation that specifies a single antithrombotic medication using a CodeableConcept drawn from the list of possible expected medications (in the value set) was not administered. In the example the Profiled MedicationAdministration resource documents that the clinician specifically did not administer ticagrelor 90 MG Oral Tablet because drug treatment is not indicated. The evidence of a reason for not administering this single member of the value set “Antithrombotic Therapy for Ischemic Stroke” fulfills criteria for the numerator.

See the <a href="MedicationAdministration-negation-with-code-example.html">MedicationAdministration</a> example using a specific code) for a complete example.

```json
{
    "resourceType" : "MedicationAdministration",
    "id" : "negation-with-code-example",
    "meta" : {
        "profile" : ["http://fhir.org/guides/onc/us-quality-core/StructureDefinition/us-quality-core-medicationadministrationnotdone"]
    },
    "extension" : [{
        "url" : "http://fhir.org/guides/onc/us-quality-core/StructureDefinition/us-quality-core-recorded",
        "valueDateTime" : "2015-01-15"
    }],
    "status" : "not-done",
    "statusReason" : [{
        "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "183966005",
            "display" : "Drug treatment not indicated (situation)"
        }]
    }],
    "medicationCodeableConcept" : {
        "coding" : [{
            "system" : "http://www.nlm.nih.gov/research/umls/rxnorm",
            "code" : "1116635",
            "display" : "ticagrelor 90 MG Oral Tablet"
        }]
    },
    "subject" : ...,
    "effectivePeriod" : ...
}
```

#### Documenting no members of an entire value set were performed for a given reason.

This is applicable when a measure criterion can be satisfied when none of the medications in a value set is administered for a specified reason. This can occur when the no treatment of the type included in the value set is appropriate. The approach provided allows systems to document using one profiled data instance that none of the activities in a particular value set were performed, rather than requiring documentation of multiple individual activities from the value set.

The following example documents that providers did not prescribe any of the medications in the “Antithrombotic Therapy for Ischemic Stroke” value set using the <a href="StructureDefinition-us-quality-core-notDoneValueSet.html">notDoneValueSet</a> extension fulfills criteria for the numerator:

**NOTE:** Implementing systems must ensure that this approach does not result in conflicting data. For example, the above example indicating no administration of a medication in the Antithrombotic Therapy value set should not be used if there are administrations of individual medications in the same value set. In other words, it is a contradiction to say “a provider administered a specific medication” at the same time as “a provider did not administer any of the medications in this value set” if that value set includes the medication that was administered in the specific case.

See the <a href="MedicationAdministration-negation-example.html">MedicationAdministration example using a value set</a> for a complete example.

```json
{
    "resourceType" : "MedicationAdministration",
    "id" : "negation-example",
    "meta" : {
        "profile" : ["http://fhir.org/guides/onc/us-quality-core/StructureDefinition/us-quality-core-medicationadministrationnotdone"]
    },
    "extension" : [{
        "url" : "http://fhir.org/guides/onc/us-quality-core/StructureDefinition/us-quality-core-recorded",
        "valueDateTime" : "2015-01-15"
    }],
    "status" : "not-done",
    "statusReason" : [{
        "coding" : [{
            "system" : "http://snomed.info/sct",
            "code" : "183966005",
            "display" : "Drug treatment not indicated (situation)"
        }]
    }],
    "medicationCodeableConcept" : {
        "extension" : [{
            "url" : "http://fhir.org/guides/onc/us-quality-core/StructureDefinition/us-quality-core-notDoneValueSet",
            "valueCanonical" : "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62"
        }],
        "text" : "Not Done Value Set: Antithrombotic Therapy for Ischemic Stroke"
    },
    "subject" : ...,
    "effectivePeriod" : ...
}
```

When using a retrieve to access negated information, whether the activity extent is recorded as a CodeableConcept or a ValueSet is handled by the CQL. In most cases, the terminology can be provided as part of the retrieve directly. However, there are situations where authors may want to perform the terminology filtering for a negation activity outside of a retrieve. In these cases, authors can use the appropriate extension to access the negated element. For example, for MedicationAdministrationNotDone, the medication element has the notDoneValueSet extension defined, so the negation can be accessed using the `medication()` fluent function.

The first case is when the negation is for a specific activity, so the terminology is provided as a direct-reference code. This case cannot be handled in the retrieve directly due to a known issue. CQL R2 introduces a terminology contains operator to support this, and until that operator is available, the filtering needs to be handled outside the retrieve, as illustrated by the following example.

The following illustrative CQL example shows indication that a specific medication was not administered (using a direct-reference code). CQL examples in this guide are informational and are not part of the conformance requirements.

```cql
define TestSpecificMedicationAdministrationNotDoneExplicit:
  ["MedicationAdministrationNotDone"] I
    where I.medication() ~ MedicationCode
      or MedicationCode in I.medication()
```

The second case is when an alternative filter is being used in the retrieve, so the negated value set is provided in an addition filtering clause.

The following illustrative CQL example shows indication that a class of medications were not administered (using a value set):

```cql
define TestGeneralMedicationAdministrationNotDoneExplicit:
  ["MedicationAdministrationNotDone": status in "MedicationAdministrationCompletedCodes"] I
    where I.medication() in MedicationCodes
      or I.medication() ~ MedicationCodes
```

### Negation in CQL

For quality measurement and reporting, measure expression may only need to determine the existence or absence of an activity or event to determine if criteria have been met. If the reason for absence is not relevant to the measure evaluation, the absence of evidence pattern should be used as described in the [Negation section of the Using CQL IG](https://hl7.org/fhir/uv/cql/STU1/patterns.html#negation-in-fhir).
