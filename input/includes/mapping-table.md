### In-Scope USCDI+ Quality V1 Data Elements

Only those USCDI+ Quality V1 data classes and elements that are required to
be implemented for conformance to this guide are included in this mapping table.

- In scope elements are determined by their support in the current USCDI+ Quality V1 baseline, which includes USCDI v3.1, US Core 6.1.0, and/or QI-Core 6.0.0.
- In scope elements also include data elements that are used by 2026 draft CMS eCQMs, which are based on QI-Core 6.0.0.

The mapping table identifies any US Quality Core profiles defined in this guide and any US Core 6.1.0 profiles that apply to each USCDI+ Quality V1 data class or element. If neither column references a profile, this guide does not identify a specific profile for representing that element in this version; implementers may determine the appropriate implementation approach to support the data element.

<table class="table table-condensed">
    <thead>
        <tr>
            <th class="col-sm-4">USCDI+ Quality Data Class / Element</th>
            <th class="col-sm-4">Implement with US Quality Core Profile(s)</th>
            <th class="col-sm-4">Implement with US Core Profile(s)</th>
        </tr>
    </thead>
    
        <thead>
            <tr>
                <th class="col-sm-4">Adverse Events</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Adverse Event</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-adverseevent.html">US Quality Core AdverseEvent</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Adverse Event Category</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-adverseevent.html">US Quality Core AdverseEvent</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Adverse Event Recorded Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-adverseevent.html">US Quality Core AdverseEvent</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Adverse Event Suspect Entity</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-adverseevent.html">US Quality Core AdverseEvent</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Allergies and Intolerances</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Allergy Intolerance Onset Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Allergy Intolerance Recorded Date</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Drug Class Allergy Intolerance</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medication Allergy Intolerance</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Reaction</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Reaction Date</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Care Team Members</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Care Team Member Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-careteam.html">US Quality Core CareTeam</a><br />
                            <a href="StructureDefinition-us-quality-core-practitioner.html">US Quality Core Practitioner</a><br />
                            <a href="StructureDefinition-us-quality-core-practitionerrole.html">US Quality Core PractitionerRole</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Care Team Member Location</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-practitioner.html">US Quality Core Practitioner</a><br />
                            <a href="StructureDefinition-us-quality-core-practitionerrole.html">US Quality Core PractitionerRole</a><br />
                            <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Care Team Member Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-practitioner.html">US Quality Core Practitioner</a><br />
                            <a href="StructureDefinition-us-quality-core-practitionerrole.html">US Quality Core PractitionerRole</a><br />
                            <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Care Team Member Role</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a><br />
                            <a href="StructureDefinition-us-quality-core-practitionerrole.html">US Quality Core PractitionerRole</a><br />
                            <a href="StructureDefinition-us-quality-core-careteam.html">US Quality Core CareTeam</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Care Team Member Telecom</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-practitioner.html">US Quality Core Practitioner</a><br />
                            <a href="StructureDefinition-us-quality-core-practitionerrole.html">US Quality Core PractitionerRole</a><br />
                            <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Clinical Notes</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Consultation Note</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-documentreference.html">US Core DocumentReference Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Discharge Summary Note</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-documentreference.html">US Core DocumentReference Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•History & Physical</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-documentreference.html">US Core DocumentReference Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Procedure Note</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-note.html">US Quality Core DiagnosticReport Profile for Report and Note Exchange</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Progress Note</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-documentreference.html">US Core DocumentReference Profile (6.1.0)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Clinical Tests</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Clinical Test</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-clinical-result.html">US Quality Core Observation Clinical Result</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-note.html">US Quality Core DiagnosticReport Profile for Report and Note Exchange</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Clinical Test Result/Report</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-clinical-result.html">US Quality Core Observation Clinical Result</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-note.html">US Quality Core DiagnosticReport Profile for Report and Note Exchange</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Clinical Test Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-clinical-result.html">US Quality Core Observation Clinical Result</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-note.html">US Quality Core DiagnosticReport Profile for Report and Note Exchange</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Diagnostic Imaging</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Diagnostic Imaging Report</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-clinical-result.html">US Quality Core Observation Clinical Result</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Diagnostic Imaging Test</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-clinical-result.html">US Quality Core Observation Clinical Result</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Encounter Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Diagnosis Rank&nbsp;<a href="#encounter-information-diagnosis-rank">(see note)</a></td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Diagnosis</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-encounter-diagnosis.html">US Quality Core Condition Encounter Diagnosis</a><br />
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Diagnosis Role</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-encounter-diagnosis.html">US Quality Core Condition Encounter Diagnosis</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Disposition</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Location</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Encounter Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Present on Admission&nbsp;<a href="#encounter-information-present-on-admission">(see note)</a></td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Facility Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Facility Address</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-location.html">US Quality Core Location</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Facility Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-location.html">US Quality Core Location</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Facility Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-location.html">US Quality Core Location</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Family Health History</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Family Health History</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-familymemberhistory.html">US Quality Core FamilyMemberHistory</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Goals and Preferences</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Patient Goals</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-goal.html">US Quality Core Goal</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•SDOH Goals</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-goal.html">US Quality Core Goal</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Health Insurance Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Coverage Period</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Coverage Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Coverage Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Group Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Health Insurance Beneficiary</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Insurance Plan Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Member Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Payer Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                            <a href="StructureDefinition-us-quality-core-organization.html">US Quality Core Organization</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Plan Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Relationship to Subscriber</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Subscriber Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Health Status Assessments</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Disability Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a><br />
                            <a href="StructureDefinition-us-quality-core-observationcancelled.html">US Quality Core Observation Cancelled</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Functional Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a><br />
                            <a href="StructureDefinition-us-quality-core-observationcancelled.html">US Quality Core Observation Cancelled</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Health Concerns</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Mental/Cognitive Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a><br />
                            <a href="StructureDefinition-us-quality-core-observationcancelled.html">US Quality Core Observation Cancelled</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Nutrition Assessment</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a><br />
                            <a href="StructureDefinition-us-quality-core-observationcancelled.html">US Quality Core Observation Cancelled</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Pregnancy Status</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-pregnancyintent.html">US Core Observation Pregnancy Intent Profile (6.1.0)</a><br />
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-pregnancystatus.html">US Core Observation Pregnancy Status Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•SDOH Assessment</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a><br />
                            <a href="StructureDefinition-us-quality-core-observationcancelled.html">US Quality Core Observation Cancelled</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Smoking Status</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-smokingstatus.html">US Core Smoking Status Observation Profile (6.1.0)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Immunizations</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Immunization Record Source</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Immunization Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Immunizations</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Reason Not Performed</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a><br />
                            <a href="StructureDefinition-us-quality-core-immunizationnotdone.html">US Quality Core Immunization Not Done</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Vaccination Administration Date</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Laboratory</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Laboratory Result Report Date Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Result Interpretation</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Result Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Result Unit of Measure</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Specimen Type</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-specimen.html">US Core Specimen Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Tests</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Values/Results</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Medical Devices</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Device Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-devicerequest.html">US Quality Core DeviceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-devicenotrequested.html">US Quality Core Device Not Requested</a><br />
                            <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Medications</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date Medication Administered</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date Medication Prescribed</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Days Supply</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Dispense Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationdispensedeclined.html">US Quality Core MedicationDispense Declined</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Dose</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Dose unit of measure</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Indication</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medication Administration Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationadministrationnotdone.html">US Quality Core MedicationAdministration Not Done</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medication Instructions</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medication Order</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medication Quantity</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medications</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a><br />
                            <a href="StructureDefinition-us-quality-core-medication.html">US Quality Core Medication</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Reason Not Performed</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationadministrationnotdone.html">US Quality Core MedicationAdministration Not Done</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationnotrequested.html">US Quality Core Medication Not Requested</a><br />
                            <a href="StructureDefinition-us-quality-core-medicationdispensedeclined.html">US Quality Core MedicationDispense Declined</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Newborn's Delivery Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Birth Outcome</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Birth Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Birth Weight</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Gestational Age at Delivery</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Orders</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Medication Order</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Patient Demographics/Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Current Address</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date of Birth</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date of Death</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Email Address</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Ethnicity</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•First Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Last Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Middle Name (Including middle initial)</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Name Suffix</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Occupation</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-occupation.html">US Core Observation Occupation Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Occupation Industry</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-observation-occupation.html">US Core Observation Occupation Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Patient Identifier</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Phone Number</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Phone Number Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Preferred Language</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Previous Address</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Previous Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Race</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Related Person's Name</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Relationship Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Tribal Affiliation</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Patient Summary and Plan</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Assessment and Plan of Treatment</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-careplan.html">US Quality Core CarePlan</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Pregnancy Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Delivery Procedures</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Delivery Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Estimated Date of Delivery</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Fetal Presentation</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Gestational Age</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Gravidity</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Parity</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Pregnancy Outcomes</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Preterm Births</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Term Births</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Problems</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Clinical Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Condition Verification Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date of Diagnosis</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-encounter-diagnosis.html">US Quality Core Condition Encounter Diagnosis</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date of Onset</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                            <a href="StructureDefinition-us-quality-core-condition-encounter-diagnosis.html">US Quality Core Condition Encounter Diagnosis</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Date of Resolution</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Problems</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•SDOH Problems/Health Concerns</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Procedures</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Performance Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a><br />
                            <a href="StructureDefinition-us-quality-core-diagnosticreport-note.html">US Quality Core DiagnosticReport Profile for Report and Note Exchange</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                            <a href="StructureDefinition-us-quality-core-immunizationnotdone.html">US Quality Core Immunization Not Done</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Procedure Reason Code</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                            <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a><br />
                            <a href="StructureDefinition-us-quality-core-task.html">US Quality Core Task</a><br />
                            <a href="StructureDefinition-us-quality-core-taskrejected.html">US Quality Core Task Rejected</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Procedure Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Procedure Type</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Procedures&nbsp;<a href="#procedures-procedures">(see note)</a></td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                            <a href="StructureDefinition-us-quality-core-task.html">US Quality Core Task</a><br />
                            <a href="StructureDefinition-us-quality-core-taskrejected.html">US Quality Core Task Rejected</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Reason for Referral</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                            <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•SDOH Interventions</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a><br />
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a><br />
                            <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Provenance</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Author Organization</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-provenance.html">US Core Provenance Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Author Time Stamp</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-provenance.html">US Core Provenance Profile (6.1.0)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Referrals</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Reason for Referral</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Referral Status</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Referral Time</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a><br />
                            <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Vital Signs</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Average Blood Pressure</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-blood-pressure.html">US Core Blood Pressure Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•BMI</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-bmi.html">US Core BMI Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•BMI Percentile (2 - 20 years)</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-pediatric-bmi-for-age.html">US Core Pediatric BMI for Age Observation Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Body Height</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-body-height.html">US Core Body Height Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Body Temperature</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-body-temperature.html">US Core Body Temperature Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Body Weight</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-body-weight.html">US Core Body Weight Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Diastolic Blood Pressure</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-blood-pressure.html">US Core Blood Pressure Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Head Occipital-frontal Circumference Percentile (Birth - 36 Months)</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-head-occipital-frontal-circumference-percentile.html">US Core Pediatric Head Occipital Frontal Circumference Percentile Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Heart Rate</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-heart-rate.html">US Core Heart Rate Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Inhaled Oxygen Concentration</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-pulse-oximetry.html">US Core Pulse Oximetry Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Pain Severity</td>
                    <td>
                            <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Pulse Oximetry</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-pulse-oximetry.html">US Core Pulse Oximetry Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Respiratory Rate</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-respiratory-rate.html">US Core Respiratory Rate Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Systolic Blood Pressure</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-us-core-blood-pressure.html">US Core Blood Pressure Profile (6.1.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Weight-for-length Percentile (Birth - 24 Months)</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU6.1/StructureDefinition-pediatric-weight-for-height.html">US Core Pediatric Weight for Height Observation Profile (6.1.0)</a><br />
                    </td>
                </tr>
        </tbody>
