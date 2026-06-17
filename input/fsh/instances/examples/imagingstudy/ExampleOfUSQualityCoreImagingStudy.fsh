Instance: example-of-us-quality-core-imaging-study
InstanceOf: USQualityCoreImagingStudy
Title: "ImagingStudy example"
Description: "Example of ImagingStudy based on CT imaging study"
Usage: #example
* id = "example"
* status = #available
* subject.reference = "Patient/example"
* started = "2011-01-01T11:01:20+03:00"
* numberOfSeries = 1
* numberOfInstances = 1
* series
  * uid = "2.16.124.113543.6003.2588828330.45298.17418.2723805630"
  * number = 3
  * modality = http://dicom.nema.org/resources/ontology/DCM#CT
  * description = "CT Surview 180"
  * numberOfInstances = 1
  * bodySite = $sct#67734004 "Upper Trunk Structure"
