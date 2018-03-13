rm(list=ls())
library(devtools)
library(roxygen2)
##Consider this as package "root"
packdir<-"c:/data/exam1/"
packname<-"easyRasch"
setwd(packdir)      ##Go to packdir
package.skeleton(packname)  ##Initial setup
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
file.copy("printe.R",paste(packname,"/R",sep=""))

## Check the description file before running the codes below

raschpack<-as.package(packname)
load_all(raschpack)
document(raschpack)
check(raschpack)
install(pkg=raschpack,local=TRUE)
build(raschpack,path=getwd())


## Rasch method for 'print' function is the representation of the whole process.
## Let's test it, with reasonable inputs.
print(new("Rasch",name="Bad Student",a=c(rep(1,3),rep(2,4),rep(3,3)),
          yj=c(1,rep(0,9))))
print(new("Rasch",name="Good Student",a=c(rep(1,3),rep(2,4),rep(3,3)),
          yj=c(rep(1,7),rep(0,3))))
print(new("Rasch",name="Best Student",a=c(rep(1,3),rep(2,4),rep(3,3)),
          yj=c(rep(1,10))))