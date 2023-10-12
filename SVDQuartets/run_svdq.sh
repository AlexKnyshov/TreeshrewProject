#!/bin/bash
#SBATCH --job-name="svdq"
#SBATCH --time=96:00:00  # walltime limit (HH:MM:SS)
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks-per-node=1   # processor core(s) per node
#SBATCH -c 36

cd $SLURM_SUBMIT_DIR

# date

# echo "
# svdq bootstrap nreps=1000 nthreads=36;
# saveTrees file=test.tre;
# quit;
# " | /home/aknyshov/alex_data/andromeda_tools/paup4a168_centos64 alignment_bi.nex -L alignmentBiLog.log

# date

module load PAUP/4.0a168-centos64


nBoot=1000
nCpus=36

date

#tonexus format=RelPHYLIP fromfile=${alignmentFile} tofile=${alignmentFile}.svdq.nex interleaved=yes replace=yes;
#exe ${alignmentFile}.svdq.nex;
##svdq bootstrap nreps=${nBoot} nthreads=${nCpus};

for s in TSHiOUT TSHcOUT TSHiNONOUT TSHcNONOUT TSHi
do
        alignmentFile="COMBINED_locnames"${s}".txt.nex"
        logFile="svdqScores"${s}".log"
        treeFile="svdqScores"${s}".tre"


        echo "
        log file=${logFile};
        exe ${alignmentFile};
        svdq showScores=yes bootstrap=no nthreads=${nCpus};
        saveTrees file=${treeFile};
        quit;
        " | paup

        date
done
