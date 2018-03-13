#' Probability Function
#' 
#' The function calculating the Rasch probability
#' 
#' @param RaschObj An object of "Rasch" class
#' @param theta A proposed value of theta
#'  
#' @return A list of two vectors
#' \item{pr}{The probability function}
#' \item{pq}{The probability of yj taking the value given}
#' @author Jaerin Kim
#' @note This function is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", a=c(1:10), yj=rep(c(1,0),5))
#' pfun(atesttaker,2)
#' @seealso
#' @rdname pfun


setGeneric("pfun",function(RaschObj,theta){return("Wrong usage of the function. Refer to the documentation.")})
#' @export
setMethod("pfun", signature(RaschObj="Rasch",theta="numeric"),
           function(RaschObj,theta){
             ## Exactly the same function as in the exam question.
             ## Used 'rep' function to combat 'integrate' function errors
             ## In other words, theta is replaced with a vector of thetas with length of a.
             ## ('integrate' does not seem very flexible for an R function)
             pr<-exp(rep(theta,length(RaschObj@a))-RaschObj@a)/(1+exp(rep(theta,length(RaschObj@a))-RaschObj@a))
             ## pq returns pr if yj==1, 1-pr if yj==0.
             pq<-RaschObj@yj*pr+(1-RaschObj@yj)*(1-pr)
             return(list(pr=pr,pq=pq))
           })