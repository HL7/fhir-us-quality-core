{:toc}

{: #us-quality-core-negation}

###  US Quality Core Negation Profile Index

For common workflow activities, US Quality Core defines general profiles that establish expectations for exchange in general, as well as two derived profiles, a positive and negative profile to define constraints for making positive and negative statements about activities:

| **US Quality Core General Profile**                                                                 | **US Quality Core Positive Profile**                                                                                | **US Quality Core Negation Profile**                                                                                | **Base Resource**                                                                |
|---------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| [US Quality Core Communication](StructureDefinition-us-quality-core-communication.html)                       | [US Quality Core Communication Done](StructureDefinition-us-quality-core-communicationdone.html)                              | [US Quality Core Communication Not Done](StructureDefinition-us-quality-core-communicationnotdone.html)                       | [Communication]({{site.data.fhir.path}}communication.html)                       |
| [US Quality Core DeviceRequest](StructureDefinition-us-quality-core-devicerequest.html)                       | [US Quality Core Device Requested](StructureDefinition-us-quality-core-devicerequested.html)                                  | [US Quality Core Device Prohibited](StructureDefinition-us-quality-core-deviceprohibited.html)                                | [DeviceRequest]({{site.data.fhir.path}}devicerequest.html)                       |
| [US Quality Core Immunization](StructureDefinition-us-quality-core-immunization.html)                         | [US Quality Core Immunization Done](StructureDefinition-us-quality-core-immunizationdone.html)                                | [US Quality Core Immunization Not Done](StructureDefinition-us-quality-core-immunizationnotdone.html)                         | [Immunization]({{site.data.fhir.path}}immunization.html)                         |
| [US Quality Core MedicationAdministration](StructureDefinition-us-quality-core-medicationadministration.html) | [US Quality Core MedicationAdministration Done](StructureDefinition-us-quality-core-medicationadministrationdone.html)        | [US Quality Core MedicationAdministration Not Done](StructureDefinition-us-quality-core-medicationadministrationnotdone.html) | [MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html) |
| [US Quality Core MedicationDispense](StructureDefinition-us-quality-core-medicationdispense.html)             | [US Quality Core MedicationDispense Done](StructureDefinition-us-quality-core-medicationdispensedone.html)                    | [US Quality Core MedicationDispense Declined](StructureDefinition-us-quality-core-medicationdispensedeclined.html)            | [MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)             |
| [US Quality Core MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)               | [US Quality Core MedicationRequested](StructureDefinition-us-quality-core-medicationrequested.html)                           | [US Quality Core Medication Prohibited](StructureDefinition-us-quality-core-medicationprohibited.html)                        | [MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)               |
| [US Quality Core Procedure](StructureDefinition-us-quality-core-procedure.html)                               | [US Quality Core Procedure Done](StructureDefinition-us-quality-core-proceduredone.html)                                      | [US Quality Core Procedure Not Done](StructureDefinition-us-quality-core-procedurenotdone.html)                               | [Procedure]({{site.data.fhir.path}}procedure.html)                               |
| [US Quality Core ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)                     | [US Quality Core ServiceRequested](StructureDefinition-us-quality-core-servicerequested.html)                                 | [US Quality Core Service Prohibited](StructureDefinition-us-quality-core-serviceprohibited.html)                              | [ServiceRequest]({{site.data.fhir.path}}servicerequest.html)                     |
| [US Quality Core Task](StructureDefinition-us-quality-core-task.html)                                         | [US Quality Core Task Done](StructureDefinition-us-quality-core-taskdone.html)                                                | [US Quality Core Task Rejected](StructureDefinition-us-quality-core-taskrejected.html)                                        | [Task]({{site.data.fhir.path}}task.html)                                         |

Each of the US Quality Core negation rationale profiles define at least the following information:

-   What activity/event did not occur (typically in terms of a value set or list of codes, or as a reference to a request)
-   Explicit indication that the action/event did not or should not occur (such as doNotPerform or a status of notDone)
-   Date, and optionally, a time a clinician indicated a reason for avoiding the activity/event
-   The reason the activity/event did not occur (Preferably represented using one of an established set of [Negation Reason Codes](ValueSet-us-quality-core-negation-reason-codes.html))

**NOTE:** Although these aspects are all present within each negation profile defined by US Quality Core, they are represented differently in the various FHIR resources. As a result, each negation profile uses a combination of constraints and extensions to ensure complete representation of negated actions or events within US Quality Core.

### Using US Quality Core Negation Profiles

#### Kinds of Negation Statements

The US Quality Core negation profiles support three general classes of negation statements:

1. Documentation that an activity was not performed for a reason (i.e. a notDone event)
2. Documentation that an activity should not be performed for a reason (i.e. a doNotPerform request)
3. Documentation that a request was not performed for a reason (i.e. a taskRejected)
 
#### Extent of Negation

The negation profiles in US Quality Core can be used to make two different types of negative statements:

1.	 Documentation that a particular activity/event should not or did not occur
2.	 Documentation that a class of activities/events should not or did not occur (typically represented with a value set)

##### Documenting one member of a value set was not performed for a given reason.

In the following example the measure numerator criterion allows for documentation that specifies a single antithrombotic medication using a CodeableConcept drawn from the list of possible expected medications (in the values set) was not administered. In the example the profiled MedicationAdministration resource documents that the clinician specifically did not administer ticagrelor 90 MG Oral Tablet because drug treatment is not indicated. The evidence of a reason for not administering this single member of the value set “Antithrombotic Therapy for Ischemic Stroke” fulfills criteria for the numerator.

See the <a href="MedicationAdministration-negation-with-code-example.html">MedicationAdministration</a> example using a specific code) for a complete example.

