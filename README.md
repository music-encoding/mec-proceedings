# MEC Proceedings templates and examples

v1.0.0 (MEC2017)

This repository makes available schemata, templates and examples for preparing a submission to the proceedings of the Music Encoding Conference.

## Usage

The template ([mecProceedings_template.xml](mecProceedings_template.xml)) gives a heads up description of how to encode and format certain aspects of a submission in the custom XML format.

The examples are encodings of ‚real‘ conference papers in order to add a more tangible layer to the way of encoding.

The best way to start your own submission is to download this repository and then edit the template file. Please take care to keep everything concerned to your submission in the same folder, including the schema ([mecProceedings_schema.rng](mecProceedings_schema.rng)) and the XSLT ([mecProceedings.xsl](mecProceedings.xsl)). Both theses files are already associated with the template and the examples. The schema allows for assistance, content completion, and validation in an XML editor. The XSLT on the other hand allows for an eye-friendly preview of the files in a web-browser, by simply opening the respective XML file in any modern browser.

## Schema

The Schema is being developed in the ODD (One Document Does it all) schema metalanguage developed by the Text Encoding Initiative (TEI).

## License

This code is made available under the terms of 
[AGPL-3.0](LICENSE)
