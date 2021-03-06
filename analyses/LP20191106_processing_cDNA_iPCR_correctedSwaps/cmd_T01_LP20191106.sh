DRYRUN=""
# DRYRUN="--dryrun "

DATETAG="LP$( date +"%Y%m%d_%H%M" )"
SNAKEFILE=../../code/pipeline/SuRE-snakemake
CONFIG=config-Dm12_T01_LP20191106.yml
LOG="${CONFIG%.yml}_run-${DATETAG}.log"
NCORES=15
RAM=100
TARGET="bedpe_merged_smpls"
TARGET="merged_ipcr_cdna"
TARGET="reversed_liftover"
TARGET="sorted_cnt_tbls"
TARGET="trim_iPCR"
TARGET="split_bam"
TARGET="bedpe"
TARGET="bedpe_BC"
TARGET="sorted_cnt_tbls"

CMD="/usr/bin/time -v nice -19 snakemake ${DRYRUN}-prs ${SNAKEFILE} --use-conda --resources ram=${RAM} --configfile ${CONFIG} --cores $NCORES ${TARGET} &> ${LOG}"
echo "${CMD}"
eval ${CMD}


