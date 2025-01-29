# Data_Exploration

This repository contains two main folders: `project` and `tasks`. Each folder includes Jupyter notebooks and supporting materials for data analysis and machine learning projects.

## Project Folder

The `project` folder contains a Jupyter notebook and a PDF document detailing the analysis of economic and sociological data from the World Bank. The study focuses on clustering similar countries using hierarchical clustering and k-means clustering methods. The resulting groups were further analyzed using the happiness index to test the hypothesis that people in similar countries tend to have similar levels of happiness.

**Project Summary**
- Changed available data to be dynamic instead of static to focus on growth of countries instead of their raw values
- Applied **hierarchical clustering** and **k-means clustering** to group countries based on their economic and social indicators.
- Analyzed the resulting clusters using the **happiness index** to test the hypothesis that people in similar countries tend to have comparable happiness levels.
- Provided insights into potential relationships between economic factors and overall well-being.


## Tasks Folder

The `tasks` folder includes three Jupyter notebooks, each covering different data analysis and machine learning techniques:

1. **PCA Analysis on New York Times and 04Cars Datasets**
   - Principal Component Analysis (PCA) is applied to the datasets.
   - Analysis of absolute and relative variance as a function of the principal component index.
   - Visualization of feature vectors projected onto the first 2 or 3 principal components.

2. **Decision Trees and k-NN Classification on Titanic Dataset**
   - Hands-on practice with decision tree classifiers and k-nearest neighbors (k-NN) classifier.
   - Understanding key concepts such as nearest neighbor, pruning, and cross-validation.
   - Exploratory data analysis (EDA).
   - Model selection is carried out, including the optimization of decision tree depth.

3. **COVID-19 Hospital Occupancy Analysis in Poland and Norway (MATLAB)**
- Extracted **Daily Hospital Occupancy** data for Poland and Norway from 2022.
- Calculated and analyzed:
  - **Mean and standard deviation** of hospital occupancy.
  - **Absolute, relative, and logarithmic growth rates**.
- Estimated **linear trends** for both countries and compared error metrics.
- Applied **moving average smoothing** with different window sizes (`k=5`, `k=22`), determining optimal smoothing parameters.
- Modeled the last 100 observations using **polynomial regression (degree 1, 2, 3)** and identified the best-fitting approach.
