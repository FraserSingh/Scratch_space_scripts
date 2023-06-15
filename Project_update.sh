#!/usr/bin/bash

#updates my scratch space folder to match the this msc8 folder
#To be run on msc8

screen rsync -rlv --delete --exclude={"$USER@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/s2268606/.git","$USER@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/s2268606/.gitignore"} ~/University_Directories/Project_23 $USER@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/s2268606/University_Directories/Project_23
screen rsync -rlv --delete --exclude={"$USER@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/s2268606/.git","$USER@eddie.ecdf.ed.ac.uk:/exports/eddie/scratch/s2268606/.gitignore"} ~/University_Directories/Project_23/Analysis $USER@eddie.ecdf.ed.ac.uk:/exports/cmvm/eddie/eb/groups/mabbott_grp/Fraser/Project_23

