import pandas as pd
import seaborn as sns
import numpy as np

import matplotlib
import matplotlib.pyplot as plt

plt.style.use("ggplot")
from matplotlib.pyplot import figure

%matplotlib inline
matplotlib.rcParams["figure.figsize"]=(12,8)

#Reading data
df=pd.read_csv("D:\Personal\lovei\project\movies.csv")

#To check null values
df.isnull().sum()

for col in df.columns:
    pct_missing = np.mean(df[col].isnull())
    print('{} - {}%'.format(col, pct_missing))

#Data types of the df
df.dtypes

#Change of dtype of column
df['budget'] = df['budget'].astype(float).fillna(0).astype(int)
df['budget']= df['budget'].astype('int64')
df['gross'] = df['gross'].astype(float).fillna(0).astype(int)
df['gross']=df['gross'].astype('int64')

#create a new column
df['year_cor']=df['released'].astype(str).str[:4]

#order the df
df.sort_values(by=['gross'],inplace=False, ascending=False)

#drop duplicates
df['company'].drop_duplicates().sort_values(ascending=False)

#Scatter plot
plt.scatter(x=df['budget'],y=df['gross'])
plt.title('Budget VS Gross Earning')
plt.xlabel('Budget')
plt.ylabel('Gross')
plt.show()

# plot budget vs gross using sns

sns.regplot(x='budget',y='gross',data=df, scatter_kws={'color':'red'},line_kws={'color':'blue'})

#correlation
df_numeric = df.select_dtypes(include=[np.number])
correlation_matrix = df_numeric.corr()
print(correlation_matrix)

sns.heatmap(correlation_matrix,annot=True)
plt.title("Correlation Matrix for Numeric Features")
plt.xlabel("Movie Feature")
plt.ylabel("Movie Feature")
plt.show()

#Lets see now company column
df_numerized=df

for col_name in df_numerized.columns:
    if(df_numerized[col_name].dtype == 'object'):
        df_numerized[col_name] = df_numerized[col_name].astype('category')
        df_numerized[col_name] = df_numerized[col_name].cat.codes

df_numerized


correlation_matrix= df_numerized.corr(method='pearson')
                                      
sns.heatmap(correlation_matrix,annot=True)
plt.title("Correlation Matrix for Numeric Features")
plt.xlabel("Movie Feature")
plt.ylabel("Movie Feature")
plt.show()

correlation_mat=df_numerized.corr()
corr_pairs=correlation_mat.unstack()
corr_pairs

sorted_pair=corr_pairs.sort_values()
sorted_pair

#Highest Correlation:
#released vs. year_cor: 0.993694
#Lowest Correlation:
#votes vs. gross: 0.573889
