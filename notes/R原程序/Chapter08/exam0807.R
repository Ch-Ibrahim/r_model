## 输入相关矩阵. 
x<- c(1.000, 0.846, 0.805, 0.859, 0.473, 0.398, 0.301, 0.382,
      0.846, 1.000, 0.881, 0.826, 0.376, 0.326, 0.277, 0.277, 
      0.805, 0.881, 1.000, 0.801, 0.380, 0.319, 0.237, 0.345, 
      0.859, 0.826, 0.801, 1.000, 0.436, 0.329, 0.327, 0.365, 
      0.473, 0.376, 0.380, 0.436, 1.000, 0.762, 0.730, 0.629, 
      0.398, 0.326, 0.319, 0.329, 0.762, 1.000, 0.583, 0.577, 
      0.301, 0.277, 0.237, 0.327, 0.730, 0.583, 1.000, 0.539, 
      0.382, 0.415, 0.345, 0.365, 0.629, 0.577, 0.539, 1.000)
names<-c("身高 x1", "手臂长 x2", "上肢长 x3", "下肢长 x4", "体重 x5", 
         "颈围 x6", "胸围 x7", "胸宽 x8")
r<-matrix(x, nrow=8, dimnames=list(names, names))
## 作系统聚类分析, 
## as.dist()的作用是将普通矩阵转化为聚类分析用的距离结构. 
d<-as.dist(1-r); hc<-hclust(d); dend<-as.dendrogram(hc)
## 写一段小程序, 其目的是在绘图命令中调用它, 使谱系图更好看.
nP<-list(col=3:2, cex=c(2.0, 0.75), pch= 21:22, 
         bg= c("light blue", "pink"),
         lab.cex = 1.0, lab.col = "tomato")
addE <- function(n){
   if(!is.leaf(n)) {
       attr(n, "edgePar") <- list(p.col="plum")
       attr(n, "edgetext") <- paste(attr(n,"members"),"members")
   }
   n
}
## 画出谱系图.
op<-par(mfrow=c(1,1), mar=c(4,3,0.5,0))
de <- dendrapply(dend, addE); plot(de, nodePar= nP)
par(op)

