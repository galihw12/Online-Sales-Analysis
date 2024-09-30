# Online Sales Analysis Dashboard ✨

## Tools Needed
```
-MySQL for Cleaning Data.
-Visual Studio Code to create a boxplot.
-Pyhton Library such as Pandas, Matplotlib, and Seaborn (can be seen at "requirement for boxplot.txt").
-Tableau for data visualization and creating dashboard.
```
## Steps
```
1. Open MySQL.
2. Import the "Online Sales Data.csv" from "Data" folder to MySQL.
3. Cleaning the data which include:
   1) Checking duplicate.
   2) Checking missng values.
   3) Standardizing data.
   4) Checking for outliers
   Step 1), 2) and 3) was all done using MySQL (details can be seen at "Cleaning Data.sql" inside "Data" folder).
   Step 4) was done by using both Visual Studio Code and MySQL.
   VSCode was used to plot boxplot chart to find any outlier (code can be seen at "boxplot.py" inside "Data" folder).
   After getting the information, any outlier will be checked using MySQL to judge whether it's needed to take action or ignore them.
   After judging, the outliers are ignored (details can be seen at "Checking Outliers.sql" inside "Data" folder).
4. Export the cleaned data to .csv file using MySQL.
   (The cleaned version can be seen at "Cleaned Online Sales Data.csv" inside "Dashboard" folder).
5. Starts Exploratory Data Analysis (EDA) to gain insights and create Dashboard using Tableau.
6. Save the dashboard to Tableau Public. (Tableau file can be seen at "Online Sales Analysis.twbx" inside "Dashboard" folder).
```
## Notes
```
Both the url for the dataset from Kaggle and the uploaded version of dashboard on Tableau Public can be seen at the "url.txt"
```
