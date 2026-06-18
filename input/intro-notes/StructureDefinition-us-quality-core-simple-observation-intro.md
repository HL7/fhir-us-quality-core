Note: US-Core and US Quality Core define precise profiles for specific observations, as well as a general profile for LOINC-code laboratory result observations. US Quality Core inherits these US Core specific profiles directly and individually profiles others. When creating expressions for eCQMs or CDS artifacts with US Quality Core for the following clinical data, use the applicable profile directly rather than the generic US Quality Core Observation profile:

- [US Core Pediatric Head Occipital-frontal Circumference Percentile Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html)
- [US Core Blood Pressure Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html)
- [US Core Average Blood Pressure Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-average-blood-pressure.html)
- [US Core BMI Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html)
- [US Core Body Height Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html)
- [US Core Care Experience Preference]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-care-experience-preference.html)
- [US Core Body Temperature Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html)
- [US Core Body Weight Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html)
- [US Core Head Circumference Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html)
- [US Core Heart Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html)
- [US Core Pediatric BMI for Age Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html)
- [US Core Pediatric Weight for Height Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html)
- [US Core Pulse Oximetry Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html)
- [US Core Respiratory Rate Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html)
- [US Core Smoking Status Observation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html)
- [US Core Observation Sexual Orientation Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html)
- [US Core Observation Pregnancy Intent Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html)
- [US Core Observation Pregnancy Status Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html)
- [US Quality Core Observation Clinical Result](StructureDefinition-us-quality-core-observation-clinical-result.html)
- [US Quality Core Laboratory Result Observation](StructureDefinition-us-quality-core-observation-lab.html)
- [US Quality Core Observation Screening Assessment](StructureDefinition-us-quality-core-observation-screening-assessment.html)
- [US Core Treatment Intervention Preference Profile]({{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-treatment-intervention-preference.html)

{% include profile-uscdi-quality-guidance.md profile="us-quality-core-simple-observation" %}

{% include profile-us-core-guidance.md profile="us-quality-core-simple-observation" %}
