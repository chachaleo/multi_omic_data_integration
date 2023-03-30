import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
import numpy as np
import sys

#z_rna, g, k = 1773, 231, 30

script = str(sys.argv[1])

g = 16#sys.argv[2]
z_rna = 5#sys.argv[3]
k = 4
z_prot = z_rna
show = True
short = False

print("SCRIPT " + str(script) + " avec les var :\nz_rna = " + str(z_rna) + "\ng = " + str(g) + "\nk = " + str(k) + "\nShow : " + str(show))

E_matrix = pd.read_csv('../csv/shared.csv')
P_matrix = pd.read_csv('../csv/unshared.csv')
H_matrix =  pd.read_csv('../csv/H.csv')
V_matrix =  pd.read_csv('../csv/V.csv')
U_matrix =  pd.read_csv('../csv/U.csv')
W_matrix =  pd.read_csv('../csv/W.csv')


H_init =  pd.read_csv('../csv/H_init.csv')
V_init =  pd.read_csv('../csv/V_init.csv')
U_init =  pd.read_csv('../csv/U_init.csv')
W_init =  pd.read_csv('../csv/W_init.csv')
df = pd.read_csv('../csv/X.csv')

print(P_matrix.columns)
print(df.dtypes)

col = df.columns[z_rna:(z_rna+g)].append(df.columns[:z_rna].append(df.columns[(z_rna+g+z_prot):].append(P_matrix.columns[z_rna:])))

print(col)

 
############ FULL INIT RNA ####################
fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(36)

parameters = {'axes.labelsize': 40}
plt.rcParams.update(parameters)

X1 = plt.subplot2grid(shape=(4, 7), loc=(0, 0),colspan=2, rowspan=4)
X2 = plt.subplot2grid(shape=(4, 7), loc=(0, 2),colspan=1, rowspan=4)
H = plt.subplot2grid(shape=(4, 7), loc=(0, 3),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 7), loc=(0, 4),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 7), loc=(0, 6),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 7), loc=(2, 4),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 7), loc=(2, 6),colspan=2, rowspan=2)

X1.set_title('E init')
X2.set_title('P inti')
H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

df.columns = col


sns.heatmap(data=H_init.iloc[:,:k], ax=H, cmap = 'plasma')
sns.heatmap(data=V_init.iloc[:,:g], ax=V, cmap = 'plasma')
sns.heatmap(data=U_init.iloc[:,:z_rna], ax=U, cmap = 'plasma')
sns.heatmap(data=W_init.iloc[:,:g], ax=W, cmap = 'plasma')


'''
for col,i in zip(df.columns, range(1,(z_rna + g) + 1)):
	print(col)
	print(str(i + z_rna))
	if(i <= g):
		df.columns = df.columns.str.replace(col, str(i + z_rna))
	else :
		df.columns = df.columns.str.replace(col, str(i - g))
'''
sns.heatmap(data=df.iloc[:,:g], ax=X1, cmap = 'plasma')
sns.heatmap(data=df.iloc[:,g:(g + z_rna)], ax=X2, cmap = 'plasma')

plt.tight_layout()
plt.savefig('img/'+str(script)+'_RNA_INIT_FULL.png')
if(show):
	plt.show()


############ FULL INIT PROTEIN ################
fig = plt.figure()
fig.set_figheight(12)
fig.set_figwidth(36)
 
X1 = plt.subplot2grid(shape=(4, 7), loc=(0, 0),colspan=2, rowspan=4)
X2 = plt.subplot2grid(shape=(4, 7), loc=(0, 2),colspan=1, rowspan=4)
H = plt.subplot2grid(shape=(4, 7), loc=(0, 3),colspan=1, rowspan=4)
V = plt.subplot2grid(shape=(4, 7), loc=(0, 4),colspan=2, rowspan=2)
U = plt.subplot2grid(shape=(4, 7), loc=(0, 6),colspan=2, rowspan=2)
W = plt.subplot2grid(shape=(4, 7), loc=(2, 4),colspan=2, rowspan=2)
zero = plt.subplot2grid(shape=(4, 7), loc=(2, 6),colspan=2, rowspan=2)

sns.heatmap(data=H_init.iloc[:,k:], ax=H, cmap = 'plasma')
sns.heatmap(data=V_init.iloc[:,g:], ax=V, cmap = 'plasma')
sns.heatmap(data=U_init.iloc[:,z_rna:], ax=U, cmap = 'plasma')
sns.heatmap(data=W_init.iloc[:,:g], ax=W, cmap = 'plasma')
sns.heatmap(data=df.iloc[:,(g+z_rna):(2*g+z_rna)], ax=X1, cmap = 'plasma')
sns.heatmap(data=df.iloc[:,(2*g+z_rna):], ax=X2, cmap = 'plasma')

X1.set_title('E init')
X2.set_title('P inti')
H.set_title('H')
V.set_title('V')
U.set_title('U')
W.set_title('W')
zero.set_title('zero')

plt.tight_layout()
plt.savefig('img/'+str(script)+'_PROT_INIT_FULL.png')
if(show):
	plt.show()

if(short):
	assert(0==1)



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
plt.savefig('img/'+str(script)+'_RNA_FULL.png')
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
plt.savefig('img/'+str(script)+'_PROT_FULL.png')
if(show):
	plt.show()



