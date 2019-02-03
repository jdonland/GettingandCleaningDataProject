---
title: "CodeBook"
author: "Jesse Onland"
date: "February 2, 2019"
output: html_document
---

## Datasets

The script in this repository creates a single tidy dataset called TidyData. It contains 180 observations of 20 variables. Each row consists of a unique combination of subject and activity. All combinations are accounted for.

## Variables

subject: this is an integer from 1 to 30 indicating the subject of the experiment who performed the activity.
activity: this is the name of the activity that was performed. There are six different activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.
all other variables: each other variable is the mean of the values obtained from the original Samsung data for that measurement, for that combination of subject and activity.
