# UK Road Safety

## Introduction<br>
In recent years, the analysis of car accidents has gained significant attention due to its potential to enhance road safety, inform policy-making, and optimize emergency response strategies. This data analytics project focuses on examining car accident data in the United Kingdom with the aim of uncovering critical insights and trends that can contribute to reducing accident rates and improving road safety for all users.

The data was sourced from [data.gov](https://www.data.gov.uk/dataset/cb7ae6f0-4be6-4935-9277-47e5ce24a11f/road-safety-data) and consists of road accident data from 2018 to 2022 in the UK.

## Datasets<br>
- **Collision:** Provides general information regarding each accident. Includes the column ‘accident_index’ which contains unique values for each accident.
- **Vehicle:** Provides information about the profile of individuals involved in the accident and vehicle details.
- **Casualty:** Provides any information about the profile of people involved in fatal road accidents.

## Objectives<br>
1. **Identify Accident Hotspots:** By mapping accident occurrences across different regions, we aim to pinpoint areas with high accident rates. This spatial analysis will help local authorities prioritize interventions in the most affected areas.
2. **Temporal Patterns:** Analyzing the temporal patterns of accidents, including peak times and seasonal variations, will help in planning preventive measures and allocating resources more effectively.
3. **Demographic Insights:** Understanding the demographics of individuals involved in car accidents, such as age and gender, can provide valuable insights into vulnerable groups and inform targeted safety campaigns.

## Features<br>
- **Data cleaning:** The dataset first underwent thorough cleaning to handle any missing values and provide consistency throughout the dataset.
- **Pre-processing of Geospatial Data in Python:** To enhance performance in Tableau, districts were categorized into regions and geocodes were used to determine regions for rows that contained missing values.
- **Data Export:** Includes creating a database in mySQL and exporting the tables from python to mySQL. This involved building a connection from python to mySQL, specifying table characteristics in mySQL to build a database, and then exporting the cleaned tables to the database.
- **Tableau Visualizations:** Using queries in mySQL, tables with different features and comparisons were created and then exported as a CSV file to tableau for visualization.

## Expected Outcomes<br>
This project aims to deliver actionable insights that can inform policy-makers, road safety authorities, and the general public. By identifying high-risk areas and understanding contributing factors, we hope to contribute to a significant reduction in car accidents and enhance overall road safety in the UK.<br>
Ultimately, this data analytics project seeks to pave the way for a safer driving environment, where data-driven decisions lead to tangible improvements in road safety and the well-being of all road users.

## Libraries & Programs Used
- Python
- Numpy
- sqlalchemy
- Regex
- mySQL
- Tableau
 
