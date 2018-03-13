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
#' @aliases pfun,ANY-method



#' @export
setGeneric("lfun",function(RaschObj,theta){return("Wrong usage of the function. Refer to the documentation.")})
#' @export
setMethod("lfun", signature(RaschObj="Rasch",theta="numeric"),
          function(RaschObj,theta){
            ## 
            pr<-exp(theta-RaschObj@a)/(1+exp(theta-RaschObj@a))
            ## pq returns pr if yj==1, 1-pr if yj==0.
            pq<-RaschObj@yj*pr+(1-RaschObj@yj)*(1-pr)
            return(list(pr,pq))
          })