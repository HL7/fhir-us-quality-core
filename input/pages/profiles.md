{:toc}

### US Quality Core Profiles
The following table lists the US Quality Core profiles that are part of the IG, which US Core profile they are derived from, if any, and the underlying FHIR resources.

US Quality Core inherits all profiles from QI-Core 6.0.0, but not all profiles included in this guide are required for conformance. Implementations are expected to support profiles with at least one USCDI+ Quality flagged data element, as described in the [Summary of Conformance Requirements](general-requirements.html#summary-of-conformance-requirements) and the [USCDI+ Quality in-scope](uscdiquality.html#summary-list-of-in-scope-profiles-for-conformance) and [out-of-scope](uscdiquality.html#summary-list-of-out-of-scope-profiles-for-conformance) profile summaries. Profiles that are not part of the conformance expectations of this guide are marked with an asterisk (`*`) in the US Quality Core profile column.

<br>


|US Quality Core (0.5.0) Profile|US Core (6.1.0) Profile|Base Resource|
|----|:----:|----:|
|**2.1.1 AdverseEvent**|
|&emsp; [US Quality Core AdverseEvent](StructureDefinition-us-quality-core-adverseevent.html)| &mdash; |&emsp; [ AdverseEvent]({{site.data.fhir.path}}adverseevent.html)|
|**2.1.2 AllergyIntolerance**|
|&emsp; [US Quality Core AllergyIntolerance](StructureDefinition-us-quality-core-allergyintolerance.html)| [US Core AllergyIntolerance]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-allergyintolerance.html) |&emsp; [ AllergyIntolerance]({{site.data.fhir.path}}allergyintolerance.html)|
|**2.1.3 BodyStructure**|
|&emsp; [US Quality Core BodyStructure](StructureDefinition-us-quality-core-bodystructure.html)*| &mdash; |&emsp; [ BodyStructure]({{site.data.fhir.path}}bodystructure.html)|
|**2.1.4 CarePlan**|
|&emsp; [US Quality Core CarePlan](StructureDefinition-us-quality-core-careplan.html)| [US Core CarePlan]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-careplan.html) |&emsp; [ CarePlan]({{site.data.fhir.path}}careplan.html)|
|**2.1.5 CareTeam**|
|&emsp; [US Quality Core CareTeam](StructureDefinition-us-quality-core-careteam.html)| [US Core CareTeam]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-careteam.html) |&emsp; [ CareTeam]({{site.data.fhir.path}}careteam.html)|
|**2.1.6 Claim**|
|&emsp; [US Quality Core Claim](StructureDefinition-us-quality-core-claim.html)*| &mdash; |&emsp; [ Claim]({{site.data.fhir.path}}claim.html)|
|**2.1.7 ClaimResponse**|
|&emsp; [US Quality Core ClaimResponse](StructureDefinition-us-quality-core-claimresponse.html)*| &mdash; |&emsp; [ ClaimResponse]({{site.data.fhir.path}}claimresponse.html)|
|**2.1.8 Communication**|
|&emsp; [US Quality Core Communication](StructureDefinition-us-quality-core-communication.html)*| &mdash; |&emsp; [ Communication]({{site.data.fhir.path}}communication.html)|
|&emsp; [US Quality Core Communication Not Done](StructureDefinition-us-quality-core-communicationnotdone.html)*| &mdash; |&emsp; [ Communication]({{site.data.fhir.path}}communication.html)|
|**2.1.9 CommunicationRequest**|
|&emsp; [US Quality Core CommunicationRequest](StructureDefinition-us-quality-core-communicationrequest.html)*| &mdash; |&emsp; [ CommunicationRequest]({{site.data.fhir.path}}communicationrequest.html)|
|**2.1.10 Condition**|
|&emsp; [US Quality Core Condition Encounter Diagnosis](StructureDefinition-us-quality-core-condition-encounter-diagnosis.html)| [US Core Condition Encounter Diagnosis]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-condition-encounter-diagnosis.html) |&emsp; [ Condition]({{site.data.fhir.path}}condition.html)|
|&emsp; [US Quality Core Condition Problems Health Concerns](StructureDefinition-us-quality-core-condition-problems-health-concerns.html)| [US Core Condition Problems Health Concerns]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-condition-problems-health-concerns.html) |&emsp; [ Condition]({{site.data.fhir.path}}condition.html)|
|**2.1.11 Coverage**|
|&emsp; [US Quality Core Coverage](StructureDefinition-us-quality-core-coverage.html)| [US Core Coverage]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-coverage.html) |&emsp; [ Coverage]({{site.data.fhir.path}}coverage.html)|
|**2.1.12 Device**|
|&emsp; [US Quality Core Device](StructureDefinition-us-quality-core-device.html)*| &mdash; |&emsp; [ Device]({{site.data.fhir.path}}device.html)|
|  &mdash; |[US Core Implantable Device]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-implantable-device.html) |&emsp; [ Device]({{site.data.fhir.path}}device.html)|
|**2.1.13 DeviceRequest**|
|&emsp; [US Quality Core Device Not Requested](StructureDefinition-us-quality-core-devicenotrequested.html)| &mdash; |&emsp; [ DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|&emsp; [US Quality Core DeviceRequest](StructureDefinition-us-quality-core-devicerequest.html)| &mdash; |&emsp; [ DeviceRequest]({{site.data.fhir.path}}devicerequest.html)|
|**2.1.14 DeviceUseStatement**|
|&emsp; [US Quality Core DeviceUseStatement](StructureDefinition-us-quality-core-deviceusestatement.html)*| &mdash; |&emsp; [ DeviceUseStatement]({{site.data.fhir.path}}deviceusestatement.html)|
|**2.1.15 DiagnosticReport**|
|&emsp; [US Quality Core DiagnosticReport Profile for Laboratory Results Reporting](StructureDefinition-us-quality-core-diagnosticreport-lab.html)&emsp;| [US Core DiagnosticReport Profile for Laboratory Results Reporting]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-diagnosticreport-lab.html) |&emsp; [ DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|&emsp; [US Quality Core DiagnosticReport Profile for Report and Note Exchange](StructureDefinition-us-quality-core-diagnosticreport-note.html)| [US Core DiagnosticReport Profile for Report and Note Exchange]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-diagnosticreport-note.html) |&emsp; [ DiagnosticReport]({{site.data.fhir.path}}diagnosticreport.html)|
|**2.1.16 Encounter**|
|&emsp; [US Quality Core Encounter](StructureDefinition-us-quality-core-encounter.html)| [US Core Encounter]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-encounter.html) |&emsp; [ Encounter]({{site.data.fhir.path}}encounter.html)|
|**2.1.17 FamilyMemberHistory**|
|&emsp; [US Quality Core FamilyMemberHistory](StructureDefinition-us-quality-core-familymemberhistory.html)| &mdash; |&emsp; [ FamilyMemberHistory]({{site.data.fhir.path}}familymemberhistory.html)|
|**2.1.18 Flag**|
|&emsp; [US Quality Core Flag](StructureDefinition-us-quality-core-flag.html)*| &mdash; |&emsp; [ Flag]({{site.data.fhir.path}}flag.html)|
|**2.1.19 Goal**|
|&emsp; [US Quality Core Goal](StructureDefinition-us-quality-core-goal.html)| [US Core Goal]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-goal.html) |&emsp; [ Goal]({{site.data.fhir.path}}goal.html)|
|**2.1.20 ImagingStudy**|
|&emsp; [US Quality Core ImagingStudy](StructureDefinition-us-quality-core-imagingstudy.html)*| &mdash; |&emsp; [ ImagingStudy]({{site.data.fhir.path}}imagingstudy.html)|
|**2.1.21 Immunization**|
|&emsp; [US Quality Core Immunization](StructureDefinition-us-quality-core-immunization.html)| [US Core Immunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html) |&emsp; [ Immunization]({{site.data.fhir.path}}immunization.html)|
|&emsp; [US Quality Core Immunization Not Done](StructureDefinition-us-quality-core-immunizationnotdone.html)| [US Core Immunization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-immunization.html) |&emsp; [ Immunization]({{site.data.fhir.path}}immunization.html)|
|**2.1.22 ImmunizationEvaluation**|
|&emsp; [US Quality Core ImmunizationEvaluation](StructureDefinition-us-quality-core-immunizationevaluation.html)*| &mdash; |&emsp; [ ImmunizationEvaluation]({{site.data.fhir.path}}immunizationevaluation.html)|
|**2.1.23 ImmunizationRecommendation**|
|&emsp; [US Quality Core ImmunizationRecommendation](StructureDefinition-us-quality-core-immunizationrecommendation.html)*| &mdash; |&emsp; [ ImmunizationRecommendation]({{site.data.fhir.path}}immunizationrecommendation.html)|
|**2.1.24 Location**|
|&emsp; [US Quality Core Location](StructureDefinition-us-quality-core-location.html)| [US Core Location]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-location.html) |&emsp; [ Location]({{site.data.fhir.path}}location.html)|
|**2.1.25 Medication**|
|&emsp; [US Quality Core Medication](StructureDefinition-us-quality-core-medication.html)| [US Core Medication]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medication.html) |&emsp; [ Medication]({{site.data.fhir.path}}medication.html)|
|**2.1.26 MedicationAdministration**|
|&emsp; [US Quality Core MedicationAdministration](StructureDefinition-us-quality-core-medicationadministration.html)| &mdash; |&emsp; [ MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|&emsp; [US Quality Core MedicationAdministration Not Done](StructureDefinition-us-quality-core-medicationadministrationnotdone.html)| &mdash; |&emsp; [ MedicationAdministration]({{site.data.fhir.path}}medicationadministration.html)|
|**2.1.27 MedicationDispense**|
|&emsp; [US Quality Core MedicationDispense](StructureDefinition-us-quality-core-medicationdispense.html)| [US Core MedicationDispense]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationdispense.html)  |&emsp; [ MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|&emsp; [US Quality Core MedicationDispense Declined](StructureDefinition-us-quality-core-medicationdispensedeclined.html)| [US Core MedicationDispense]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationdispense.html)  |&emsp; [ MedicationDispense]({{site.data.fhir.path}}medicationdispense.html)|
|**2.1.28 MedicationRequest**|
|&emsp; [US Quality Core Medication Not Requested](StructureDefinition-us-quality-core-medicationnotrequested.html)| [US Core MedicationRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationrequest.html) |&emsp; [ MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|&emsp; [US Quality Core MedicationRequest](StructureDefinition-us-quality-core-medicationrequest.html)| [US Core MedicationRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-medicationrequest.html) |&emsp; [ MedicationRequest]({{site.data.fhir.path}}medicationrequest.html)|
|**2.1.29 MedicationStatement**|
|&emsp; [US Quality Core MedicationStatement](StructureDefinition-us-quality-core-medicationstatement.html)*| &mdash; |&emsp; [ MedicationStatement]({{site.data.fhir.path}}medicationstatement.html)|
|**2.1.30 NutritionOrder**|
|&emsp; [US Quality Core NutritionOrder](StructureDefinition-us-quality-core-nutritionorder.html)*| &mdash; |&emsp; [ NutritionOrder]({{site.data.fhir.path}}nutritionorder.html)|
|**2.1.31 Observation**|
|&emsp; [US Quality Core Simple Observation](StructureDefinition-us-quality-core-simple-observation.html)| [US Core Simple Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-simple-observation.html) |&emsp; [ Observation]({{site.data.fhir.path}}observation.html)|
|&emsp; [US Quality Core Observation Cancelled](StructureDefinition-us-quality-core-observationcancelled.html)| &mdash; |&emsp; [ Observation]({{site.data.fhir.path}}observation.html)|
|&emsp; [US Quality Core NonPatient Observation](StructureDefinition-us-quality-core-nonpatient-observation.html)*| &mdash; |&emsp; [ Observation]({{site.data.fhir.path}}observation.html)|
|&emsp; [US Quality Core Laboratory Result Observation](StructureDefinition-us-quality-core-observation-lab.html)| [US Core Laboratory Result Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-lab.html) |&emsp; [ Observation]({{site.data.fhir.path}}observation.html)|
|&emsp; [US Quality Core Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html)| [US Core Observation Clinical Result]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-clinical-result.html) |&emsp; [ Observation]({{site.data.fhir.path}}observation.html)|
|&emsp; [US Quality Core Observation Screening Assessment](StructureDefinition-us-quality-core-observation-screening-assessment.html)| [US Core Observation Screening Assessment]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-screening-assessment.html) |&emsp; [ Observation]({{site.data.fhir.path}}observation.html)|
|  &mdash;  |[US Core Vital Signs]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-vital-signs.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Blood Pressure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core BMI]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Body Height]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Body Temperature]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Body Weight]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Head Circumference]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Heart Rate]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Pediatric BMI for Age Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Pediatric Head Occipital-frontal Circumference Percentile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Pediatric Weight for Height Observation]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Pulse Oximetry]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Respiratory Rate]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Smoking Status]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Observation Occupation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-occupation.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Observation Sexual Orientation]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Observation Pregnancy Intent]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|  &mdash;  |[US Core Observation Pregnancy Status]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html) | [Observation]({{site.data.fhir.path}}observation.html) |
|**2.1.32 Organization**|
|&emsp; [US Quality Core Organization](StructureDefinition-us-quality-core-organization.html)| [US Core Organization]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-organization.html) |&emsp; [ Organization]({{site.data.fhir.path}}organization.html)|
|**2.1.33 Patient**|
|&emsp; [US Quality Core Patient](StructureDefinition-us-quality-core-patient.html)| [US Core Patient]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-patient.html) |&emsp; [ Patient]({{site.data.fhir.path}}patient.html)|
|**2.1.34 Practitioner**|
|&emsp; [US Quality Core Practitioner](StructureDefinition-us-quality-core-practitioner.html)| [US Core Practitioner]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitioner.html) |&emsp; [ Practitioner]({{site.data.fhir.path}}practitioner.html)|
|**2.1.35 PractitionerRole**|
|&emsp; [US Quality Core PractitionerRole](StructureDefinition-us-quality-core-practitionerrole.html)| [US Core PractitionerRole]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-practitionerrole.html) |&emsp; [ PractitionerRole]({{site.data.fhir.path}}practitionerrole.html)|
|**2.1.36 Procedure**|
|&emsp; [US Quality Core Procedure](StructureDefinition-us-quality-core-procedure.html)| [US Core Procedure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-procedure.html) |&emsp; [ Procedure]({{site.data.fhir.path}}procedure.html)|
|&emsp; [US Quality Core Procedure Not Done](StructureDefinition-us-quality-core-procedurenotdone.html)| [US Core Procedure]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-procedure.html) |&emsp; [ Procedure]({{site.data.fhir.path}}procedure.html)|
|**2.1.37 QuestionnaireResponse**|
|&emsp; [US Quality Core QuestionnaireResponse](StructureDefinition-us-quality-core-questionnaireresponse.html)*| [US Core QuestionnaireResponse]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-questionnaireresponse.html) |&emsp; [ QuestionnaireResponse]({{site.data.fhir.path}}questionnaireresponse.html)|
|**2.1.38 RelatedPerson**|
|&emsp; [US Quality Core RelatedPerson](StructureDefinition-us-quality-core-relatedperson.html)|&emsp; [ US Core RelatedPerson]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-relatedperson.html) |&emsp; [ RelatedPerson]({{site.data.fhir.path}}relatedperson.html)|
|**2.1.39 ServiceRequest**|
|&emsp; [US Quality Core Service Not Requested](StructureDefinition-us-quality-core-servicenotrequested.html)|&emsp; [ US Core ServiceRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-servicerequest.html)  |&emsp; [ ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|&emsp; [US Quality Core ServiceRequest](StructureDefinition-us-quality-core-servicerequest.html)|&emsp; [ US Core ServiceRequest]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-servicerequest.html) |&emsp; [ ServiceRequest]({{site.data.fhir.path}}servicerequest.html)|
|**2.1.40 Specimen**|
|  &mdash;  |[US Core Specimen]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-specimen.html)|&emsp; [ Specimen]({{site.data.fhir.path}}specimen.html)|
|**2.1.41 Substance**|
|&emsp; [US Quality Core Substance](StructureDefinition-us-quality-core-substance.html)*| &mdash; |&emsp; [ Substance]({{site.data.fhir.path}}substance.html)|
|**2.1.42 Task**|
|&emsp; [US Quality Core Task](StructureDefinition-us-quality-core-task.html)| &mdash; |&emsp; [ Task]({{site.data.fhir.path}}task.html)|
|&emsp; [US Quality Core Task Rejected](StructureDefinition-us-quality-core-taskrejected.html)| &mdash; |&emsp; [ Task]({{site.data.fhir.path}}task.html)|
{: .list}


