#' Expected a posteriori value
#' 
#' The function calculating EAP
#' 
#' @param RaschObj An object of "Rasch" class
#' @param lower Lower limit of integration (default=-6)
#' @param upper Upper limit of integration (default=6)
#'  
#' @return Expected a posteriori value
#' @author Jaerin Kim
#' @note This function is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", a=c(1:10), yj=rep(c(1,0),5))
#' eap(atesttaker,-Inf,Inf)
#' @seealso
#' @rdname eap
#' @aliases eap,ANY-method

setGeneric("eap",function(RaschObj,lower=-6,upper=6){
  return("Wrong usage of the function. Refer to the documentation.")})
#' @export
setMethod("eap", signature(RaschObj="Rasch"),
          ##Setting default lower and upper bound, as instructed.
          function(RaschObj,lower=-6,upper=6){
          ## Setting numerator as the integrated value
          num<-integrate(function(theta){theta*lfun(RaschObj,theta)*prior(theta)},lower,upper)$value
          ## Setting denominator as the integrated value
          den<-integrate(function(theta){lfun(RaschObj,theta)*prior(theta)},lower,upper)$value
          return(num/den)
          })