import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv(r"C:\Users\galih\Documents\Data Analist Project\SQL+Tableau\Data\Cleaned Online Sales Data.csv")

fig,ax=plt.subplots(figsize=(15,7))
sns.boxplot(data=df[['Units_Sold']])
ax.set_title('Units_Sold')
print(plt.show())

fig,ax=plt.subplots(figsize=(15,7))
sns.boxplot(data=df[['Unit_Price']])
ax.set_title('Unit_Price')
print(plt.show())

def out_by_IQR(column):
    Q1 = column.quantile(0.25)
    Q3 = column.quantile(0.75)
    IQR = Q3 - Q1
    
    # Define the bounds for outliers
    lower_bound = Q1 - 1.5 * IQR
    upper_bound = Q3 + 1.5 * IQR
    
    # Return the outliers
    return column[(column < lower_bound) | (column > upper_bound)]

outliers = out_by_IQR(df['Units_Sold']).sort_values()
print(f"outlier kolom Units_Sold: {outliers.values}")

outliers = out_by_IQR(df['Unit_Price']).sort_values()
print(f"outlier kolom Units_Sold: {outliers.values}")