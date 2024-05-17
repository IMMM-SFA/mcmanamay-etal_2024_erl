[![DOI](https://zenodo.org/badge/742071824.svg)](https://zenodo.org/doi/10.5281/zenodo.11206382)

# mcmanamay_etal_2024_erl

**Divergent Urban Land Trajectories Under Alternative Population Projections within the Shared Socioeconomic Pathways**

Ryan A. McManamay<sup>1\*</sup>, Alen Raad<sup>1,2</sup>, Chris R. Vernon<sup>3</sup>, Travis Thurber<sup>3</sup>, Jing Gao<sup>4</sup>, Stephen Powers<sup>2</sup>, Brian O'Neill<sup>3</sup>

<sup>1 </sup> Department of Environmental Science, Baylor University, Waco, TX, USA.
<sup>2 </sup> Department of Biology, Baylor University, Waco, TX, USA.
<sup>3 </sup> Pacific Northwest National Laboratory, Richland, WA, USA.
<sup>4 </sup> Department of Geography and Spatial Science, University of Delaware, Newark, DE, USA.

\* corresponding author:  ryan_mcmanamay@baylor.edu

## Abstract
Population change is a main driver behind global environmental change, including urban land use and land cover (LULC) change. In future scenario modeling, assumptions regarding how populations will change locally, despite identical global constraints of Shared Socioeconomic Pathways (SSPs), can have dramatic effects on subsequent regional urbanization. Using a spatial modeling experiment at high resolution (1-km), this study compared how two alternative US population projections, varying in the spatially explicit nature of demographic patterns and migration, affect urban land dynamics simulated by the Spatially Explicit, Long-term, Empirical City development (SELECT) model for SSP2, SSP3, and SSP5. The population projections included: 1) newer downscaled state-specific population (SP) projections inclusive of updated international and domestic migration estimates, and 2) prevailing downscaled national-level projections (NP) agnostic to localized demographic processes. Our work shows that alternative population inputs, even those under the same SSP, can lead to dramatic and complex differences in urban land outcomes. Under the SP projection, less urban land expansion is expected in urban areas and more urban land expansion in rural areas than under the NP projection. This suggests that recent demographic information supports more extreme urban extensification in rural areas in the US than previously anticipated. Urban land outcomes to population inputs were spatially variable where areas in close spatial proximity showed divergent patterns, reflective of the spatially complex urbanization processes that can be accommodated in SELECT. Although different population projections and assumptions led to divergent outcomes, urban land development is not a linear product of population change but the result of complex relationships between population, dynamic urbanization processes, stages of urban development maturity, and feedback mechanisms. These findings highlight the importance of accounting for spatial variations in the population projections, but also urbanization process to accurately project long-term urban land patterns.

## Journal reference
McManamay, R.A., Raad, A., Vernon, C.R., Thurber, T., Gao, J., Powers, S., O'Neill, B. 2024. Divergent Urban Land Trajectories Under Alternative Population Projections within the Shared Socioeconomic Pathways, Environmental Research Letters. DOI: 10.1088/1748-9326/ad2eec

## Data reference

### Input data

Jones, B., and B. C. O'Neill. 2020. Global One-Eighth Degree Population Base Year and Projection Grids Based on the Shared Socioeconomic Pathways, Revision 01. Palisades, New York: NASA Socioeconomic Data and Applications Center (SEDAC). https://doi.org/10.7927/m30p-j498.

Zoraghein, H., & O'Neill, B. (2020). Data Supplement: U.S. state-level projections of the spatial distribution of population consistent with Shared Socioeconomic Pathways. (v0.1.0) [Data set]. Zenodo. https://doi.org/10.5281/zenodo.3756179

### Output data

McManamay, R., Thurber, T., Vernon, C. R., O'Neill, B. C., & Gao, J. (2022). IM3 SELECT Urbanization Data (v1.0.0) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/1887521

McManamay, R., Vernon, C., Thurber, T., Gao, J., & O'Neill, B. (2024). Data for "Divergent urban land trajectories under alternative population projections within the shared socioeconomic pathways" (Version v1) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2318472

## Contributing modeling software
| Model | Version | Repository Link | DOI |
|-------|---------|-----------------|-----|
| Spatially-Explicit, Long-term, Empirical City developmenT (SELECT) | v1.0.0 | https://github.com/IMMM-SFA/select | https://doi.org/10.5281/zenodo.7083151 |
| R | v4.2.1 | https://cran.r-project.org/bin/windows/base/old/4.2.1/ | |

## Reproduce my experiment

1. Install the software components required to conduct the experiment from [Contributing modeling software](#contributing-modeling-software)
2. Download and install the supporting input data required to conduct the experiement from [Input data](#input-data)
3. Run the following scripts in the `workflow` directory to re-create this experiment. These scripts create the figures in this publication:

| Script Name | Description | How to Run |
| --- | --- | --- |
| `Original_UpdatedPop_1km_comp_V2.R` | Script to run the main part of the experiment to compare urban fraction between default and original population in urban and rural areas  | `R-4.2.1 Original_UpdatedPop_1km_comp_V2.R` |
| `Population_comparison_v2.R` | Script to import population and calculate and plot population delta. Creates a figure. | `R-4.2.1 Population_comparison_v2.R` |
| `PopDelta_ULD_comparison_v2.R` | Script to compare population delta and urban land delta. Creates a figure. | `R-4.2.1 PopDelta_ULD_comparison_v2.R` |
| `Cluster_code_v2.R` | Script to cluster urban areas and rural areas by changes in urban land delta and visualize patterns. Creates a figure. | `R-4.2.1 Cluster_code_v2.R`|
| `Cities_case_studies_code_v2.R` | Script to compare and visualize patterns in different cities. Creates a figure. | `R-4.2.1 Cities_case_studies_code_v2.R`|

4. Compare the outputs by downloading and unziping the output data from my experiment [Output data](#output-data).
