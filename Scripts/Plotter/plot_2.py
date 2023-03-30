import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd
sns.set()

script = "S06"

z_rna, g, k = 1773, 231, 30

fig, axes = plt.subplots(2, 2)

df_sh = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/shared.csv')
df_un = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/unshared.csv')

#print(lenght(df_sh.iloc))
'''
print(df_sh.columns)
for col,i in zip(df_sh.columns, range(1,51)):
	df_sh.columns = df_sh.columns.str.replace(col, str(i%26 + 5))

for col,i in zip(df_un.columns, range(1, 11)):
	if(i <= 5):
		df_un.columns = df_un.columns.str.replace(col, str(i))
	else :
		df_un.columns = df_un.columns.str.replace(col, str(i%6 + 30))
print(df_sh.columns)
'''
len(df_sh.columns)
len(df_un.columns)
#create boxplot in each subplot, x="cells", y="genes"
sns.heatmap(data=df_sh.iloc[:,:g], ax=axes[0,1], cmap = 'plasma')
sns.heatmap(data=df_sh.iloc[:,g:], ax=axes[1,1], cmap = 'plasma')

sns.heatmap(data=df_un.iloc[:,:z_rna], ax=axes[0,0], cmap = 'plasma')
sns.heatmap(data=df_un.iloc[:,z_rna:], ax=axes[1,0], cmap = 'plasma')

fig = plt.figure()

ax1 = plt.subplot2grid((4, 4), (0, 0),rowspan = 2)
ax2 = plt.subplot2grid((4, 4), (0, 1),rowspan = 2, colspan=4)
ax3 = plt.subplot2grid((4, 4), (2, 0),rowspan = 2)
ax4 = plt.subplot2grid((4, 4), (2, 1),rowspan = 2, colspan=4)
fig.tight_layout()



ax1.set_xlabel('genes', fontsize=12)
ax1.set_ylabel('cells', fontsize=12)
ax1.set_title('RNA unshared', fontsize=12)

ax2.set_xlabel('genes', fontsize=12)
ax2.set_ylabel('cells', fontsize=12)
ax2.set_title('RNA shared', fontsize=12)

ax3.set_xlabel('genes', fontsize=12)
ax3.set_ylabel('cells', fontsize=12)
ax3.set_title('Protein unshared', fontsize=12)

ax4.set_xlabel('genes', fontsize=12)
ax4.set_ylabel('cells', fontsize=12)
ax4.set_title('Protein shared', fontsize=12)


sns.heatmap(data=df_sh.iloc[:,:25], ax=ax2, cmap = 'plasma')
sns.heatmap(data=df_sh.iloc[:,25:], ax=ax4, cmap = 'plasma')

sns.heatmap(data=df_un.iloc[:,:5], ax=ax1, cmap = 'plasma')
sns.heatmap(data=df_un.iloc[:,5:], ax=ax3, cmap = 'plasma')



plt.show()

fig, axes = plt.subplots(1, 2)


axes[0].set_xlabel('factor k', fontsize=12)
axes[0].set_ylabel('cells', fontsize=12)
axes[0].set_title('H RNA', fontsize=12)

axes[1].set_xlabel('factor k', fontsize=12)
axes[1].set_ylabel('cells', fontsize=12)
axes[1].set_title('H Protein', fontsize=12)


df = pd.read_csv('data.csv')
sns.heatmap(data=df.iloc[:,:k], ax=axes[0], cmap = 'plasma')
sns.heatmap(data=df.iloc[:,k:], ax=axes[1], cmap = 'plasma')

plt.show()
#plt.savefig("H_" + str(script)+'.png')


vmin, vmax = 0, 200



df = pd.read_csv('/home/charlotte/Desktop/Memoire/Scripts/csv/X.csv')
fig = plt.figure()

ax1 = plt.subplot2grid((4, 4), (0, 0),rowspan = 2)
ax2 = plt.subplot2grid((4, 4), (0, 1),rowspan = 2, colspan=4)
ax3 = plt.subplot2grid((4, 4), (2, 0),rowspan = 2)
ax4 = plt.subplot2grid((4, 4), (2, 1),rowspan = 2, colspan=4)
fig.tight_layout()



ax1.set_xlabel('genes', fontsize=12)
ax1.set_ylabel('cells', fontsize=12)
ax1.set_title('RNA unshared', fontsize=12)

ax2.set_xlabel('genes', fontsize=12)
ax2.set_ylabel('cells', fontsize=12)
ax2.set_title('RNA shared', fontsize=12)

ax3.set_xlabel('genes', fontsize=12)
ax3.set_ylabel('cells', fontsize=12)
ax3.set_title('Protein unshared', fontsize=12)

ax4.set_xlabel('genes', fontsize=12)
ax4.set_ylabel('cells', fontsize=12)
ax4.set_title('Protein shared', fontsize=12)


#print(df.columns)
#for col,i in zip(df.columns, range(1,61)):
#	if(i <= 30):
#		df.columns = df.columns.str.replace(col, str(i))
#	else :
#		df.columns = df.columns.str.replace(col, str(i%30))



sns.heatmap(data=df.iloc[:,g:(g+z_rna)], ax=ax2, cmap = 'plasma')#, vmin = vmin, vmax = vmax)
sns.heatmap(data=df.iloc[:,(g+z_rna):(2*g+z_rna)], ax=ax4, cmap = 'plasma')#,vmin = vmin, vmax = vmax)

sns.heatmap(data=df.iloc[:,:g], ax=ax1, cmap = 'plasma')#,vmin = vmin, vmax = vmax, cbar = False)
sns.heatmap(data=df.iloc[:,(2*g+z_rna):], ax=ax3, cmap = 'plasma')#,vmin = vmin, vmax = vmax, cbar = False)


plt.show()




#fig, axes = plt.subplots(2, 2)
#create boxplot in each subplot, x="cells", y="genes"
#sns.heatmap(data=df.iloc[:,5:30], ax=axes[0,1], cmap = 'plasma', vmin = vmin, vmax = vmax)
#sns.heatmap(data=df.iloc[:,30:55], ax=axes[1,1], cmap = 'plasma',vmin = vmin, vmax = vmax)

#sns.heatmap(data=df.iloc[:,:5], ax=axes[0,0], cmap = 'plasma',vmin = vmin, vmax = vmax, cbar = False)
#sns.heatmap(data=df.iloc[:,55:], ax=axes[1,0], cmap = 'plasma',vmin = vmin, vmax = vmax, cbar = False)
