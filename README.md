# README

## Manuscript Repository: Effects of trauma quality improvement programme implementation on mortality

This GitHub repository contains the source code and manuscript files for:

**Title:** *Effects of trauma quality improvement programme implementation on mortality: A nonrandomised controlled trial*
**Corresponding Author:** Johanna Berg, MD ([ORCID](https://orcid.org/0000-0001-7553-7337))

A published pre-print of this manuscript is available via DOI: \[https://doi.org/10.1101/2024.05.27.24307748]

---

## Overview

This study evaluates the effect of implementing a trauma quality improvement (QI) programme using audit filters in four tertiary care hospitals in urban India. The trial used a controlled interrupted time series (ITS) design with a secondary difference-in-differences (DiD) analysis to assess changes in in-hospital and 30-day mortality.

---

## Repository contents

```
├── docs/                        # Manuscript text
├── docs/graphics/               # Figures generated for the paper
├── docs/ref.bib                 # Bibliography file
├── R/                           # Reusable R functions for data processing and modeling
├── data/                        # Publicly shared de-identified dataset (hosted in separate Zenodo repository)
├── bmj.csl                      # Citation style file (BMJ style)
└── README.md                    # This file
```

---

## How to reproduce the manuscript

1. Clone the repository.

2. Download the public dataset and codebook from the data repository and place them in the data/ folder.

3. Install required R packages (listed in `manuscript.Rmd`):

```r
install.packages(c("dplyr", "mgcv", "gtsummary", ...))
```

4. Knit the manuscript

*Note: The public dataset includes all variables needed to reproduce the main analyses. To preserve anonymity, age is grouped into intervals, and the age variable reflects the mean of the group. Minor differences in estimates may occur due to this transformation, particularly in the DiD models and descriptive summaries.*

---

## License

This repository is licensed under the **Creative Commons Attribution 4.0 International (CC BY 4.0)** license. See the `LICENSE` file for details.

---

## Related resources

* [Public anonymised dataset (hosted separately)](https://doi.org/xx.xxxx/zenodo.XXXXXXX) (Available upon publication)
* [ClinicalTrials.gov ID NCT03235388](https://clinicaltrials.gov/study/NCT03235388)

---

## Contact

For questions or inquiries, contact:

**Johanna Berg, MD**
Department of Global Public Health, Karolinska Institutet
Department of Emergency and Internal Medicine, Skåne University Hospital
Email: [johanna.berg@ki.se](mailto:johanna.berg@ki.se)