```json
{
    "resourceType" : "MedicationAdministration",
    "id" : "negation-with-code-example",
    "meta" : {
        "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationadministrationnotdone"]
    },
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
    "context" : ...,
    "supportingInformation" : ...,
    "effectivePeriod" : ...,
    "request" : ...,
    "note" : ...,
    "dosage" : ...
}
```

##### Documenting no members of an entire value set were performed for a given reason.

This is applicable when a measure criterion can be satisfied when none of the medications in a value set is administered for a specified reason. This can occur when the no treatment of the type included in the value set is appropriate. The approach provided allows systems to document using one profiled data instance that none of the activities in a particular value set were performed, rather than requiring documentation of multiple individual activities from the value set.

The following example documents that providers did not prescribe any of the medications in the "Antithrombotic Therapy for Ischemic Stroke" value set using the <a href="http://hl7.org/fhir/StructureDefinition/codeOptions">codeOptions</a> extension fulfills criteria for the numerator:

**NOTE:** Implementing systems must ensure that this approach does not result in conflicting data. For example, the above example indicating no administration of a medication in the Antithrombotic Therapy value set should not be used if there are administrations of individual medications in the same value set. In other words, it is a contradiction to say "a provider administered a specific medication" at the same time as "a provider did not administer any of the medications in this value set" if that value set includes the medication that was administered in the specific case.

See the <a href="MedicationAdministration-negation-example.html">MedicationAdministration example using a value set</a> for a complete example.


```json
{
    "resourceType" : "MedicationAdministration",
    "id" : "negation-example",
    "meta" : {
        "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-medicationadministrationnotdone"]
    },
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
            "url" : "http://hl7.org/fhir/StructureDefinition/codeOptions",
            "valueCanonical" : "http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1110.62"
        }],
        "text" : "Value Set: Antithrombotic Therapy for Ischemic Stroke"
    },
    "subject" : ...,
    "context" : ...,
    "supportingInformation" : ...,
    "effectivePeriod" : ...,
    "request" : ...,
    "note" : ...,
    "dosage" : ...
}
```


#### Do Not Perform Requests

To indicate that an activity should not be performed, use the "Prohibited" profiles:

* [DeviceProhibited](StructureDefinition-us-quality-core-deviceprohibited.html)
* [MedicationProhibited](StructureDefinition-us-quality-core-medicationprohibited.html)
* [ServiceProhibited](StructureDefinition-us-quality-core-serviceprohibited.html)

##### Request not to perform a specific activity

