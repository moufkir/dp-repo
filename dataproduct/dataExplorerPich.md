Data Explorer Pitch
========================================================
author: Mohammed Ait-Oufkir
date: 2018-09-14
autosize: true

Data Explorer Pitch
========================================================

To access the application please visit <https://moufkir.shinyapps.io/DeApp/>.

`Data Set Explorer Tool` Is a simple tool that allows users to explore relationship between features of a dataset.

The dataset given are standrad data sets that come with R packages.
for this version 1.0 only the following data sets are available:

 - mtcars
 - iris
 - ToothGrowth
 - USArrests

 The tool can be enhanced to upload new datasets and make different type of graphs.


Usage
========================================================

The Tool is divided into 2 sections :

* An input area (where user can choose the data set) and the features to plot.
  - Once the features are selected and **are different** a plot button is displayed allowing the user to see the graph of the data.


* The output area displays a scatter plot using plotly library.
  - user can hover the data points.


Advantages
========================================================

The tool allows users to anlayze data, by only selecting the features of interest, no need to type the code for each analysis.
The result is then shown in a graph as in the example below

![plot of chunk unnamed-chunk-1](dataExplorerPich-figure/unnamed-chunk-1-1.png)


Conclusion
========================================================
The goal of this application is to show the power of shiny apps to make interactive data exploration.
The application maybe enhanced to take any type of dataset and to make available different types of graphs.

Thank You!