</table>

#### Notes

##### Encounter Information: Diagnosis Rank
In QI-Core 6.0.0, information about principal diagnosis is represented using the Claim profile. In US Quality Core v0.5.0, support for the Claim profile is not required for conformance. Implementers may determine the appropriate implementation approach to support this USCDI+ Quality data element. We encourage the quality community to provide additional input on information needed to support quality measurement use cases through the HL7 ballot process for US Quality Core.
##### Encounter Information: Present on Admission
In QI-Core 6.0.0, information about present on admission is represented using the Claim profile. In US Quality Core v0.5.0, support for the Claim profile is not required for conformance. We have reintroduced the Present on Admission extension for Encounter.diagnosis in US Quality Core v0.5.0 and it is (USCDI+ Quality) tagged.
##### Procedures: Procedures
In QI-Core 6.0.0, information about principal procedure is represented using the Claim profile. In US Quality Core v0.5.0, support for the Claim profile is not required for conformance. Implementers may determine the appropriate implementation approach to support this USCDI+ Quality data element. We encourage the quality community to provide additional input on information needed to support quality measurement use cases through the HL7 ballot process for US Quality Core.

### Out-of-Scope USCDI+ Quality V1 Data Elements

The following data elements in USCDI+ Quality V1 are out of scope for the
conformance expectations of this guide. Data elements listed
here may map to newer published versions of QI-Core or US Core, and the applicable versions are indicated in parentheses next to the profile.

