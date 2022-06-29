#!/bin/bash
#SBATCH --job-name="IQout"
#SBATCH --time=24:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=1   # processor core(s) per node
#SBATCH -c 1
#SBATCH --mem-per-cpu=8G

cd $SLURM_SUBMIT_DIR

date
> gtrees.txt; cat ./iqtree_assessment/array_list.txt | while read line1; do cat ./iqtree_assessment/${line1} >> gtrees.txt; done
> gtrees.tre; cat gtrees.txt | while read line; do cat iqtree_genetree/inference_${line}.treefile >> gtrees.tre; done
date
