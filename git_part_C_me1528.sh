#!/bin/bash

#initializing the git repository 
git init

#add the files into git repository 
git add tetrahymena.tsv
git add tetrahymena_part_A_me1528.R
git add tetrahymena_part_A_me1528.py

#creates a commit after adding the base files 
git commit -m "Initial commit for Final"

#create a repository named "Final at github.com" globally 
git remote add origin https://github.com/melzaky522/Final.git

#pushing the local comitted version into the global repository 
git push -u origin master

#creating a commit after finalizing the code 
git commit -m "Coding is completed"


#pushing the local comitted version into the global repository 
git push origin master

#creating a commit after commenting both codes, R and python
git commit -m "END_TERM_EXAM_2017"

#pushing the local comitted version into the global repository 
git push origin master
