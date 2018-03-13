rm(list=ls())
library(devtools)
library(roxygen2)
##Consider this as package "root"
packdir<-"c:/data/exam1/"
packname<-"easyRasch"
setwd(packdir)      ##Go to packdir
package.skeleton()  ##Initial setup
file.rename("anRpackage", packname) ## change the default name to packname
setwd(packname)     ## Delete unnecessary/contradicting files
file.remove(c("Read-and-delete-me","NAMESPACE"))
setwd("man")
file.remove(dir())
setwd(paste(packdir,packname,"/R",sep=""))
file.remove(dir())
setwd(packdir)
## Copying the main R file scripts on "packdir" directory to "R" directory.
file.copy("class.R",paste(packname,"/R",sep=""))
file.copy("pfun.R",paste(packname,"/R",sep=""))
file.copy("lfun.R",paste(packname,"/R",sep=""))
file.copy("prior.R",paste(packname,"/R",sep=""))
file.copy("eap.R",paste(packname,"/R",sep=""))
file.copy("print.R",paste(packname,"/R",sep=""))

## Check the description file before running the codes below

raschpack<-as.package(packname)
load_all(raschpack)
document(raschpack)
check(raschpack)
install(pkg=raschpack,local=TRUE)
build(raschpack,path=getwd())