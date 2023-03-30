import pandas as pd
import numpy as np; np.random.seed(0)
import seaborn as sns; sns.set_theme()
import matplotlib.pyplot as plt
import numpy as np

#a = np.random.random((16, 16))
#plt.imshow(a, cmap='hot', interpolation='nearest')
#plt.show()

uniform_data = np.random.rand(10, 12)

#ax = sns.heatmap(uniform_data)

df = pd.read_csv('X.csv')

print(df.to_string())

#sns.heatmap(df, annot = True, cbar = True, cmap = 'plasma')
#plt.tight_layout()

#np.random.seed(0)
#sns.set()
#uniform_data = np.random.rand(10, 12)
#ax = sns.heatmap(uniform_data, vmin=0, vmax=1)
ax = sns.heatmap(df, annot = False, cbar = True, cmap = 'plasma')
plt.show()

df = pd.read_csv('data.csv')
print(df.to_string())
ax = sns.heatmap(df, annot = False, cbar = True, cmap = 'plasma')
plt.show()

df = pd.read_csv('V.csv')
print(df.to_string())
ax = sns.heatmap(df, annot = False, cbar = True, cmap = 'plasma')
plt.show()

df = pd.read_csv('U.csv')
print(df.to_string())
ax = sns.heatmap(df, annot = False, cbar = True, cmap = 'plasma')
plt.show()

df = pd.read_csv('W.csv')
print(df.to_string())
ax = sns.heatmap(df, annot = False, cbar = True, cmap = 'plasma')
plt.show()