### Referencing US Quality Core Profiles

There are a number of US Quality Core profiles inherited directly from US Core profiles, if any, or other FHIR resources (i.e. US Core Implantable Device Profile, FHIR Vital Signs, US Core Smoking Status etc.) and the underlying Reference elements can address the US Core or FHIR profiles for the items referenced. For any other references to base FHIR resources or not formally defined in a US Quality Core Profile, the referenced resource **SHALL** be a US Quality Core Profile if a US Quality Core Profile exists for the resource type. For example, US Core Smoking Status references US Core Patient profile, the reference to Patient **SHALL** be a valid US Quality Core Patient.

Note to Implementers: US Quality Core profiles have been developed with the principle that if the profiles only need to provide references to US Quality Core Profiles, that is insufficient to require individual US Quality Core profiles for all US Core profiles. There are edge cases using this approach where the FHIR validator would not validate an assumption made by the measure author, such as that an encounter traced through an observation is a US Quality Core Encounter. We think that general validation of all the resources provided to the context of a measure evaluation can address that risk without the need for deriving specific profiles that only constrain reference types. We seek feedback on this point.

This change will strengthen the requirement to use a US Quality Core profile when using a base FHIR or US Core profile not formally defined in US Quality Core and to use US Quality Core profiles as referenced resources if a US Quality Core Profile exists for that resource.
