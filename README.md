# MetCap probes

This repo contains information related to the trials of probe generation with sequences that I recieved from [Henri][henri.siljanen@uef.fi] using the [MetCap][https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-015-0501-8] pipeline  

## Overview

```
project
|- code/               all code needed to go from input files to final results
|
|- data/               raw and primary data, essentially all input files, never edit!
|                      (ignored with .gitignore)
|
|- doc/                documentation for and related to the study
|
|- results/            output from workflows and analyses
|  |- Stats/           project specific statistical analysis documents (usually *qmd/*html)
|                      (partially ignored with .gitignore)
|
|- scratch/            temporary files that can be safely deleted or lost
|                      (ignored with .gitignore)
|
|- .gitignore          sets which parts of the repository that should be git tracked
```
