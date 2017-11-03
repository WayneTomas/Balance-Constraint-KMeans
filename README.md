# Balance-Constraint-KMeans
The code for the paper "K-Means Clustering with Balance size Constraint".
The work of IGGI of Jiangsu University,China
## Summary
These are all the source files used in the paper "K-Means Clustering with Balance size Constraint". 
### Description
#### Datasets
Includes Iris,thyroid,wine and one AI datasets called S1
#### Results
Includes the results of single partition experiment and the results of 50 times clustering experiment in real and synthetic data.
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
