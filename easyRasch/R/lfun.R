#' Likelihood Function
#' 
#' The function calculating the Rasch likelihood
#' 
#' @param RaschObj An object of "Rasch" class
#' @param theta A proposed value of theta
#'  
#' @return a vector
#' \item{}{The likelihood value}
#' @author Jaerin Kim
#' @note This function is just for the exam.
#' @examples
#' atesttaker<-new("Rasch", a=c(1:10), yj=rep(c(1,0),5))
#' lfun(atesttaker,2)
#' @seealso
#' @rdname lfun
#' @aliases lfun,ANY-method



#' @export
setGeneric("lfun",function(RaschObj,theta){return("Wrong usage of the function. Refer to the documentation.")})
#' @export
setMethod("lfun", signature(RaschObj="Rasch",theta="numeric"),
          function(RaschObj,theta){
            ##The likelihood function is simply a product of elements in vector pq.
            return(prod(pfun(RaschObj,theta)$pq))
          })