The following example illustrates a request not to apply Graduated compression elastic hosiery:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "negation-example-code",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-serviceprohibited"]
  },
  "status" : "completed",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical Procedure"
    }]
  }],
  "priority" : "urgent",
  "doNotPerform" : true,
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "348681001",
      "display" : "Graduated compression elastic hosiery (physical object)"
    }]
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04",
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "416406003",
      "display" : "Procedure discontinued (situation)"
    }]
  }]
}
```

See the [Service Prohibited With Code Example](ServiceRequest-negation-example-code.html) for a complete example.

##### Request not to perform any of a class of activities

The following example illustrates a request not to apply any of a class of devices, indicated by the Intermittent pneumatic compression devices values set:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "negation-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-serviceprohibited"]
  },
  "status" : "completed",
  "intent" : "order",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical Procedure"
    }]
  }],
  "priority" : "urgent",
  "doNotPerform" : true,
  "code" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/codeOptions",
      "valueCanonical" : "http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.117.1.7.1.214"
    }],
    "text" : "Value Set: Intermittent pneumatic compression devices (IPC)"
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04",
  "reasonCode" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "416406003",
      "display" : "Procedure discontinued (situation)"
    }]
  }],
  "bodySite" : ...
}
```

See the [Service Prohibited Example](ServiceRequest-negation-example.html) for a complete example.

#### Rejected Requests

To indicate that a request to perform an activity was rejected, use the task pattern:

1. A request resource indicating the activity to be performed (or not performed)
2. A TaskRejected with the request resource as `focus`, indicating the request to perform the activity was rejected

As with not done events and orders not to perform, the extent of negation for a rejected request can be a single activity, or any of a class of activities:

##### Rejecting a proposal to perform a specific activity

To indicate that a request to perform a specific activity was rejected:

First, the request to perform a specific activity as a ServiceRequest:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "proposal-example-code",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-servicerequested"]
  },
  "status" : "active",
  "intent" : "proposal",
  "priority" : "urgent",
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "348681001",
      "display" : "Graduated compression elastic hosiery (physical object)"
    }]
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04"
}
```

Second, a fulfillment task with a status of `rejected` and the `focus` referencing the proposal:

```json
{
  "resourceType" : "Task",
  "id" : "rejected-with-code-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-taskrejected"]
  },
  "status" : "rejected",
  "statusReason" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "275936005",
      "display" : "Patient noncompliance - general (situation)"
    }]
  },
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/proposal-example-code"
  },
  "for" : ...,
  "executionPeriod" : ...
}
```

See the [Service Requested With Code](ServiceRequest-proposal-example-code.html) for a complete example.

See the [Task Rejected With Code Example](Task-rejected-with-code-example.html) for a complete example.

##### Rejecting a proposal to perform any of a class of activities

To indicate that a request to perform any of a class of activities was rejected:

Similar to the specific activity case, first a request to perform any of a class of activities:

```json
{
  "resourceType" : "ServiceRequest",
  "id" : "proposal-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-servicerequested"]
  },
  "status" : "active",
  "intent" : "proposal",
  "category" : [{
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "387713003",
      "display" : "Surgical Procedure"
    }]
  }],
  "priority" : "urgent",
  "code" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/StructureDefinition/codeOptions",
      "valueCanonical" : "http://cts.nlm.nih.gov/fhir/2.16.840.1.113883.3.117.1.7.1.214"
    }],
    "text" : "Value Set: Intermittent pneumatic compression devices (IPC)"
  },
  "subject" : ...,
  "encounter" : ...,
  "occurrenceDateTime" : "2013-04-05",
  "authoredOn" : "2013-04-04"
}
```

Followed by a fulfillment task with a status of `rejected` and the `focus` referencing the proposal:

```json
{
  "resourceType" : "Task",
  "id" : "rejected-example",
  "meta" : {
    "profile" : ["http://hl7.org/fhir/us/quality-core/StructureDefinition/us-quality-core-taskrejected"]
  },
  "status" : "rejected",
  "statusReason" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "275936005",
      "display" : "Patient noncompliance - general (situation)"
    }]
  },
  "intent" : "proposal",
  "code" : {
    "coding" : [{
      "system" : "http://hl7.org/fhir/CodeSystem/task-code",
      "code" : "fulfill",
      "display" : "Fulfill the focal request"
    }]
  },
  "focus" : {
    "reference" : "ServiceRequest/proposal-example"
  },
  "for" : ...,
  "executionPeriod" : ...
}
```

See the [Service Requested Example](ServiceRequest-proposal-example.html) for a complete example.

See the [Task Rejected Example](Task-rejected-example.html) for a complete example.
