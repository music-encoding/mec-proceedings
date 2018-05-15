# MEC Proceedings templates and examples

v1.0.0 (MEC2017)

This repository makes available schemata, templates and examples for preparing a submission to the proceedings of the Music Encoding Conference.

## How this repository is organised

### Compiled schema

Compiled, ready-to-use schemata are located in the [schemata](schemata) folder.

### Schema development

The schema is in fact a customization of the MEI schema. Thus the development of the schema is based on ODD. The corresponding ODD file is located in the [source](source) folder.

### Examples

The [examples](examples) folder provides real examples of encoded articles.

### Stylesheets

The [stylesheets](stylesheets) folder provides XSLT files for transforming documents encoded according to the mecProceedings schemata to other formats.

E.g. to HTML using the [stylesheets/mecProceedins.xsl](stylesheets/mecProceedins.xsl). This stylesheet is an XSLT 1.0 stylesheet that can be executed on the fly by any browser. So if your submission references the stylesheet from its preamble (as in the xeample below) and you open the XML file with your browser you will be provided with a HTML version that eases reading.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="mecProceedings.xsl"?>
<confSubmission xmlns="http://www.music-encoding.org/ns/mei" version="0.05"
  xmlns:ex="http://www.music-encoding.org/ns/mei/Examples"
  xmlns:mei="http://www.music-encoding.org/ns/mei">
…
</confSubmission>
```

### Template

A template describing how to author a submission can be found in the [templates](templates) folder.

## License

This code is made available under the terms of [AGPL-3.0](LICENSE)
