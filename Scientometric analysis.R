library(bibliometrix)


#Reading data
file <- 'C:/Users/ICRISATZW/Downloads/savedrecs.bib'

M <- convert2df(file = file, dbsource = "isi", format = "bibtex")

results <- biblioAnalysis(M, sep = ";")

options(width=100)
S <- summary(object = results, k = 10, pause = FALSE)

plot(x = results, k = 10, pause = FALSE)

CR <- citations(M, field = "article", sep = ";")
cbind(CR$Cited[1:10])
#Top-Authors' Productivity over the Time
topAU <- authorProdOverTime(M, k = 10, graph = TRUE)
## Table: Author's productivity per year
head(topAU$dfAU)
# Author Productivity. Empirical Distribution
L$AuthorProd

# Beta coefficient estimate
L$Beta

# Constant
L$C

# Goodness of fit
L$R2

# P-value of K-S two sample test
L$p.value

#Country Scientific Collaboration
# Create a country collaboration network

M <- metaTagExtraction(M, Field = "AU_CO", sep = ";")
NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "countries", sep = ";")

# Plot the network
net=networkPlot(NetMatrix, n = dim(NetMatrix)[1], Title = "Country Collaboration", type = "circle", size=TRUE, remove.multiple=FALSE,labelsize=0.7,cluster="none")
#Co-Citation Network
# Create a co-citation network

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")

# Plot the network
net=networkPlot(NetMatrix, n = 30, Title = "Co-Citation Network", type = "fruchterman", size=T, remove.multiple=FALSE, labelsize=0.7,edgesize = 5)
#Co-Word Analysis

# Conceptual Structure using keywords (method="CA")

CS <- conceptualStructure(M,field="ID", method="CA", minDegree=4, clust=5, stemming=FALSE, labelsize=10, documents=10)
#Plot a historical co-citation network
net <- histPlot(histResults, n=15, size = 10, labelsize=5)
# Conceptual Structure using keywords
CS <- conceptualStructure(M,field="ID", minDegree=4, k.max=5, stemming=FALSE)

