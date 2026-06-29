{:toc}


{: .note}
> TODO: Still need to remove the profiles from QI-Core 8 that are not relevant to USCDI+ Quality.  Also, we don't need the whole 'identified by USCDI+ Quality mappings' concept, as every profile should be in scope now.

### US Quality Core Profiles
The following table lists the US Quality Core profiles that are part of the IG, directly supported US Core profiles identified by USCDI+ Quality mappings, and the underlying FHIR resources.

{% include profile-table.md %}

### Referencing US Quality Core Profiles

There are a number of profiles inherited directly from US Core profiles, if any, or other FHIR resources (i.e. US Core Device Profile, FHIR Vital Signs, US Core Smoking Status etc.) and the underlying Reference elements can address the US Core or FHIR profiles for the items referenced. For any other references to base FHIR resources or not formally defined in a US Quality Core Profile, the referenced resource **SHALL** be a US Quality Core Profile if a US Quality Core Profile exists for the resource type. For example, US Core Smoking Status references US Core Patient profile, the reference to Patient **SHALL** be a valid US Quality Core Patient.

Note to Implementers: US Quality Core profiles have been developed with the principle that if the profiles only need to provide references to US Quality Core Profiles, that is insufficient to require individual US Quality Core profiles for all US Core profiles. There are edge cases using this approach where the FHIR validator would not validate an assumption made by the measure author, such as that an encounter traced through an observation is a US Quality Core Encounter. We think that general validation of all the resources provided to the context of a measure evaluation can address that risk without the need for deriving specific profiles that only constrain reference types. We seek feedback on this point.

This change will strengthen the requirement to use a US Quality Core profile when using a base FHIR or US Core profile not formally defined in US Quality Core and to use US Quality Core profiles as referenced resources if a US Quality Core Profile exists for that resource.
