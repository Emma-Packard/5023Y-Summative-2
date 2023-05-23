# 🦗 Spring Assignment BIO 5023Y

## 🧠 Brief introduction

This is a summative assignment for the module BIO 5023Y - also called Data science for biologists. This solo assignment was completed during the second year of my BSC in Biological Sciences at the University of East Anglia. This report is based off a data set that studied the cost of singing in the decorated cricket (Gryllodes sigillatus); see below for more information

## 📜Scripts 

-   cleaning_01 **→** importing data, data wrangling, renaming data varibles to meaningful names

-   vis_02 **→** lots of data visualisation

-   lm_03 **→** making the linear model

## 💻Software

This project was completed using R version 4.2.3, using the cloud-based website posit-cloud

Packages needed -

-   tidyverse **→** a range of helpful packages, including ggplot2 etc...

-   janitor **→** helps to format the data

-   kableExtra **→** makes nice tables

-   scales **→** scales p values

-   patchwork **→** allows plots to be put together in the same plot

-   ggridges **→** extra density plots

## 👩‍💻Project description

This is a solo project assignment for module BIO 5023Y - Data Science for Biologists. This assignment requires data cleaning, exploratory analysis, data visualisation & statistical model building and inference.

The decorated cricket data is a csv-formatted data set this report will test the relationship between, among other things, condition, resource availability (food quality) and sexual signalling (calling song) in the decorated cricket (change later).

The tasklist for this assignment includes:

-   Analyse one dataset contained within this repository (cricket_song.csv - used)
-   Use Markdown to write a formal lab report: hand the output in separately through Blackboard
-   Include all required Rscripts and Rmd files needed to fully reproduce your report here
-   Submit this repo to the GitHub Classroom by the assignment deadline

## 📈Data

The data surrounds multiple variables that can be a proxy for the cost of the decorated cricket mating call.

reference link ---\>

| Variable         | Definition                                                                                                 |
|--------------|----------------------------------------------------------|
| Change_in_weight | Change in weight(g)                                                                                        |
| Diet             | Percentage nutritional content of the food the animal was fed                                              |
| Song_week        | The total amount of time the cricket spent singing in the first week of the experiment                     |
| starting_mass    | Mass(g) at start of experiment                                                                             |
| Pronotum         | Size(mm) The pronotum is a prominent plate that covers the thorax and can be used as a proxy for body size |
