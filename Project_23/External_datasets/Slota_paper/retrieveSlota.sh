#!/usr/bin/bash

#This hard-coded command requires the user to access the Broad institute's single cell portal, login and generate and access key. The following key will not work for others as it expires. https://singlecell.broadinstitute.org/single_cell/study/SCP1962/dysregulation-of-neuroprotective-astrocytes-a-spectrum-of-microglial-activation-states-and-altered-hippocampal-neurogenesis-are-revealed-by-single-cell-rna-sequencing-in-prion-disease

curl -k "https://singlecell.broadinstitute.org/single_cell/api/v1/bulk_download/generate_curl_config?accessions=SCP1962&auth_code=VnryYEj9&directory=all&context=study" -o cfg.txt; curl -K cfg.txt && rm cfg.txt

unzip SCP1962/other/raw_mtxs.zip SCP1962/other/
