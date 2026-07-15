#!/bin/bash
#SBATCH --job-name=task2_run_all
#SBATCH --partition=gentzkow
#SBATCH --time=00:30:00
#SBATCH --mem=4G
#SBATCH --cpus-per-task=1
#SBATCH --output=slurm-%j.out
#SBATCH --error=slurm-%j.err

set -e

# Start from a clean module environment
module purge

# Load software required by the repository
module load devel python/3.12.1
module load texlive/2019

# Activate the Python virtual environment
source "$HOME/venvs/task1/bin/activate"

# Run from the repository root
cd /oak/stanford/groups/gentzkow/xuhan/Task1_Xu

echo "Job started on $(hostname) at $(date)"
echo "Working directory: $(pwd)"
echo "Python: $(which python3)"
python3 --version
echo "Latexmk: $(which latexmk)"

./run_all.sh

echo "Job completed at $(date)"
