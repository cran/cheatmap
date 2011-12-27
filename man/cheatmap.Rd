\name{cheatmap}
\alias{cheatmap}
\title{ Main function for comparing heatmaps }
\description{
  Compare two heatmaps
}
\usage{
cheatmap (data1, data2,
                    scale="none", dendrogram="both",
                    matDist=0.5, matrixBorderCol = "grey",
                    colorStyle="s1",
                    rowGroup=rowGroup,
                    orderRowGroup=NULL,
                    rowGroupColor=FALSE,
                    rowGroupColor.choice,
                    groupBorder="line",
                    groupBorder.selectList=list(),
                    groupBorder.lwd=3,
                    groupBorder.col="green",
                    rowNameColor="blue",
                    colNameColor="blue",
                    rowNameFontSize=7,
                    colNameFontSize=8,
                    rowNameGroupColor=NULL,
                    clusterMethod="complete", clusterMembers=NULL,
                    clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=TRUE,
                    legend.pos="middle", legend.percent=0.4, legend.fontsize=8
                    )
}
\arguments{
	\item{data1}{numeric matrix 1. It is considered as the standard matrix. All cluster methods are applied to this matrix.}
	\item{data2}{numeric matrix 2. Its row order is same as that in data1. Its column order is either same as that in data1 or use separate cluster method.}
	\item{scale}{character. It takes three values: "row", "col", "none". It indicates whether or not the data matrix is scaled in row/column direction.}
  \item{dendrogram}{character. It takes three values: "row", "col", "both". It indicates whether or not to draw the row/col/both dendrogram.}
  \item{matDist}{the separate distance between two data matriex. If its value is 1, the distance between two matrix is exactly one data column.}
	\item{matrixBorderCol}{the color of the matrix border.}
	\item{colorStyle}{the color style for the matrix cell. It takes four values: "s1", "s2", "s3", "s4". s1 ranges from blue to red; s2 ranges from green to red; s3 uses a default color style from R package: pheatmap; s4 ranges from white to black.}
	\item{rowGroup}{Row group variable.}
	\item{orderRowGroup}{variable. The default value is "NULL". It is the row levels that should be ordered.}
	\item{rowGroupColor}{logical value. It takes two values: "TRUE", "FALSE". It indicates whether or not to draw the row group bar. }
	\item{rowGroupColor.choice}{character. It works when rowGroupColor is set as TRUE. The character length must match the unique groups in the rowGroup. If it is not specified, the colorstyle is used as default value. }
	\item{groupBorder}{character. It takes two values: "line", "rect". It controls the shape of the group border.}
	\item{groupBorder.selectList}{a list. It controls which group to be selected, which
    includes four components, "xgroup.start", "xgroup.end", "ygroup.start" and "ygroup.end".
    The selected groups will utilize the same graphical parameters as groupBorder.}
	\item{groupBorder.lwd}{numeric. It controls the line width of the groupBorder.}
	\item{groupBorder.col}{character. It controls the line color of the groupBorder.}
	\item{rowNameColor}{character string. It controls the label color of the row name.}
	\item{colNameColor}{character string. It controls the label color of the column name.}
	\item{rowNameFontSize}{numeric scalar. It controls the font size of the row name.}
	\item{colNameFontSize}{numeric scalar. It controls the font size of the column name. }
	\item{rowNameGroupColor}{character variable. The character length must match the
      unique groups in the rowGroup. It controls the color of different groups of row names. }
	\item{clusterMethod}{character. It takes the follow values: "ward", "single", "complete",
        "average", "mcquitty", "median" or "centroid".}
	\item{clusterMembers}{NULL or a vector with. See function: "hclust" for details.}
	\item{clusterRow}{logical. It takes two values: "TRUE", "FALSE". It indicates whether or not
      to cluster rows.}
	\item{clusterCol}{logical. It takes two values: "TRUE", "FALSE". It indicates whether or not
      to cluster columns.}
	\item{clusterColTogether}{logical. It takes two values: "TRUE", "FALSE". It indicates whether
    or not the columns of data matrix 2 follows the same clustering order of that in data matrix 1.
    If the column number of data matrix 2 is different from that of data matrix 1, only the columns
    matching those of data matrix 1 are reordered. }
 	\item{legend.pos}{character. It takes three values: "top", "middle", "bottom".
      It controls the position of the legend.}
	\item{legend.percent}{numeric. It takes value from 0 to 1. If its value is 1,
      the height of the legend will be equal to the height of the heatmap.}
	\item{legend.fontsize}{numeric. It controls the font size of the legend labels. }
}
\details{
To compare two heatmaps and discover links and patterns within and across groups. In the context of biology, group can be defined based on gene ontology or selected gene lists.

}
\value{
Invisibly return the row and column index for two matrices.
}
\author{Xiaoyong Sun}
\examples{
cheatmap(mtcars, mtcars)
cheatmap(mtcars, mtcars,  legend.percent=1, legend.pos="middle",
         groupBorder.selectList=list(xgroup.start=c(2,7), xgroup.end=c(4,9), ygroup.start=c(3,30),
         ygroup.end=c(10,32)))
cheatmap(mtcars, mtcars, scale="row", colorStyle="s3",
         groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11),
         ygroup.start=c(11), ygroup.end=c(15)),
         legend.pos="top")
cheatmap(mtcars, mtcars,
dendrogram="both", colorStyle="s1", rowGroup=mtcars$gear,
                    rowGroupColor=TRUE,
                    rowGroupColor.choice = rev(c("blue", "orange", "green")),
                    groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25))
                    ,legend.pos="top", legend.percent=0.6, legend.fontsize=5, orderRowGroup=c(5, 4,3),
                    clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=TRUE
                    )
mtcars2 <- mtcars[, rev(1:ncol(mtcars))]
cheatmap(mtcars, mtcars2,
dendrogram="both", colorStyle="s1", rowGroup=mtcars$gear,
                    rowGroupColor=TRUE,
                    rowGroupColor.choice = rev(c("blue", "orange", "green")),
                    groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25))
                    ,legend.pos="top", legend.percent=0.6, legend.fontsize=5, orderRowGroup=c(5, 4,3),
                    clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE
                    )
cheatmap(mtcars, mtcars,
dendrogram="both", colorStyle="s1", rowGroup=mtcars$am,
                    rowGroupColor=TRUE,
                    groupBorder.selectList=list(xgroup.start=c(8), xgroup.end=c(11), ygroup.start=c(22), ygroup.end=c(25))
                    ,legend.pos="top", legend.percent=0.6, legend.fontsize=5,
                    orderRowGroup=c(0,1),
                    clusterRow=TRUE, clusterCol=TRUE, clusterColTogether=FALSE
                    )
}
\keyword{ methods}

