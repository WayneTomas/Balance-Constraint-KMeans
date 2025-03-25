# [Optimizing MSE for Clustering with Balanced Size Constraints](https://www.mdpi.com/2073-8994/11/3/338)

<!-- <p align="center" width="100%">
<img src="ISEKAI_overview.png"  width="80%" height="80%">
</p> -->

<div>
<div align="center">
    <a href='https://github.com/WayneTomas' target='_blank'>Wei Tang<sup>*,1</sup></a>&emsp;
    <a href='https://ujsyyoung.github.io/homepage/' target='_blank'>Yang Yang<sup>&#x2709</sup><sup>1</sup></a>&emsp;
    <a href='https://cs.ujs.edu.cn/info/2308/35567.htm' target='_blank'>Lanling Zeng<sup>1</sup></a>&emsp;
    <a href='https://cs.ujs.edu.cn/info/1349/7372.htm' target='_blank'>Yongzhao Zhan<sup>1</sup></a>&emsp;
</div>
<div>
<div align="center">
    <sup>1</sup>Jiangsu University;
    </br>
    <sup>&#x2709</sup> Corresponding Author
    
</div>
 
 -----------------

![](https://black.readthedocs.io/en/stable/_static/license.svg)

## Updates
- **6 mar, 2019**: :boom::boom:  Our paper "Optimizing MSE for Clustering with Balanced Size Constraints" has been accepted by MDPI Symmetry.
- **3 june, 2019**: :boom::boom:  The codes have been released.

---
This repository contains the **official implementation** the following paper:

> **Optimizing MSE for Clustering with Balanced Size Constraints**<br>
> 
>
> **Abstract:** *Clustering is to group data so that the observations in the same group are more similar to each other than to those in other groups. k-means is a popular clustering algorithm in data mining. Its objective is to optimize the mean squared error (MSE). The traditional k-means algorithm is not suitable for applications where the sizes of clusters need to be balanced. Given n observations, our objective is to optimize the MSE under the constraint that the observations need to be evenly divided into k clusters. In this paper, we propose an iterative method for the task of clustering with balanced size constraints. Each iteration can be split into two steps, namely an assignment step and an update step. In the assignment step, the data are evenly assigned to each cluster. The balanced assignment task here is formulated as an integer linear program (ILP), and we prove that the constraint matrix of this ILP is totally unimodular. Thus the ILP is relaxed as a linear program (LP) which can be efficiently solved with the simplex algorithm. In the update step, the new centers are updated as the centroids of the observations in the clusters. Assuming that there are n observations and the algorithm needs m iterations to converge, we show that the average time complexity of the proposed algorithm is 𝑂(𝑚𝑛^1.65)–𝑂(𝑚𝑛^1.70). Experimental results indicate that, comparing with state-of-the-art methods, the proposed algorithm is efficient in deriving more accurate clustering.*

# Balance-Constraint-KMeans
## Summary
These are all the source files used in the paper of
```
Tang, W.; Yang, Y.; Zeng, L.; Zhan, Y. Optimizing MSE for Clustering with Balanced Size Constraints. Symmetry 2019, 11, 338. 
``` 
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


## Cite
```bibtex
@Article{sym11030338,
author = {Tang, Wei and Yang, Yang and Zeng, Lanling and Zhan, Yongzhao},
title = {Optimizing MSE for Clustering with Balanced Size Constraints},
journal = {Symmetry},
volumn = {11},
year = {2019},
number = {3},
}
```
```
paper link: https://www.mdpi.com/2073-8994/11/3/338
```
