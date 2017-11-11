# Balance-Constraint-KMeans
The code for the paper "K-Means Clustering with Balance size Constraint".
The work of IGGI of Jiangsu University,China
## Summary
These are all the source files used in the paper "K-Means Clustering with Balance size Constraint". 
### Description
#### datasets
Includes Iris,thyroid,wine and one AI datasets called S1
#### results
Includes the results of single partition experiment and the results of 50 times clustering experiments in real and synthetic data.
#### evaluation
The codes files using in experiments to evaluate the reuslts of clustering,includes Accuracy(ACC)&Normalized Mutual Information.
Thanks for the related work from http://www.cad.zju.edu.cn/home/dengcai/Data/Clustering.html
Refences:
    Deng Cai, Xiaofei He, and Jiawei Han, "Document Clustering Using Locality Preserving Indexing", in IEEE TKDE, 2005.
    Bibtex source
    Xinlei Chen, Deng Cai, "Large Scale Spectral Clustering with Landmark-Based Representation," AAAI 2011.
    Bibtex source 
#### AssignmentByIntLinPro.m&&BalancedKmeansWithIntLinPro.m
Assign the data points using 0-1 integer programming and the code using 0-1 integer programming to solve the balanced assignment problem
#### balanced_kmeans.m
The code supplied by the author of the paper "Balanced K-Means for Clustering" written by Mikko I.Malinen and Pasi Franti
#### BalancedKmeansWithKbs.m
The implementation of the paper "Data clustering with size constraints"
#### ClusteringRandomDatasets.m&&ClusteringRealDatasets.m&&SinglePartition.m&&Statistic.m&&StatisticClusteringCVRandomDatasets&&StatisticClusteringCVRealDatasets.m
Balance clustering experiments code files
#### getCostMat.m
Get the cost matrix using in munkres algorithm
#### kmeanspp.m
The best version of kmeans++ implementation
#### MicroAssignent.m&&MicroConsKmeans.m
The implementation of the paper "Constrained k-means clustering"
#### munkres.m
The best implementation of munkres algorithm(hungarian algorithm)
#### SizeConsAssignIntLinPro.m&&SizeConsKmeansIntLinPro.m
Assign the data points using 0-1 integer programming to conduct size constraint clustering
#### SizeConsStatistic.m
Size Constraint related experiments
