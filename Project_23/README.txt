Summary of the contents in the folder Dissertation_and_scripts
==============================================================

Directories structure
When running the scripts for this dissertation, 1_Leader_script.Rmd will generate the following folder structure:
.
├── Slota
│   ├── Data
│   └── Images
├── Verity
│   ├── Data
│   └── Images
└── Ximerakis
    ├── Data
    └── Images
A directory exists for each dataset, each with a subdirectory for the Images generated by the workflow script for that given dataset.

+--------------------------+------------------------------------------------------------------------------------------------+
| Script name              | Script use                                                                                     |
+==========================+================================================================================================+
| 1_Leader_script.Rmd      | This script is designed to set up the user's directory space with the required files for\      |
|                          | the execution of the single-cell RNA seq analysis workflow used in the comparison\             |
|                          | between the data of Dr.Nick Verity, Methodios Ximerakis & Scott L. Lipnick and Jessy A. Slota. |
|                          |                                                                                                |
|                          | The script will submit several other scripts (seen below) to the Eddie supercomputer\          |
|                          | cluster at the University of Edinburgh, so users should run this script in their 'scratch\     |
|                          | space' whilst in a working node (rather than the welcome nodes that greets the user\           |
|                          | on the supercomputer cluster)                                                                  |
|                          |                                                                                                |
|                          | NB: This script is not fully automated and should be supervised. Additional advice is\         |
|                          | present throughout the document as an explanation of the commands being\                       |
|                          | executed and details of where the files are saved.                                             |
+--------------------------+------------------------------------------------------------------------------------------------+
| i_bamRetrieve.sh         | This script retrieves the bam files for the Ximerakis paper to the appropriate folder\         |
|                          | created in the last stage of the process                                                       |
+--------------------------+------------------------------------------------------------------------------------------------+
| ii_bam_convert.sh        | This script converts the bam files for the Ximerakis paper into fastq files for count\         |
|                          | generation in the next script                                                                  |
+--------------------------+------------------------------------------------------------------------------------------------+
| iii_cellranger_genome.sh | This script creates a reference genome for cellranger counts to use in the next script.        |
|                          |                                                                                                |
|                          | The reference is custom-made to provide up-to-date gene annotations, but without\              |
|                          | overlapping non-poly-A annotations which cause multimapping in cellranger counts\              |
|                          | and read discarding                                                                            |
+--------------------------+------------------------------------------------------------------------------------------------+
| iv_cellranger_counts.sh  | This script generates gene counts for the Ximerakis dataset using the reference\               |
|                          | genome created in the previous script. Last script before the Rmd document                     |
+--------------------------+------------------------------------------------------------------------------------------------+
| v_cellrangerMultiQC.sh   | This script is not required for the processing of data but runs multiqc on the Ximerakis\      |
|                          | reads generated in the previous script. Generates output for broad quality\                    |
| (optional)               | assessment.                                                                                    |
+--------------------------+------------------------------------------------------------------------------------------------+
| 2_XimerakisWorkflow.Rmd  | Processing and analysis of the ageing/Ximerakis dataset.                                       |
+--------------------------+------------------------------------------------------------------------------------------------+
| 3_SlotaWorkflow.Rmd      | Processing and analysis of the terminal/ Slota dataset.                                        |
+--------------------------+------------------------------------------------------------------------------------------------+
| 4_VerityWorkflow.Rmd     | Processing and analysis of the Verity dataset.                                                 |
+--------------------------+------------------------------------------------------------------------------------------------+
| 5_DEG_plot_exporting.Rmd | This optional script generates Venn diagrams for DEG membership comparison. \                  |
|                          | There is also an assortment of code which could be adapted by the user.                        |
+--------------------------+------------------------------------------------------------------------------------------------+
| Slota_samples.txt        | A text file listing the name of the samples to be loaded for the terminal dataset.\            |
|                          | Generated manually to facilitate scripts.                                                      |
+--------------------------+------------------------------------------------------------------------------------------------+
| Ximerakis_modules.yml    | A YAML file which can be used to set up a conda profile for the execution of script\           |
|                          | v_cellrangerMultiQC.sh if desired.                                                             |
+--------------------------+------------------------------------------------------------------------------------------------+
| Ximerakis_ii.yml         | Another YAML file used by the scripts to set up a conda profile.                               |
+--------------------------+------------------------------------------------------------------------------------------------+

