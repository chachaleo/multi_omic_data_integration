import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np
import sys

#z_rna, g, k = 1773, 231, 30
z_rna, g, k = 5,25,3
script = str(sys.argv[1])
show = False

print("SCRIPT " + str(script) + " avec les var :\nz_rna = " + str(z_rna) + "\ng = " + str(g) + "\nk = " + str(k) + "\nShow : " + str(show))

E_matrix = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/shared.csv')
P_matrix = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/unshared.csv')
H_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/H.csv')
V_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/V.csv')
U_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/U.csv')
W_matrix =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/W.csv')


H_init =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/H_init.csv')
V_init =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/V_init.csv')
U_init =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/U_init.csv')
W_init =  pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/W_init.csv')

############ INIT DATA RNA #########

fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(27)
 

H = plt.subplot2grid(shape=(4, 4), loc=(0, 0),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 4), loc=(0, 1),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 4), loc=(0, 3),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 4), loc=(2, 1),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 4), loc=(2, 3),colspan=2, rowspan=2)

H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

sns.heatmap(data=H_init.iloc[:,:k], ax=H, cmap = 'plasma')
sns.heatmap(data=V_init.iloc[:,:g], ax=V, cmap = 'plasma')
sns.heatmap(data=U_init.iloc[:,:z_rna], ax=U, cmap = 'plasma')
sns.heatmap(data=W_init.iloc[:,:g], ax=W, cmap = 'plasma')

plt.tight_layout()
plt.savefig(str(script)+'_INIT_RNA.png')
if(show):
	plt.show()

############ INIT DATA PROT ########

fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(27)
 

H = plt.subplot2grid(shape=(4, 4), loc=(0, 0),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 4), loc=(0, 1),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 4), loc=(0, 3),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 4), loc=(2, 1),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 4), loc=(2, 3),colspan=2, rowspan=2)

H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

sns.heatmap(data=H_init.iloc[:,k:], ax=H, cmap = 'plasma')
sns.heatmap(data=V_init.iloc[:,g:], ax=V, cmap = 'plasma')
sns.heatmap(data=U_init.iloc[:,z_rna:], ax=U, cmap = 'plasma')
sns.heatmap(data=W_init.iloc[:,:g], ax=W, cmap = 'plasma')

plt.tight_layout()
plt.savefig(str(script)+'_INIT_PROT.png')
if(show):
	plt.show()
 
############ RNA ####################
fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(27)
 
H = plt.subplot2grid(shape=(4, 4), loc=(0, 0),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 4), loc=(0, 1),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 4), loc=(0, 3),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 4), loc=(2, 1),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 4), loc=(2, 3),colspan=2, rowspan=2)

H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

sns.heatmap(data=H_matrix.iloc[:,:k], ax=H, cmap = 'plasma')
sns.heatmap(data=V_matrix.iloc[:,:g], ax=V, cmap = 'plasma')
sns.heatmap(data=U_matrix.iloc[:,:z_rna], ax=U, cmap = 'plasma')
sns.heatmap(data=W_matrix.iloc[:,:g], ax=W, cmap = 'plasma')

plt.tight_layout()
plt.savefig(str(script)+'_RNA.png')
if(show):
	plt.show()


############ PROTEIN ################
fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(27)
 
H = plt.subplot2grid(shape=(4, 4), loc=(0, 0),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 4), loc=(0, 1),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 4), loc=(0, 3),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 4), loc=(2, 1),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 4), loc=(2, 3),colspan=2, rowspan=2)

sns.heatmap(data=H_matrix.iloc[:,k:], ax=H, cmap = 'plasma')
sns.heatmap(data=V_matrix.iloc[:,g:], ax=V, cmap = 'plasma')
sns.heatmap(data=U_matrix.iloc[:,z_rna:], ax=U, cmap = 'plasma')
sns.heatmap(data=W_matrix.iloc[:,:g], ax=W, cmap = 'plasma')

H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

plt.tight_layout()
plt.savefig(str(script)+'_PROT.png')
if(show):
	plt.show()

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
plt.savefig(str(script)+'_RNA_FULL.png')
if(show):
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
plt.savefig(str(script)+'_PROT_FULL.png')
if(show):
	plt.show()