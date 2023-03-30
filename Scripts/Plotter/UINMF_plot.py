import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np

#z_rna, g, k = 1773, 231, 30
z_rna, g, k = 5, 25, 3

E_matrix = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/shared.csv')
P_matrix = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/unshared.csv')
H_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/H.csv')
V_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/V.csv')
U_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/U.csv')
W_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/W.csv')
 
############ RNA ####################
fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(36)
 
E = plt.subplot2grid(shape=(4, 7), loc=(0, 0),colspan=2, rowspan=4)
P = plt.subplot2grid(shape=(4, 7), loc=(0, 2),colspan=1, rowspan=4)
H = plt.subplot2grid(shape=(4, 7), loc=(0, 3),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 7), loc=(0, 4),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 7), loc=(0, 6),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 7), loc=(2, 4),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 7), loc=(2, 6),colspan=2, rowspan=2)

E.set_title('E')
P.set_title('P')
H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

sns.heatmap(data=E_matrix.iloc[:,:g], ax=E, cmap = 'plasma')
sns.heatmap(data=P_matrix.iloc[:,:z_rna], ax=P, cmap = 'plasma')
sns.heatmap(data=H_matrix.iloc[:,:k], ax=H, cmap = 'plasma')
sns.heatmap(data=V_matrix.iloc[:,:g], ax=V, cmap = 'plasma')
sns.heatmap(data=U_matrix.iloc[:,:z_rna], ax=U, cmap = 'plasma')
sns.heatmap(data=W_matrix.iloc[:,:g], ax=W, cmap = 'plasma')

plt.tight_layout()
plt.show()


############ PROTEIN ################
fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(36)
 
E = plt.subplot2grid(shape=(4, 7), loc=(0, 0),colspan=2, rowspan=4)
P = plt.subplot2grid(shape=(4, 7), loc=(0, 2),colspan=1, rowspan=4)
H = plt.subplot2grid(shape=(4, 7), loc=(0, 3),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 7), loc=(0, 4),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 7), loc=(0, 6),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 7), loc=(2, 4),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 7), loc=(2, 6),colspan=2, rowspan=2)

sns.heatmap(data=E_matrix.iloc[:,g:], ax=E, cmap = 'plasma')
sns.heatmap(data=P_matrix.iloc[:,z_rna:], ax=P, cmap = 'plasma')
sns.heatmap(data=H_matrix.iloc[:,k:], ax=H, cmap = 'plasma')
sns.heatmap(data=V_matrix.iloc[:,g:], ax=V, cmap = 'plasma')
sns.heatmap(data=U_matrix.iloc[:,z_rna:], ax=U, cmap = 'plasma')
sns.heatmap(data=W_matrix.iloc[:,:g], ax=W, cmap = 'plasma')

E.set_title('E')
P.set_title('P')
H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

plt.tight_layout()
plt.show()