#!/bin/bash

#PBS -N ukb_pheno
#PBS -S /bin/bash
#PBS -l walltime=01:00:00
#PBS -l mem=2gb
#PBS -o $HOME/pheno.out
#PBS -e $HOME/pheno.err

SCRIPT_PATH="uchicago-ukb/extract_pheno.py"
OUT_DIR="/gpfs/data/ukb-share/dahl/jerome/extracted_phenotypes"
rows=50000


python3 $SCRIPT_PATH 22006-0.0 22021-0.0 22009-0.1 22009-0.2 22009-0.3 22009-0.4 22009-0.5 22009-0.6 22009-0.7 22009-0.8 22009-0.9 22009-0.10 22009-0.11 22009-0.12 22009-0.13 22009-0.14 22009-0.15 22009-0.16 22009-0.17 22009-0.18 22009-0.19 22009-0.20 22009-0.21 22009-0.22 22009-0.23 22009-0.24 22009-0.25 22009-0.26 22009-0.27 22009-0.28 22009-0.29 22009-0.30 22009-0.31 22009-0.32 22009-0.33 22009-0.34 22009-0.35 22009-0.36 22009-0.37 22009-0.38 22009-0.39 22009-0.40 -n poplevel -r $rows -t $OUT_DIR
python3 $SCRIPT_PATH 22000 22007 22008 22001 22027 22003 22004 22005 -n QC -c -r $rows -t $OUT_DIR

# phenotypes
python3 $SCRIPT_PATH 50 -n height -c -r $rows -t $OUT_DIR

python3 $SCRIPT_PATH 21001 -n BMI -c -r $rows -t $OUT_DIR

python3 $SCRIPT_PATH 26414 -n eduscore_eng -c -r $rows -t $OUT_DIR

python3 $SCRIPT_PATH 30760 -n HDL -c -r $rows -t $OUT_DIR

python3 $SCRIPT_PATH 30780 -n LDL -c -r $rows -t $OUT_DIR

# white british membership
python3 $SCRIPT_PATH 22006-0.0 -n white_british -r $rows -t $OUT_DIR

# covariates: sex, age (yob), PC (1-40)
python3 $SCRIPT_PATH 31-0.0 34-0.0 22009-0.1 22009-0.2 22009-0.3 22009-0.4 22009-0.5 22009-0.6 22009-0.7 22009-0.8 22009-0.9 22009-0.10 22009-0.11 22009-0.12 22009-0.13 22009-0.14 22009-0.15 22009-0.16 22009-0.17 22009-0.18 22009-0.19 22009-0.20 22009-0.21 22009-0.22 22009-0.23 22009-0.24 22009-0.25 22009-0.26 22009-0.27 22009-0.28 22009-0.29 22009-0.30 22009-0.31 22009-0.32 22009-0.33 22009-0.34 22009-0.35 22009-0.36 22009-0.37 22009-0.38 22009-0.39 22009-0.40 -n covariates_sa40PC -r $rows -t $OUT_DIR

# covariates: sex, age (yob), batch, PC (1-40)
python3 $SCRIPT_PATH 31-0.0 34-0.0 22000-0.0 22009-0.1 22009-0.2 22009-0.3 22009-0.4 22009-0.5 22009-0.6 22009-0.7 22009-0.8 22009-0.9 22009-0.10 22009-0.11 22009-0.12 22009-0.13 22009-0.14 22009-0.15 22009-0.16 22009-0.17 22009-0.18 22009-0.19 22009-0.20 22009-0.21 22009-0.22 22009-0.23 22009-0.24 22009-0.25 22009-0.26 22009-0.27 22009-0.28 22009-0.29 22009-0.30 22009-0.31 22009-0.32 22009-0.33 22009-0.34 22009-0.35 22009-0.36 22009-0.37 22009-0.38 22009-0.39 22009-0.40 -n covariates_sab40PC -r $rows -t $OUT_DIR
