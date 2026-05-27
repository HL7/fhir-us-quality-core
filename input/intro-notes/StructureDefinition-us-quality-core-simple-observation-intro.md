<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://hl7.org/fhir ../../input-cache/schemas/R5/fhir-single.xsd">
	<a name="usage"><b>Usage</b></a>
	<!--@@@FHIR-37490-->
	<p>Note: US-Core and US Quality Core define precise profiles for specific observations, as well as a general profile for LOINC-code laboratory result observations. US Quality Core inherits these US Core specific profiles directly and individually profiles others. When creating expressions for eCQMs or CDS artifacts with US Quality Core for the following clinical data, use the applicable profile directly rather than the generic USQualityCore Observation profile:<ul>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-head-occipital-frontal-circumference-percentile.html">US Core Pediatric Head Occipital-frontal Circumference Percentile Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-blood-pressure.html">US Core Blood Pressure Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-bmi.html">US Core BMI Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-height.html">US Core Body Height Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-temperature.html">US Core Body Temperature Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-body-weight.html">US Core Body Weight Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-head-circumference.html">US Core Head Circumference Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-heart-rate.html">US Core Heart Rate Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-bmi-for-age.html">US Core Pediatric BMI for Age Observation Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-pediatric-weight-for-height.html">US Core Pediatric Weight for Height Observation Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-pulse-oximetry.html">US Core Pulse Oximetry Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-respiratory-rate.html">US Core Respiratory Rate Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-smokingstatus.html">US Core Smoking Status Observation Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-sexual-orientation.html">US Core Observation Sexual Orientation Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancyintent.html">US Core Observation Pregnancy Intent Profile</a></li>
	<li><a href="{{site.data.fhir.ver.uscore}}/StructureDefinition-us-core-observation-pregnancystatus.html">US Core Observation Pregnancy Status Profile</a></li>
	<li><a href="StructureDefinition-us-quality-core-observation-clinical-result.html">USQualityCore Observation Clinical Result</a></li>
	<li><a href="StructureDefinition-us-quality-core-observation-lab.html">USQualityCore Laboratory Result Observation</a></li>
	<li><a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">USQualityCore Observation Screening Assessment</a></li></ul></p>

	<p> As stated in the Home Page, US Quality Core derives from US Core and so the requirements on “MustSupport” defined in US Core must be respected. US Quality Core further <a href="must-support.html">describes and constrains the “MustSupport” functionality</a>.</p>
	<p>To create an expression specifically requesting information that an observation intentionally did not occur for a medical, patient or system reason, use the profile <a href="StructureDefinition-us-quality-core-observationcancelled.html">USQualityCore Observation Cancelled</a>.</p>

<p>The following example illustrates the use of the observation profile.</p>
<pre>
<code>define "Pap Test with Results":
  [Observation: "Pap Test"] PapTest
    where PapTest.value is not null
      and PapTest.status in { 'final', 'amended', 'corrected', 'preliminary' }
</code>
</pre>

  <p>
  <tr>
      <td>See the <a href="patterns.html">patterns</a> page for implementation and usage patterns.</td>
  </tr>
  </p>
  <a name="examples"> </a>
  <h3>Examples</h3>
  <p>
  <table>
    <tbody>
			<tr>
					<td><a href="Observation-example-frailty.html">Frailty Observation Example</a></td>
			</tr>
			<tr>
					<td><a href="Observation-example-gestation.html">Gestational Age at Birth Example</a></td>
			</tr>
    	<tr>
    		<td><a href="Observation-example-obstetric-delivery.html">Date and Time of Obstetric Delivery Example</a></td>
    	</tr>
    	<tr>
    		<td><a href="Observation-example-delivery-date-estimate.html">Delivery Date Estimated Example</a></td>
    	</tr>
    	<tr>
    		<td><a href="Observation-example-preterm-births.html">Number of Preterm Births Example</a></td>
    	</tr>
    	<tr>
    		<td><a href="Observation-example-births.html">Number of Term Births Example</a></td>
    	</tr>
    	<tr>
    		<td><a href="Observation-example-parity.html">Number of Parity Example</a></td>
    	</tr>
    	<tr>
    		<td><a href="Observation-example-pregnancies.html">Number of Pregnancies Example</a></td>
    	</tr>
    </tbody>
  </table>
  </p>
</div>

<!-- START AUTOGENERATED KEY ELEMENTS -->
<b>USCDI+ Quality Elements:</b>
<ul>
<li>status: (USCDI+ Quality) (USCDI) registered | prliminary | final | amended | corrected | entered-in-error | unknown</li>
<li>category: (USCDI+ Quality) (USCDI) Classification of type of observation</li>
<li>category:us-core: (USCDI+ Quality) (USCDI) US Core classification of type of observation</li>
<li>code: (USCDI+ Quality) (USCDI) Type of observation (code / type)</li>
<li>effective[x]: (USCDI+ Quality) (USCDI) Clinically relevant time/time-period for observation</li>
<li>value[x]: (USCDI+ Quality) (USCDI) Actual result</li>
</ul>
<!-- END AUTOGENERATED KEY ELEMENTS -->
