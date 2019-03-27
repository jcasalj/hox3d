# http://www.sthda.com/english/wiki/impressive-package-for-3d-and-4d-graph-r-software-and-data-visualization#functions-for-scatter-plots-and-texts-in-2d-and-3d

# -----------------  User input  --------------------

# replace read_excel(name_File) with read_csv(name_File)
# if data is in a different type of file

# EDIT the next two lines with main_Title and name_File !!!!!

# ---------------------------------------------------

main_Title <-
  c("Hox") # Write title between quotation marks

name_File <-
  c("jesus.xlsx") # Write data filename between quotation marks

# --------------  loading packages   ----------------

extras <-
  c("plot3D", "readxl", "tools")
if (length(setdiff(extras, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(extras, rownames(installed.packages())))
}

# ---------------------------------------------------

lapply(extras, require, character.only = TRUE)

# ---------------------------------------------------

pdfOutput <-
  paste(file_path_sans_ext(basename(name_File)), ".pdf", sep = "")


# dt <- read.csv(name_File)

dt <- read_excel(name_File)

par(mar=c(1,1,1,1))

pdf(pdfOutput, width = 20, height = 20)

par(mfrow=c(4,3))

for(i in 1:length(unique(dt$Segment))) {
  scatter3D(x=subset(dt$Antp, dt$Segment == unique(dt$Segment)[i]), 
            y=subset(dt$Ubx, dt$Segment == unique(dt$Segment)[i]), 
            z=subset(dt$abdA, dt$Segment == unique(dt$Segment)[i]), 
            phi = 0, theta = 50, bty = "g", pch = 19, cex = 2, 
            ticktype = "detailed", col = gg.col(100),
            colkey = list(side = 4, length = 0.5),
            colvar = subset(dt$Antp, dt$Segment == unique(dt$Segment)[i]), 
            xlab="Antp", ylab="Ubx", zlab="abdA", clab=c("Antp","expression level"),
            xlim=c(0,100), ylim=c(0,100), zlim=c(0,100),clim=c(0,100))
  title(paste("Segment: ", unique(dt$Segment)[i], sep=""))      
}

dev.off()



