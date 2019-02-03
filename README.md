---
title: "README.md"
author: "Jesse Onland"
date: "February 2, 2019"
output: html_document
---


## Getting and Cleaning Data - Project

This repository constitutes part of my submission for the final project of the Coursera course "Getting and Cleaning Data". It contains an R script called run_analysis.R, a codebook called CodeBook.md, and this README file.

## run_analysis.R

The script manipulates the Samsung motion tracking data as specified in the instructions for the project. It assumes that the data are available in the working directory. It reads in the subject, activity, and main ("X") data for both the "train" and "test" datasets, and appends them together to create one complete dataset. It then keeps only the "mean" and "std" variables, and applies the appropriate labels to the activity numbers. Finally, it creates a second dataset called "TidyData" which summarizes the first by taking the mean of each variable for each combination of subject and activity.