USCDI+ Quality V1 elements that do not have a
mapping in the table below indicate those elements are not identified as mandatory or Must Support, or tagged
(QI), (QI-Core), or "Additional USCDI" in any of the newer versions of QI-Core or
US Core, including QI-Core 7.0.2 and 8.0.0-ballot, US Core 7.0.0, 8.0.1, and 9.0.0.

<table class="table table-condensed">
    <thead>
        <tr>
            <th class="col-sm-4">USCDI+ Quality Data Class / Element</th>
            <th class="col-sm-4">Relevant QI-Core Profile(s)</th>
            <th class="col-sm-4">Relevant US Core Profile(s)</th>
        </tr>
    </thead>
    
        <thead>
            <tr>
                <th class="col-sm-4">Advance Directives</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Advance Directive Observation</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-adi-documentation.html">US Core Observation ADI Documentation Profile (8.0.1)</a><br />
                            <a href="https://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-adi-documentreference.html">US Core ADI DocumentReference Profile (8.0.1)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Adverse Events</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Adverse Event Degree of Harm</td>
                    <td>
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-adverseevent.html">QICore AdverseEvent (7.0.2)</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Allergies and Intolerances</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Non-Medication Allergy Intolerance</td>
                    <td>
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-allergyintolerance.html">QICore AllergyIntolerance (7.0.2)</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Diagnostic Imaging</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Diagnostic Imaging Reference</td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Facility Information</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Facility Identifier</td>
                    <td>
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-location.html">QICore Location (7.0.2)</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Goals and Preferences</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Care Experience Preference</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-care-experience-preference.html">US Core Care Experience Preference Profile (7.0.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Treatment Intent</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html">US Core Treatment Intervention Preference Profile (7.0.0)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Treatment Intervention Preference</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU7/StructureDefinition-us-core-treatment-intervention-preference.html">US Core Treatment Intervention Preference Profile (7.0.0)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Health Status Assessments</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Alcohol Use</td>
                    <td>
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-simple-observation.html">QICore Simple Observation (7.0.2)</a><br />
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-observation-screening-assessment.html">QICore Observation Screening Assessment (7.0.2)</a><br />
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-condition-problems-health-concerns.html">QICore Condition Problems Health Concerns (7.0.2)</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Physical Activity</td>
                    <td>
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-simple-observation.html">QICore Simple Observation (7.0.2)</a><br />
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-observation-screening-assessment.html">QICore Observation Screening Assessment (7.0.2)</a><br />
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-condition-problems-health-concerns.html">QICore Condition Problems Health Concerns (7.0.2)</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Substance Use</td>
                    <td>
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-simple-observation.html">QICore Simple Observation (7.0.2)</a><br />
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-observation-screening-assessment.html">QICore Observation Screening Assessment (7.0.2)</a><br />
                            <a href="https://hl7.org/fhir/us/qicore/STU7.0.2/StructureDefinition-qicore-condition-problems-health-concerns.html">QICore Condition Problems Health Concerns (7.0.2)</a><br />
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Laboratory</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Specimen Collection Date Time</td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Medical Devices</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Unique Device Identifier (UDI)</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU9/StructureDefinition-us-core-device.html">US Core Device Profile (9.0.0)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Observations</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Advance Directive Observation</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-observation-adi-documentation.html">US Core Observation ADI Documentation Profile (8.0.1)</a><br />
                            <a href="https://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-adi-documentreference.html">US Core ADI DocumentReference Profile (8.0.1)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Provenance</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Author</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-provenance.html">US Core Provenance Profile (8.0.1)</a><br />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Author Role</td>
                    <td>
                    </td>
                    <td>
                            <a href="https://hl7.org/fhir/us/core/STU8.0.1/StructureDefinition-us-core-provenance.html">US Core Provenance Profile (8.0.1)</a><br />
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Nutrition and Diet</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Nutritional Reason</td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>

        <thead>
            <tr>
                <th class="col-sm-4">Orders</th>
                <th class="col-sm-4"></th>
                <th class="col-sm-4"></th>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;•Nutrition Order</td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
        </tbody>
</table>

### Summary List of In-Scope Profiles for Conformance

US Quality Core is derived from QI-Core v6.0.0 and includes inherited copies of all QI-Core profiles, regardless of whether they are applicable to USCDI+ Quality V1. Per the [conformance expectations](general-requirements.html) and the [capability statements](capability-statements.html) in this guide, only US Quality Core profiles that include at least one USCDI+ Quality–flagged element (as defined in [Must Support](must-support.html)) are in scope for conformance and SHALL be supported.

The following profiles include at least one USCDI+ Quality–flagged element and **SHALL** be supported:

<ul>

    <li>
        <a href="StructureDefinition-us-quality-core-adverseevent.html">US Quality Core AdverseEvent</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-allergyintolerance.html">US Quality Core AllergyIntolerance</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-careplan.html">US Quality Core CarePlan</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-careteam.html">US Quality Core CareTeam</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-condition-encounter-diagnosis.html">US Quality Core Condition Encounter Diagnosis</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-condition-problems-health-concerns.html">US Quality Core Condition Problems Health Concerns</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-coverage.html">US Quality Core Coverage</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-devicenotrequested.html">US Quality Core Device Not Requested</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-devicerequest.html">US Quality Core DeviceRequest</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-diagnosticreport-lab.html">US Quality Core DiagnosticReport Profile for Laboratory Results Reporting</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-diagnosticreport-note.html">US Quality Core DiagnosticReport Profile for Report and Note Exchange</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-encounter.html">US Quality Core Encounter</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-familymemberhistory.html">US Quality Core FamilyMemberHistory</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-goal.html">US Quality Core Goal</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-immunization.html">US Quality Core Immunization</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-immunizationnotdone.html">US Quality Core Immunization Not Done</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-observation-lab.html">US Quality Core Laboratory Result Observation</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-location.html">US Quality Core Location</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medication.html">US Quality Core Medication</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationnotrequested.html">US Quality Core Medication Not Requested</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationadministration.html">US Quality Core MedicationAdministration</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationadministrationnotdone.html">US Quality Core MedicationAdministration Not Done</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationdispense.html">US Quality Core MedicationDispense</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationdispensedeclined.html">US Quality Core MedicationDispense Declined</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationrequest.html">US Quality Core MedicationRequest</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-observationcancelled.html">US Quality Core Observation Cancelled</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-observation-clinical-result.html">US Quality Core Observation Clinical Result</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-observation-screening-assessment.html">US Quality Core Observation Screening Assessment</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-organization.html">US Quality Core Organization</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-patient.html">US Quality Core Patient</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-practitioner.html">US Quality Core Practitioner</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-practitionerrole.html">US Quality Core PractitionerRole</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-procedure.html">US Quality Core Procedure</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-procedurenotdone.html">US Quality Core Procedure Not Done</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-relatedperson.html">US Quality Core RelatedPerson</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-servicenotrequested.html">US Quality Core Service Not Requested</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-servicerequest.html">US Quality Core ServiceRequest</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-simple-observation.html">US Quality Core Simple Observation</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-task.html">US Quality Core Task</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-taskrejected.html">US Quality Core Task Rejected</a>
    </li>
</ul>

### Summary List of Out-of-Scope Profiles for Conformance

Some profiles in this guide are inherited from QI-Core v6.0.0 but do not include any USCDI+ Quality–flagged elements (as defined in [Must Support](must-support.html)). These profiles are out-of-scope for USCDI+ Quality V1 conformance but are included to ease adoption for systems that currently support QI-Core v6.0.0.

The following profiles do not include any USCDI+ Quality–flagged elements and **MAY** be supported:

<ul>

    <li>
        <a href="StructureDefinition-us-quality-core-bodystructure.html">US Quality Core BodyStructure</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-claim.html">US Quality Core Claim</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-claimresponse.html">US Quality Core ClaimResponse</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-communication.html">US Quality Core Communication</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-communicationnotdone.html">US Quality Core Communication Not Done</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-communicationrequest.html">US Quality Core CommunicationRequest</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-device.html">US Quality Core Device</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-deviceusestatement.html">US Quality Core DeviceUseStatement</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-flag.html">US Quality Core Flag</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-imagingstudy.html">US Quality Core ImagingStudy</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-immunizationevaluation.html">US Quality Core ImmunizationEvaluation</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-immunizationrecommendation.html">US Quality Core ImmunizationRecommendation</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-medicationstatement.html">US Quality Core MedicationStatement</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-nonpatient-observation.html">US Quality Core NonPatient Observation</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-nutritionorder.html">US Quality Core NutritionOrder</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-questionnaireresponse.html">US Quality Core QuestionnaireResponse</a>
    </li>

    <li>
        <a href="StructureDefinition-us-quality-core-substance.html">US Quality Core Substance</a>
    </li>
</ul>
